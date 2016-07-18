namespace Microsoft.P2Boogie

module Translator =

  open System
  open Syntax
  open Helper
  open Common
  open ProgramTyping
  open RemoveSideEffects

  (* Translation of normalized side-effect-free programs to Boogie *)

  let Typmap = ref Map.empty
  let TypmapIndex = ref 0

  let GetTypeIndex t = 
    if Map.containsKey t !Typmap then Map.find t !Typmap
    else begin
      let ret = !TypmapIndex
      Typmap := Map.add t ret !Typmap
      TypmapIndex := ret + 1
      ret
    end

  let GetAllTypes () =
    Map.fold (fun state key _ -> Set.add key state) Set.empty !Typmap

  let translateType t =
    match t with
    | Null -> "PrtTypeNull"
    | Bool -> "PrtTypeBool"
    | Int -> "PrtTypeInt"
    | Machine -> "PrtTypeMachine"
    | Type.Event -> "PrtTypeEvent"
    | Type.NamedTuple(_) -> raise NotDefined
    | Type.ModelType s -> sprintf "PrtTypeModel%s" s
    | Any -> raise NotDefined
    | Type.Tuple(ls) -> sprintf "PrtTypeTuple%d" (List.length ls)
    | Type.Seq(t1) -> sprintf "PrtTypeSeq%d" (GetTypeIndex t)
    | Type.Map(t1, t2) -> sprintf "PrtTypeMap%d" (GetTypeIndex t)

  let rec translateExpr (G:Map<string, Type>) (evMap: Map<string, int>) expr =
    match expr with
    | Nil -> "null"
    | Expr.ConstInt(i) -> sprintf "PrtConstructFromInt(%d)" i 
    | Expr.ConstBool(b) -> if b then "PrtTrue" else "PrtFalse"
    | Expr.This -> "null" (* TODO: Fix *)
    | Expr.New(_,_) -> "PrtConstructFromMachine(1)" (* TODO: Fix *)
    | Expr.Default t when t = Null || t = Machine || t = Type.Event || t = Any -> "null"
    | Expr.Default Int -> "PrtConstructFromInt(0)"
    | Expr.Default Bool -> "PrtFalse"
    | Expr.Event s -> sprintf "PrtConstructFromEvent(%d)" (Map.find s evMap)
    | Expr.Var(v) -> v
    | Expr.Bin(op, e1, e2) when  isIntop(op) -> sprintf "PrtConstructFromInt(PrtFieldInt(%s) %s PrtFieldInt(%s))" (translateExpr G evMap e1) (printBinop op) (translateExpr G evMap e2)
    | Expr.Bin(op, e1, e2) when  isRelop(op) -> sprintf "PrtConstructFromBool(PrtFieldInt(%s) %s PrtFieldInt(%s))" (translateExpr G evMap e1) (printBinop op) (translateExpr G evMap e2)
    | Expr.Bin(op, e1, e2) when  isBoolop(op) -> sprintf "PrtConstructFromBool(PrtFieldBool(%s) %s PrtFieldBool(%s))" (translateExpr G evMap e2) (printBinop op) (translateExpr G evMap e2)
    | Expr.Bin(op, e1, e2) when  isComparison(op) -> raise NotDefined
    | Expr.Bin(Idx, e1, e2) -> raise NotDefined
    | Expr.Bin(In, e1, e2) -> raise NotDefined
    | Expr.Un(Not, e) -> sprintf "PrtConstructFromBool(!PrtFieldBool(%s))" (translateExpr G evMap e)
    | Expr.Un(Neg, e) -> sprintf "PrtConstructFromInt(0 - PrtFieldInt(%s))" (translateExpr G evMap e)
    | Expr.Un(Sizeof, e) when isSeq (typeof e G) -> sprintf "PrtConstructFromInt(PrtFieldSeqSize(%s))" (translateExpr G evMap e)
    | Expr.Un(Sizeof, e) -> sprintf "PrtConstructFromInt(PrtFieldMapSize(%s))" (translateExpr G evMap e)
    | Expr.Dot(e, f) -> sprintf "PrtFieldTuple%d(%s)" f (translateExpr G evMap e)
    | _ -> raise NotDefined

  let typesAsserted = ref Set.empty

  let translateAssign G evMap lval expr  =
    let genRhsValue e G =
        let rhsVar = "tmpRhsValue" in
        printfn "%s := %s;" rhsVar (translateExpr G evMap e)
        rhsVar
    in
    let getLhsVar lval = match lval with
                            | Lval.Var(v) -> v
                            | _ -> raise NotDefined
    in
    let rec setTypesAsserted t =
        typesAsserted := Set.add t !typesAsserted
        match t with
        | Type.Tuple ts -> List.iter setTypesAsserted ts
        | _ -> ()
    match (lval, expr) with 
    | _, Expr.Cast(e, t) -> 
        begin
            (* evaluate rhs *)
            let rhsVar = genRhsValue e G in
            (* generate type assertion *)
            setTypesAsserted t
            printfn "call AssertIsType%d(%s);" (GetTypeIndex t) rhsVar
            (* the assignment *)
            printfn "%s := %s;" (getLhsVar lval) rhsVar      
        end
    | _, Expr.Tuple(es) ->
        begin
            for i = 0 to (List.length es) - 1 do
            let ei = (List.nth es i) in
            printfn "tmpRhsValue_%d := %s;" i (translateExpr G evMap ei)
            printfn "call %s := AllocatePrtRef();" (getLhsVar lval)
            printfn "assume PrtDynamicType(%s) == PrtTypeTuple%d;" (getLhsVar lval) (List.length es)
            for i = 0 to (List.length es) - 1 do
            printfn "assume PrtFieldTuple%d(%s) == tmpRhsValue_%d;" i (getLhsVar lval) i
        end
    | _, Expr.Call(callee, args) ->
        begin
            printfn "call %s := %s(%s);" (getLhsVar lval) callee (printList (translateExpr G evMap) args ", ")
        end
    | _, Expr.Default(Seq(t)) ->
        begin
            printfn "call %s := AllocatePrtRef();" (getLhsVar lval)
            printfn "assume PrtDynamicType(%s) == PrtTypeSeq%d;" (getLhsVar lval) (GetTypeIndex (Seq(t)))
            printfn "assume PrtFieldSeqSize(%s) == 0;" (getLhsVar lval) 
        end
    | _, Expr.Default(Map(t1, t2)) ->
        begin
            printfn "call %s := AllocatePrtRef();" (getLhsVar lval)
            printfn "assume PrtDynamicType(%s) == PrtTypeMap%d;" (getLhsVar lval) (GetTypeIndex (Map(t1, t2)))
            printfn "assume PrtFieldMapSize(%s) == 0;" (getLhsVar lval) 
        end
    | _, Expr.Bin(Idx, e1, e2) ->
        begin
            match isMap (typeof e1 G) with
            | true ->  printfn "call %s := ReadMap(%s, %s);" (getLhsVar lval) (translateExpr G evMap e1) (translateExpr G evMap e2)
            | false -> printfn "assert SeqIndexInBounds(%s, PrtFieldInt(%s)); %s := ReadSeq(%s, PrtFieldInt(%s));" (translateExpr G evMap e1) (translateExpr G evMap e2) (getLhsVar lval) (translateExpr G evMap e1) (translateExpr G evMap e2)
        end
    | _, Expr.Bin(In, e1, e2) ->
        begin
            printfn "call %s := MapContainsKey(%s, %s);" (getLhsVar lval) (translateExpr G evMap e1) (translateExpr G evMap e2)
        end
    | _, Expr.Bin(Eq, e1, e2) ->
        begin
            printfn "call %s := PrtEquals(%s, %s);" (getLhsVar lval) (translateExpr G evMap e1) (translateExpr G evMap e2)
        end
    | _, Expr.Un(Keys, e) ->
        begin
            printfn "call %s := MapGetKeys(%s);" (getLhsVar lval) (translateExpr G evMap e)
        end
    | _, Expr.Un(Values, e) ->
        begin
            printfn "call %s := MapGetValues(%s);" (getLhsVar lval) (translateExpr G evMap e)
        end
    | _, Expr.Nondet ->
        begin
            printfn "havoc %s;" (getLhsVar lval) 
        end
    | Lval.Index(Lval.Var(lhsVar), e), _ when isSeq (typeofLval (Lval.Var(lhsVar)) G) ->
        begin
            printfn "call %s := WriteSeq(%s, PrtFieldInt(%s), %s);" lhsVar lhsVar (translateExpr G evMap e) (translateExpr G evMap expr)
        end
    | Lval.Index(Lval.Var(lhsVar), e), _ ->
        begin
            printfn "call %s := WriteMap%s, %s, %s);" lhsVar lhsVar (translateExpr G evMap e) (translateExpr G evMap expr)
        end
    | _, _ ->
        printfn "%s := %s;" (getLhsVar lval) (translateExpr G evMap expr)

  let translateInsert G evMap v e1 e2 =
    match isSeq (typeof (Expr.Var(v)) G) with
    | true -> printfn "call %s := InsertSeq(%s, PrtFieldInt(%s), %s);" v v (translateExpr G evMap e1) (translateExpr G evMap e2)
    | false -> printfn "call %s := InsertMap(%s, PrtFieldInt(%s), %s);" v v (translateExpr G evMap e1) (translateExpr G evMap e2)

  let translateRemove G evMap v e1 =
    match isSeq (typeof (Expr.Var(v)) G) with
    | true -> printfn "call %s := RemoveSeq(%s, PrtFieldInt(%s));" v v (translateExpr G evMap e1)
    | false -> printfn "call %s := RemoveMap(%s, PrtFieldInt(%s));" v v (translateExpr G evMap e1)

  let translateStmt G evMap stmt =
    match stmt with
    | Assign(l, e) -> translateAssign G evMap l e
    | Insert(Lval.Var(v), e1, e2) -> translateInsert G evMap v e1 e2
    | Remove(Lval.Var(v), e1) -> translateRemove G evMap v e1
    | Assume(e) -> printfn "assume PrtFieldBool(%s);" (translateExpr G evMap e)
    | _ -> raise NotDefined

  let printfnComment x = 
    printf "// "
    printfn x

  let printEquals maxFields =
    printfn "// Equals
  procedure PrtEquals(a: PrtRef, b: PrtRef) returns (v: bool)
  {
    var ta, tb: PrtType;

    if(a == b) { v := true; return; }

    ta := PrtDynamicType(a);
    tb := PrtDynamicType(b);

    if(ta != tb) { v := false; return; }
    if(ta == PrtTypeInt) { v := (PrtFieldInt(a) == PrtFieldInt(b)); return; }
    if(ta == PrtTypeBool) { v := (PrtFieldBool(a) == PrtFieldBool(b)); return; }
    if(ta == PrtTypeMachine) { v := (PrtFieldMachine(a) == PrtFieldMachine(b)); return; }
    if(ta == PrtTypeEvent) { v := (PrtFieldEvent(a) == PrtFieldEvent(b)); return; }
    "
  
    for i = 1 to maxFields do
        printfn "  if(ta == PrtTypeTuple%d) { call v := PrtEqualsTuple%d(a,b); return; }" i i
    
    printfn "
    // Map, Seq type
    assume false;
  }        
    "
    for i = 1 to maxFields do
        printfn "procedure PrtEqualsTuple%d(x: PrtRef, y: PrtRef) returns (v: bool) {" i
        for j = 0 to (i-1) do
        printfn "  call v := PrtEquals(PrtFieldTuple%d(x), PrtFieldTuple%d(y));" j j
        if j <> (i-1) then printfn "  if(!v) { return; }"
        printfn "}"
 
  let printTypeCheck t =
    let tindex =  GetTypeIndex t  in
    printfn "// Type %s" (printType t)
    printfn "procedure AssertIsType%d(x: PrtRef) {" tindex
    match t with
    | Null -> raise NotDefined
    | Any -> raise NotDefined
    | Bool 
    | Seq(_)
    | Map(_, _)
    | Int -> printfn "  assert PrtDynamicType(x) == %s;" (translateType t)
    | Machine
    | Type.Event -> printfn "  assert PrtDynamicType(x) == %s || PrtIsNull(x);" (translateType t)
    | Type.NamedTuple(_) -> raise NotDefined
    | Type.ModelType s -> printfn "  assert PrtDynamicType(x) == PrtTypeModel%s;" s
    | Type.Tuple ts ->
    begin
        printfn "  assert PrtDynamicType(x) == PrtTypeTuple%d;" (List.length ts)
        for i = 0 to ((List.length ts) - 1) do
        let ti = List.nth ts i in
        printfn "  call AssertIsType%d(PrtFieldTuple%d(x));" (GetTypeIndex ti) i
    end
    printfn "}"
   
  let getEventMaps d trans (events: Map<string, int>) = 
    let regEvents = ref (events |> Map.toSeq |> Seq.map (fun (k, v) -> (v, false)) |> Map.ofSeq) 
    let igEvents  = ref (events |> Map.toSeq |> Seq.map (fun (k, v) -> (v, false)) |> Map.ofSeq)  
    let defEvents = ref (events |> Map.toSeq |> Seq.map (fun (k, v) -> (v, false)) |> Map.ofSeq) 
    for l in d do
      match l with
      | DoDecl.T.Ignore(e) -> 
        begin
          let evId = events.[e]
          regEvents := Map.add evId true !regEvents
          igEvents  := Map.add evId true !igEvents 
        end
      | DoDecl.T.Defer(e) ->
        begin
          let evId = events.[e]
          regEvents := Map.add evId true !regEvents
          defEvents := Map.add evId true !defEvents 
        end
      | DoDecl.T.Call(e, _) -> 
        begin
          let evId = events.[e]
          regEvents := Map.add evId true !regEvents
        end
    for l in trans do
      match l with
      | TransDecl.T.Call(e,_,_) | TransDecl.T.Push(e,_) ->
        begin
          let evId = events.[e]
          regEvents := Map.add evId true !regEvents
        end
   
    List.zip [!regEvents; !igEvents; !defEvents] ["registeredEvents" ; "ignoredEvents"; "deferredEvents"]
  
  let printEvDict (evDict, name)= 
    evDict |> Map.map (fun k v ->(sprintf "%s[%d] = %b;" name k v)) |> Map.toSeq 
    |> Seq.map snd |> String.concat "\n"

              
  let translateState (stateToInt: Map<string, int>) (events: Map<string, int>) (state: StateDecl) = 
    let ifst = sprintf "if(CurrState == %d)" stateToInt.[state.Name]
    let setVars = getEventMaps state.Dos state.Transitions events |> List.map printEvDict |> String.concat "\n"
    ""

  ///Returns a string representing a Boogie function of the translated machine.
  let translateMachine prog G events (md: MachineDecl) = 
    let stateToInt =  [for i in md.States do yield i.Name] |> Seq.mapi (fun i x -> x,i) |> Map.ofSeq
    let translatedStates = md.States |> List.map (translateState stateToInt events) |> String.concat "\nelse "
    let machineThreadDecl = sprintf "procedure %sMachineThread(mid: int)" md.Name
    let machVarDecls =["var registeredEvents: [int]bool;"; "var ignoredEvents: [int]bool;" ; "var deferredEvents: [int]bool;"] //ToDo add machine variables too.
    let start = ""
    ""
   
  //[<EntryPoint>]
  let translateProg (prog: ProgramDecl) = 
  (* Top-level types *)
    printfn "type PrtType;";
    printfn "const unique %s: PrtType;" (translateType Null)
    printfn "const unique %s: PrtType;" (translateType Int)
    printfn "const unique %s: PrtType;" (translateType Bool)
    printfn "const unique %s: PrtType;" (translateType Machine)
    printfn "const unique %s: PrtType;" (translateType Type.Event)
    for i = 1 to prog.maxFields do
        printfn "const unique PrtTypeTuple%d: PrtType;" i
    Set.iter (fun t -> 
        match t with
        | Seq _ -> printfn "const unique PrtTypeSeq%d: PrtType; // %s" (GetTypeIndex t) (printType t)
        | Map _ -> printfn "const unique PrtTypeMap%d: PrtType; // %s" (GetTypeIndex t) (printType t)
        | _ -> ()
        ) (GetAllTypes())
  
    (* ref type *)
    printfn "type PrtRef;"
    printfn "const unique null: PrtRef;"
    printfn "const unique PrtTrue: PrtRef;"
    printfn "const unique PrtFalse: PrtRef;"

    (* runtime type *)
    printfn "function PrtDynamicType(PrtRef):PrtType;"
    printfn ""

    (* fields *)
    printfn "function PrtIsNull(PrtRef) : bool;" 
    printfn "function PrtFieldInt(PrtRef) : int;" 
    printfn "function PrtFieldBool(PrtRef) : bool;" 
    printfn "function PrtFieldMachine(PrtRef) : int;" 
    printfn "function PrtFieldEvent(PrtRef) : int;" 
    for i = 0 to (prog.maxFields-1) do 
        printfn "function PrtFieldTuple%d(PrtRef) : PrtRef;" i 
    printfn "function PrtFieldSeqStore(PrtRef) : [int]PrtRef;" 
    printfn "function PrtFieldSeqSize(PrtRef) : int;" 
    printfn "function PrtFieldMapKeys(PrtRef) : [int]PrtRef;" 
    printfn "function PrtFieldMapValues(PrtRef) : [int]PrtRef;" 
    printfn "function PrtFieldMapSize(PrtRef) : int;" 
    printfn "" 

    (* constructors of basic types *)
    printfn "axiom (PrtDynamicType(null) == %s);" (translateType Null)
    printfn "axiom (PrtIsNull(null) == true);" 
    printfn "axiom (forall x : PrtRef :: {PrtIsNull(x)} x == null || !PrtIsNull(x));"
    printfn ""
    printfn "function PrtConstructFromInt(int) : PrtRef;" 
    printfn "axiom (forall x : int :: {PrtFieldInt(PrtConstructFromInt(x))} PrtFieldInt(PrtConstructFromInt(x)) == x);" 
    printfn "axiom (forall x : int :: {PrtDynamicType(PrtConstructFromInt(x))} PrtDynamicType(PrtConstructFromInt(x)) == %s);" (translateType Int)
    printfn ""
    printfn "function {:inline} PrtConstructFromBool(v: bool) : PrtRef"
    printfn "{ if v then PrtTrue else PrtFalse }"
    printfn "axiom (PrtFieldBool(PrtTrue));"
    printfn "axiom (!PrtFieldBool(PrtFalse));"
    printfn "axiom (PrtDynamicType(PrtTrue) == %s);" (translateType Bool)
    printfn "axiom (PrtDynamicType(PrtFalse) == %s);" (translateType Bool)
    printfn ""
    printfn "function PrtConstructFromMachineId(int) : PrtRef;" 
    printfn "axiom (forall x : int :: {PrtFieldMachine(PrtConstructFromMachineId(x))} PrtFieldMachine(PrtConstructFromMachineId(x)) == x);" 
    printfn "axiom (forall x : int :: {PrtDynamicType(PrtConstructFromMachineId(x))} PrtDynamicType(PrtConstructFromMachineId(x)) == %s);" (translateType Machine)
    printfn ""
    printfn "function PrtConstructFromEventId(int) : PrtRef;" 
    printfn "axiom (forall x : int :: {PrtFieldEvent(PrtConstructFromEventId(x))} PrtFieldEvent(PrtConstructFromEventId(x)) == x);" 
    printfn "axiom (forall x : int :: {PrtDynamicType(PrtConstructFromEventId(x))} PrtDynamicType(PrtConstructFromEventId(x)) == %s);" (translateType Type.Event)
    printfn ""


    (* Allocation *)
    printfn "procedure {:allocator} AllocatePrtRef() returns (x: PrtRef);"
    printfn "  //ensures x != null;"
    printfn ""

    (* Sequence *)
    printfn "function {:inline} SeqIndexInBounds(seq: PrtRef, index: int) : bool"
    printfn "{ 0 <= index && index < PrtFieldSeqSize(seq) }"
    printfn ""
    printfn "function {:inline} ReadSeq(seq: PrtRef, index: int) : PrtRef"
    printfn "{ PrtFieldSeqStore(seq)[index] }"
    printfn ""

    (*printfn "procedure main() {"
    Map.iter (fun k v -> printfn "  var %s: PrtRef; // %s" k (printType v)) G
    printfn "  var tmpRhsValue: PrtRef;"
    for i = 0 to prog.maxFields-1 do
        printfn "  var tmpRhsValue_%d: PrtRef;" i
    List.iter (fun s -> 
        begin
        printfnComment "%s" (printStmt s)
        translateStmt s G 
        end
    ) stmtlist *)
    //printfn "}"

    (* Equals *)
    printEquals(prog.maxFields)
    
    (* AssertIsType *)
    Set.iter (fun t -> printTypeCheck t) !typesAsserted

    let s = IO.File.ReadAllLines("CommonBpl.bpl") in
    Array.iter (fun s -> printfn "%s" s) s
    0 // return an integer exit code