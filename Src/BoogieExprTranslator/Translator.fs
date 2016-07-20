namespace Microsoft.P2Boogie

module Translator =

  open System
  open Syntax
  open Helper
  open Common
  open ProgramTyping
  open RemoveSideEffects
  open System.IO
(*
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

  let translateAssign sw G evMap lval expr  =
    let genRhsValue e G =
        let rhsVar = "tmpRhsValue" in
        fprintfn sw "%s := %s;" rhsVar (translateExpr G evMap e)
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
            fprintfn sw "call AssertIsType%d(%s);" (GetTypeIndex t) rhsVar
            (* the assignment *)
            fprintfn sw "%s := %s;" (getLhsVar lval) rhsVar      
        end
    | _, Expr.Tuple(es) ->
        begin
            for i = 0 to (List.length es) - 1 do
            let ei = (List.item i es) in
            fprintfn sw "tmpRhsValue_%d := %s;" i (translateExpr G evMap ei)
            fprintfn sw "call %s := AllocatePrtRef();" (getLhsVar lval)
            fprintfn sw "assume PrtDynamicType(%s) == PrtTypeTuple%d;" (getLhsVar lval) (List.length es)
            for i = 0 to (List.length es) - 1 do
            fprintfn sw "assume PrtFieldTuple%d(%s) == tmpRhsValue_%d;" i (getLhsVar lval) i
        end
    | _, Expr.Call(callee, args) ->
        begin
            fprintfn sw "call %s := %s(%s);" (getLhsVar lval) callee (printList (translateExpr G evMap) args ", ")
        end
    | _, Expr.Default(Seq(t)) ->
        begin
            fprintfn sw "call %s := AllocatePrtRef();" (getLhsVar lval)
            fprintfn sw "assume PrtDynamicType(%s) == PrtTypeSeq%d;" (getLhsVar lval) (GetTypeIndex (Seq(t)))
            fprintfn sw "assume PrtFieldSeqSize(%s) == 0;" (getLhsVar lval) 
        end
    | _, Expr.Default(Map(t1, t2)) ->
        begin
            fprintfn sw "call %s := AllocatePrtRef();" (getLhsVar lval)
            fprintfn sw "assume PrtDynamicType(%s) == PrtTypeMap%d;" (getLhsVar lval) (GetTypeIndex (Map(t1, t2)))
            fprintfn sw "assume PrtFieldMapSize(%s) == 0;" (getLhsVar lval) 
        end
    | _, Expr.Bin(Idx, e1, e2) ->
        begin
            match isMap (typeof e1 G) with
            | true ->  fprintfn sw "call %s := ReadMap(%s, %s);" (getLhsVar lval) (translateExpr G evMap e1) (translateExpr G evMap e2)
            | false -> fprintfn sw "assert SeqIndexInBounds(%s, PrtFieldInt(%s)); %s := ReadSeq(%s, PrtFieldInt(%s));" (translateExpr G evMap e1) (translateExpr G evMap e2) (getLhsVar lval) (translateExpr G evMap e1) (translateExpr G evMap e2)
        end
    | _, Expr.Bin(In, e1, e2) ->
        begin
            fprintfn sw "call %s := MapContainsKey(%s, %s);" (getLhsVar lval) (translateExpr G evMap e1) (translateExpr G evMap e2)
        end
    | _, Expr.Bin(Eq, e1, e2) ->
        begin
            fprintfn sw "call %s := PrtEquals(%s, %s);" (getLhsVar lval) (translateExpr G evMap e1) (translateExpr G evMap e2)
        end
    | _, Expr.Un(Keys, e) ->
        begin
            fprintfn sw "call %s := MapGetKeys(%s);" (getLhsVar lval) (translateExpr G evMap e)
        end
    | _, Expr.Un(Values, e) ->
        begin
            fprintfn sw "call %s := MapGetValues(%s);" (getLhsVar lval) (translateExpr G evMap e)
        end
    | _, Expr.Nondet ->
        begin
            fprintfn sw "havoc %s;" (getLhsVar lval) 
        end
    | Lval.Index(Lval.Var(lhsVar), e), _ when isSeq (typeofLval (Lval.Var(lhsVar)) G) ->
        begin
            fprintfn sw "call %s := WriteSeq(%s, PrtFieldInt(%s), %s);" lhsVar lhsVar (translateExpr G evMap e) (translateExpr G evMap expr)
        end
    | Lval.Index(Lval.Var(lhsVar), e), _ ->
        begin
            fprintfn sw "call %s := WriteMap%s, %s, %s);" lhsVar lhsVar (translateExpr G evMap e) (translateExpr G evMap expr)
        end
    | _, _ ->
        fprintfn sw "%s := %s;" (getLhsVar lval) (translateExpr G evMap expr)

  let translateInsert sw G evMap v e1 e2 =
    match isSeq (typeof (Expr.Var(v)) G) with
    | true -> fprintfn sw "call %s := InsertSeq(%s, PrtFieldInt(%s), %s);" v v (translateExpr G evMap e1) (translateExpr G evMap e2)
    | false -> fprintfn sw "call %s := InsertMap(%s, PrtFieldInt(%s), %s);" v v (translateExpr G evMap e1) (translateExpr G evMap e2)

  let translateRemove sw G evMap v e1 =
    match isSeq (typeof (Expr.Var(v)) G) with
    | true -> fprintfn sw "call %s := RemoveSeq(%s, PrtFieldInt(%s));" v v (translateExpr G evMap e1)
    | false -> fprintfn sw "call %s := RemoveMap(%s, PrtFieldInt(%s));" v v (translateExpr G evMap e1)

  let translateStmt sw G evMap stmt =
    match stmt with
    | Assign(l, e) -> translateAssign sw G evMap l e
    | Insert(Lval.Var(v), e1, e2) -> translateInsert sw G evMap v e1 e2
    | Remove(Lval.Var(v), e1) -> translateRemove sw G evMap v e1
    | Assume(e) -> fprintfn sw "assume PrtFieldBool(%s);" (translateExpr G evMap e)
    | _ -> raise NotDefined

  let fprintfnComment sw x = 
    fprintf sw "// "
    fprintfn sw x

  let printEquals sw maxFields =
    fprintfn sw "// Equals
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
        fprintfn sw "  if(ta == PrtTypeTuple%d) { call v := PrtEqualsTuple%d(a,b); return; }" i i
    
    fprintfn sw "
    // Map, Seq type
    assume false;
  }        
    "
    for i = 1 to maxFields do
        fprintfn sw "procedure PrtEqualsTuple%d(x: PrtRef, y: PrtRef) returns (v: bool) {" i
        for j = 0 to (i-1) do
        fprintfn sw "  call v := PrtEquals(PrtFieldTuple%d(x), PrtFieldTuple%d(y));" j j
        if j <> (i-1) then fprintfn sw "  if(!v) { return; }"
        fprintfn sw "}"
 
  let printTypeCheck sw t =
    let tindex =  GetTypeIndex t  in
    fprintfn sw "// Type %s" (printType t)
    fprintfn sw "procedure AssertIsType%d(x: PrtRef) {" tindex
    match t with
    | Null -> raise NotDefined
    | Any -> raise NotDefined
    | Bool 
    | Seq(_)
    | Map(_, _)
    | Int -> fprintfn sw "  assert PrtDynamicType(x) == %s;" (translateType t)
    | Machine
    | Type.Event -> fprintfn sw "  assert PrtDynamicType(x) == %s || PrtIsNull(x);" (translateType t)
    | Type.NamedTuple(_) -> raise NotDefined
    | Type.ModelType s -> fprintfn sw "  assert PrtDynamicType(x) == PrtTypeModel%s;" s
    | Type.Tuple ts ->
    begin
        fprintfn sw "  assert PrtDynamicType(x) == PrtTypeTuple%d;" (List.length ts)
        for i = 0 to ((List.length ts) - 1) do
        let ti = List.item i ts in
        fprintfn sw "  call AssertIsType%d(PrtFieldTuple%d(x));" (GetTypeIndex ti) i
    end
    fprintfn sw "}"
   
  let getEventMaps d trans hasDefer hasIgnore (events: Map<string, int>) = 
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
    let l1 = [!regEvents] @ (if hasIgnore then [!igEvents] else []) 
              @ (if hasDefer then [!defEvents] else [])
    let l2 = ["registeredEvents"] @ (if hasIgnore then ["ignoredEvents"] else []) 
              @ (if hasDefer then ["deferredEvents"] else [])
    
    List.zip l1 l2
  
  let printEvDict sw (evDict, name)= 
    Map.iter (fun k v ->(fprintf sw "    %s[%d] = %b;" name k v)) evDict 

  let translateDos sw events (d: DoDecl.T) =
    match d with 
    | DoDecl.T.Call(e, f) -> 
      begin
        fprintfn sw "    if(event == %d)" (Map.find e events)
        fprintfn sw "    {"
        fprintfn sw "       call %s();" f
        fprintfn sw "    }"
      end
    | _ -> ignore true
  
  let translateTransitions sw (mach: MachineDecl) src stateToInt events (t: TransDecl.T) =
    match t with 
    | TransDecl.T.Call(e, d, f) -> 
      begin
        let srcExitAction = mach.StateMap.[src].ExitAction
        let dstEntryAction = mach.StateMap.[d].EntryAction
        fprintfn sw "    if(event == %d)" (Map.find e events)
        fprintfn sw "    {"
        match srcExitAction with
        | None -> ignore true
        | Some(ea) -> fprintfn sw "       call %s();" ea
        fprintfn sw "       call %s();" f
        fprintfn sw "       CurrState := %d;" (Map.find d stateToInt)
        match dstEntryAction with
        | None -> ignore true
        | Some(ea) -> fprintfn sw "       call %s();" ea   
        fprintfn sw "    }"
      end
    |TransDecl.T.Push(e, d) ->  
      begin
        let dstEntryAction = mach.StateMap.[d].EntryAction
        fprintfn sw "    if(event == %d)" (Map.find e events)
        fprintfn sw "    {"
        fprintfn sw "       StateStackPush(%d);" (Map.find src stateToInt)
        fprintfn sw "       CurrState = %d;" (Map.find d stateToInt)
        match dstEntryAction with
        | None -> ignore true
        | Some(ea) -> fprintfn sw "       call %s(payload);" ea   
        fprintfn sw "    }"
      end
       
  let translateState sw mach stateToInt hasDefer hasIgnore events (state: StateDecl) =
    fprintfn sw "   if(CurrState == %d)" (Map.find state.Name stateToInt)
    fprintfn sw "   {"
    List.iter (printEvDict sw) (getEventMaps state.Dos state.Transitions hasDefer hasIgnore events)
    List.iter (translateDos sw events) state.Dos
    List.iter (translateTransitions sw mach state.Name stateToInt events) state.Transitions
    fprintfn sw "    }"
    fprintf sw "   else "

  let translateMachine sw hasDefer hasIgnore events (md: MachineDecl) = 
    let stateToInt =  [for i in md.States do yield i.Name] |> Seq.mapi (fun i x -> x,i) |> Map.ofSeq
    let state = md.StateMap.[md.StartState]
    fprintfn sw "procedure MachineThread_%s(mid: int, entryArg: PrtRef)" md.Name
    fprintfn sw "{"
    let dictList = ["var registeredEvents: [int]bool;"] @ 
                    (if hasIgnore then ["var ignoredEvents: [int]bool;"]  else []) @
                    (if hasDefer  then ["var deferredEvents: [int]bool;"] else [])
    List.iter (fprintfn sw "   %s") dictList
    fprintfn sw "   var event: int;"
    fprintfn sw "   var payload: PrtRef;"
    fprintfn sw "   // Initialize"
    if md.HasPush then
      fprintfn sw "   StateStack := Nil();"
    fprintfn sw "   CurrState := %d;" (Map.find md.StartState stateToInt)
    fprintfn sw "   call InitializeInbox(mid);"
    getEventMaps state.Dos state.Transitions hasDefer hasIgnore events
     |> List.iter (printEvDict sw) 
    match state.EntryAction with
    | Some(ea) -> fprintfn sw "   call %s(entryArg);" ea
    | None -> ignore true
    let deque = sprintf "call event, payload := Dequeue(mid, %s %s registeredEvents);" (if hasDefer then "deferredEvents," else "") (if hasIgnore then "ignoredEvents," else "") 
    fprintf sw "   %s" deque
    fprintfn sw "   while(true)"
    fprintfn sw "   {"
    fprintfn sw "      %s" deque
    List.iter (translateState sw md stateToInt hasDefer hasIgnore events) md.States
    fprintfn sw ""
    fprintfn sw "      {"
    fprintfn sw "         assume false;"
    fprintfn sw "      }"
    fprintfn sw "   }"
    fprintfn sw "}"
  
  let getVars (vdList: VarDecl list) =
    let varList =List.map (fun(vd: VarDecl) -> sprintf "var %s: PrtRef;" vd.Name) vdList
    let defaultList = List.fold (fun ls (vd: VarDecl) -> ls @ [Stmt.Assign(Lval.Var(vd.Name), Expr.Default(vd.Type))]) [] vdList
    varList, defaultList

  //[<EntryPoint>]
  let translateProg (prog: ProgramDecl) (sw: TextWriter) = 
  (* Top-level types *)
    fprintfn sw "type PrtType;";
    fprintfn sw "const unique %s: PrtType;" (translateType Null)
    fprintfn sw "const unique %s: PrtType;" (translateType Int)
    fprintfn sw "const unique %s: PrtType;" (translateType Bool)
    fprintfn sw "const unique %s: PrtType;" (translateType Machine)
    fprintfn sw "const unique %s: PrtType;" (translateType Type.Event)
    for i = 1 to prog.maxFields do
        fprintfn sw "const unique PrtTypeTuple%d: PrtType;" i
    Set.iter (fun t -> 
        match t with
        | Seq _ -> fprintfn sw "const unique PrtTypeSeq%d: PrtType; // %s" (GetTypeIndex t) (printType t)
        | Map _ -> fprintfn sw "const unique PrtTypeMap%d: PrtType; // %s" (GetTypeIndex t) (printType t)
        | _ -> ()
        ) (GetAllTypes())
  
    (* ref type *)
    fprintfn sw "type PrtRef;"
    fprintfn sw "const unique null: PrtRef;"
    fprintfn sw "const unique PrtTrue: PrtRef;"
    fprintfn sw "const unique PrtFalse: PrtRef;"

    (* runtime type *)
    fprintfn sw "function PrtDynamicType(PrtRef):PrtType;"
    fprintfn sw ""

    (* fields *)
    fprintfn sw "function PrtIsNull(PrtRef) : bool;" 
    fprintfn sw "function PrtFieldInt(PrtRef) : int;" 
    fprintfn sw "function PrtFieldBool(PrtRef) : bool;" 
    fprintfn sw "function PrtFieldMachine(PrtRef) : int;" 
    fprintfn sw "function PrtFieldEvent(PrtRef) : int;" 
    for i = 0 to (prog.maxFields-1) do 
        fprintfn sw "function PrtFieldTuple%d(PrtRef) : PrtRef;" i 
    fprintfn sw "function PrtFieldSeqStore(PrtRef) : [int]PrtRef;" 
    fprintfn sw "function PrtFieldSeqSize(PrtRef) : int;" 
    fprintfn sw "function PrtFieldMapKeys(PrtRef) : [int]PrtRef;" 
    fprintfn sw "function PrtFieldMapValues(PrtRef) : [int]PrtRef;" 
    fprintfn sw "function PrtFieldMapSize(PrtRef) : int;" 
    fprintfn sw "" 

    (* constructors of basic types *)
    fprintfn sw "axiom (PrtDynamicType(null) == %s);" (translateType Null)
    fprintfn sw "axiom (PrtIsNull(null) == true);" 
    fprintfn sw "axiom (forall x : PrtRef :: {PrtIsNull(x)} x == null || !PrtIsNull(x));"
    fprintfn sw ""
    fprintfn sw "function PrtConstructFromInt(int) : PrtRef;" 
    fprintfn sw "axiom (forall x : int :: {PrtFieldInt(PrtConstructFromInt(x))} PrtFieldInt(PrtConstructFromInt(x)) == x);" 
    fprintfn sw "axiom (forall x : int :: {PrtDynamicType(PrtConstructFromInt(x))} PrtDynamicType(PrtConstructFromInt(x)) == %s);" (translateType Int)
    fprintfn sw ""
    fprintfn sw "function {:inline} PrtConstructFromBool(v: bool) : PrtRef"
    fprintfn sw "{ if v then PrtTrue else PrtFalse }"
    fprintfn sw "axiom (PrtFieldBool(PrtTrue));"
    fprintfn sw "axiom (!PrtFieldBool(PrtFalse));"
    fprintfn sw "axiom (PrtDynamicType(PrtTrue) == %s);" (translateType Bool)
    fprintfn sw "axiom (PrtDynamicType(PrtFalse) == %s);" (translateType Bool)
    fprintfn sw ""
    fprintfn sw "function PrtConstructFromMachineId(int) : PrtRef;" 
    fprintfn sw "axiom (forall x : int :: {PrtFieldMachine(PrtConstructFromMachineId(x))} PrtFieldMachine(PrtConstructFromMachineId(x)) == x);" 
    fprintfn sw "axiom (forall x : int :: {PrtDynamicType(PrtConstructFromMachineId(x))} PrtDynamicType(PrtConstructFromMachineId(x)) == %s);" (translateType Machine)
    fprintfn sw ""
    fprintfn sw "function PrtConstructFromEventId(int) : PrtRef;" 
    fprintfn sw "axiom (forall x : int :: {PrtFieldEvent(PrtConstructFromEventId(x))} PrtFieldEvent(PrtConstructFromEventId(x)) == x);" 
    fprintfn sw "axiom (forall x : int :: {PrtDynamicType(PrtConstructFromEventId(x))} PrtDynamicType(PrtConstructFromEventId(x)) == %s);" (translateType Type.Event)
    fprintfn sw ""


    (* Allocation *)
    fprintfn sw "procedure {:allocator} AllocatePrtRef() returns (x: PrtRef);"
    fprintfn sw "  //ensures x != null;"
    fprintfn sw ""

    (* Sequence *)
    fprintfn sw "function {:inline} SeqIndexInBounds(seq: PrtRef, index: int) : bool"
    fprintfn sw "{ 0 <= index && index < PrtFieldSeqSize(seq) }"
    fprintfn sw ""
    fprintfn sw "function {:inline} ReadSeq(seq: PrtRef, index: int) : PrtRef"
    fprintfn sw "{ PrtFieldSeqStore(seq)[index] }"
    fprintfn sw ""

    let varList, DefaultList = prog.Machines |> List.map (fun(md: MachineDecl) -> md.Globals) |> List.map getVars |> List.fold (fun (l1, l2) (v, d) -> (l1 @ v), (l2 @ d)) ([], []) 
    
    List.iter (fun s -> fprintfn sw "%s" s) varList    

    (*fprintfn sw "procedure main() {"
    Map.iter (fun k v -> fprintfn sw "  var %s: PrtRef; // %s" k (printType v)) G
    fprintfn sw "  var tmpRhsValue: PrtRef;"
    for i = 0 to prog.maxFields-1 do
        fprintfn sw "  var tmpRhsValue_%d: PrtRef;" i
    List.iter (fun s -> 
        begin
        fprintfn swComment "%s" (printStmt s)
        translateStmt s G 
        end
    ) stmtlist *)
    //fprintfn sw "}"

    (* Equals *)
    printEquals sw prog.maxFields
    
    (* AssertIsType *)
    Set.iter (fun t -> printTypeCheck sw t) !typesAsserted

    let s = IO.File.ReadAllLines("CommonBpl.bpl") in
    Array.iter (fun s -> fprintfn sw "%s" s) s
    0 // return an integer exit code
*)