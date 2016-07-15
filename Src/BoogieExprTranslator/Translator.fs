namespace Microsoft.P2Boogie

module Translator = 

  open System
  open Syntax
  open Helper
  open Common
  open ProgramTyping
  open RemoveSideEffects

  (* Translation of normalized side-effect-free programs to Boogie *)

  let translateType t typmap =
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
    | Type.Seq(t1) -> sprintf "PrtTypeSeq%d" (Map.find t typmap)
    | Type.Map(t1, t2) -> sprintf "PrtTypeMap%d" (Map.find t typmap)

  let eventToIntMap = ref Map.empty
  let eventToIntCounter = ref 0

  let rec translateExpr expr G =
    match expr with
    | Nil -> "null"
    | Expr.ConstInt(i) -> sprintf "PrtConstructFromInt(%d)" i 
    | Expr.ConstBool(b) -> if b then "PrtTrue" else "PrtFalse"
    | Expr.This -> "null" (* TODO: Fix *)
    | Expr.New(_,_) -> "PrtConstructFromMachine(1)" (* TODO: Fix *)
    | Expr.Default t when t = Null || t = Machine || t = Type.Event || t = Any -> "null"
    | Expr.Default Int -> "PrtConstructFromInt(0)"
    | Expr.Default Bool -> "PrtFalse"
    | Expr.Event s ->
      begin
        if Map.containsKey s !eventToIntMap then sprintf "PrtConstructFromEvent(%d)" (Map.find s !eventToIntMap)
        else begin
          let v = !eventToIntCounter in
          eventToIntCounter := !eventToIntCounter + 1
          eventToIntMap := Map.add s v !eventToIntMap
          sprintf "PrtConstructFromEvent(%d)" v
        end
      end
    | Expr.Var(v) -> v
    | Expr.Bin(op, e1, e2) when  isIntop(op) -> sprintf "PrtConstructFromInt(PrtFieldInt(%s) %s PrtFieldInt(%s))" (translateExpr e1 G) (printBinop op) (translateExpr e2 G)
    | Expr.Bin(op, e1, e2) when  isRelop(op) -> sprintf "PrtConstructFromBool(PrtFieldInt(%s) %s PrtFieldInt(%s))" (translateExpr e1 G) (printBinop op) (translateExpr e2 G)
    | Expr.Bin(op, e1, e2) when  isBoolop(op) -> sprintf "PrtConstructFromBool(PrtFieldBool(%s) %s PrtFieldBool(%s))" (translateExpr e1 G) (printBinop op) (translateExpr e2 G)
    | Expr.Bin(op, e1, e2) when  isComparison(op) -> raise NotDefined
    | Expr.Bin(Idx, e1, e2) -> raise NotDefined
    | Expr.Bin(In, e1, e2) -> raise NotDefined
    | Expr.Un(Not, e) -> sprintf "PrtConstructFromBool(!PrtFieldBool(%s))" (translateExpr e G)
    | Expr.Un(Neg, e) -> sprintf "PrtConstructFromInt(0 - PrtFieldInt(%s))" (translateExpr e G)
    | Expr.Un(Sizeof, e) when isSeq (typeof e G) -> sprintf "PrtConstructFromInt(PrtFieldSeqSize(%s))" (translateExpr e G)
    | Expr.Un(Sizeof, e) -> sprintf "PrtConstructFromInt(PrtFieldMapSize(%s))" (translateExpr e G)
    | Expr.Dot(e, f) -> sprintf "PrtFieldTuple%d(%s)" f (translateExpr e G)
    | _ -> raise NotDefined

  let typesAsserted = ref Set.empty

  let translateAssign lval expr G typemap =
    let genRhsValue e G =
      let rhsVar = "tmpRhsValue" in
      printfn "%s := %s;" rhsVar (translateExpr e G)
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
        printfn "call AssertIsType%d(%s);" (Map.find t typemap) rhsVar
        (* the assignment *)
        printfn "%s := %s;" (getLhsVar lval) rhsVar      
      end
    | _, Expr.Tuple(es) ->
      begin
        for i = 0 to (List.length es) - 1 do
          let ei = (List.nth es i) in
          printfn "tmpRhsValue_%d := %s;" i (translateExpr ei G)
        printfn "call %s := AllocatePrtRef();" (getLhsVar lval)
        printfn "assume PrtDynamicType(%s) == PrtTypeTuple%d;" (getLhsVar lval) (List.length es)
        for i = 0 to (List.length es) - 1 do
          printfn "assume PrtFieldTuple%d(%s) == tmpRhsValue_%d;" i (getLhsVar lval) i
      end
    | _, Expr.Call(callee, args) ->
      begin
        printfn "call %s := %s(%s);" (getLhsVar lval) callee (printList (fun e -> translateExpr e G) args ", ")
      end
    | _, Expr.Default(Seq(t)) ->
      begin
        printfn "call %s := AllocatePrtRef();" (getLhsVar lval)
        printfn "assume PrtDynamicType(%s) == PrtTypeSeq%d;" (getLhsVar lval) (Map.find (Seq(t)) typemap)
        printfn "assume PrtFieldSeqSize(%s) == 0;" (getLhsVar lval) 
      end
    | _, Expr.Default(Map(t1, t2)) ->
      begin
        printfn "call %s := AllocatePrtRef();" (getLhsVar lval)
        printfn "assume PrtDynamicType(%s) == PrtTypeMap%d;" (getLhsVar lval) (Map.find (Map(t1, t2)) typemap)
        printfn "assume PrtFieldMapSize(%s) == 0;" (getLhsVar lval) 
      end
    | _, Expr.Bin(Idx, e1, e2) ->
      begin
        match isMap (typeof e1 G) with
        | true ->  printfn "call %s := ReadMap(%s, %s);" (getLhsVar lval) (translateExpr e1 G) (translateExpr e2 G)
        | false -> printfn "assert SeqIndexInBounds(%s, PrtFieldInt(%s)); %s := ReadSeq(%s, PrtFieldInt(%s));" (translateExpr e1 G) (translateExpr e2 G) (getLhsVar lval) (translateExpr e1 G) (translateExpr e2 G)
      end
    | _, Expr.Bin(In, e1, e2) ->
      begin
        printfn "call %s := MapContainsKey(%s, %s);" (getLhsVar lval) (translateExpr e1 G) (translateExpr e2 G)
      end
    | _, Expr.Bin(Eq, e1, e2) ->
      begin
        printfn "call %s := PrtEquals(%s, %s);" (getLhsVar lval) (translateExpr e1 G) (translateExpr e2 G)
      end
    | _, Expr.Un(Keys, e) ->
      begin
        printfn "call %s := MapGetKeys(%s);" (getLhsVar lval) (translateExpr e G)
      end
    | _, Expr.Un(Values, e) ->
      begin
        printfn "call %s := MapGetValues(%s);" (getLhsVar lval) (translateExpr e G)
      end
    | _, Expr.Nondet ->
      begin
        printfn "havoc %s;" (getLhsVar lval) 
      end
    | Lval.Index(Lval.Var(lhsVar), e), _ when isSeq (typeofLval (Lval.Var(lhsVar)) G) ->
      begin
        printfn "call %s := WriteSeq(%s, PrtFieldInt(%s), %s);" lhsVar lhsVar (translateExpr e G) (translateExpr expr G)
      end
    | Lval.Index(Lval.Var(lhsVar), e), _ ->
      begin
        printfn "call %s := WriteMap%s, %s, %s);" lhsVar lhsVar (translateExpr e G) (translateExpr expr G)
      end
    | _, _ ->
        printfn "%s := %s;" (getLhsVar lval) (translateExpr expr G)

  let translateInsert v e1 e2 G =
    match isSeq (typeof (Expr.Var(v)) G) with
    | true -> printfn "call %s := InsertSeq(%s, PrtFieldInt(%s), %s);" v v (translateExpr e1 G) (translateExpr e2 G)
    | false -> printfn "call %s := InsertMap(%s, PrtFieldInt(%s), %s);" v v (translateExpr e1 G) (translateExpr e2 G)

  let translateRemove v e1 G =
    match isSeq (typeof (Expr.Var(v)) G) with
    | true -> printfn "call %s := RemoveSeq(%s, PrtFieldInt(%s));" v v (translateExpr e1 G)
    | false -> printfn "call %s := RemoveMap(%s, PrtFieldInt(%s));" v v (translateExpr e1 G)

  let translateStmt stmt G typemap =
    match stmt with
    | Assign(l, e) -> translateAssign l e G typemap
    | Insert(Lval.Var(v), e1, e2) -> translateInsert v e1 e2 G
    | Remove(Lval.Var(v), e1) -> translateRemove v e1 G
    | Assume(e) -> printfn "assume PrtFieldBool(%s);" (translateExpr e G)
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
 
  let printTypeCheck t typemap =
    let tindex =  Map.find t typemap in
    printfn "// Type %s" (printType t)
    printfn "procedure AssertIsType%d(x: PrtRef) {" tindex
    match t with
    | Null -> raise NotDefined
    | Any -> raise NotDefined
    | Bool 
    | Seq(_)
    | Map(_, _)
    | Int -> printfn "  assert PrtDynamicType(x) == %s;" (translateType t typemap)
    | Machine
    | Type.Event -> printfn "  assert PrtDynamicType(x) == %s || PrtIsNull(x);" (translateType t typemap)
    | Type.NamedTuple(_) -> raise NotDefined
    | Type.ModelType s -> printfn "  assert PrtDynamicType(x) == PrtTypeModel%s;" s
    | Type.Tuple ts ->
      begin
        printfn "  assert PrtDynamicType(x) == PrtTypeTuple%d;" (List.length ts)
        for i = 0 to ((List.length ts) - 1) do
          let ti = List.nth ts i in
          printfn "  call AssertIsType%d(PrtFieldTuple%d(x));" (Map.find ti typemap) i
      end
    printfn "}"
   
  [<EntryPoint>]
  let main argv = 
(*    printfnComment "Input program:";
      List.iter (fun s -> printfnComment "%s" (printStmt s)) stmtlist;
      printfnComment "Input type environment";
      Map.iter (fun v t -> printfnComment "%s -> %s" v (printType t)) env;

      let G = env in

      (* Remove namedtuples *)
      let stmtlist = List.map (fun st-> RemoveNamedTuples.processStmt st G) stmtlist in
      let G = RemoveNamedTuples.processEnv G in

      (* Remove side effects *)
      let (stmtlist, G) = normalizeLvalStlist stmtlist G in
      let (stmtlist, G) = removeSideEffectsStlist stmtlist G in

      printfnComment "Side-effect-free program:"
      List.iter (fun s -> printfnComment "%s" (printStmt s)) stmtlist;
*)
      (* Top-level types *)
      let typemap = mapAllTypes stmtlist G in
      let maxFields = maxTupleSize typemap in

      printfn "type PrtType;";
      printfn "const unique %s: PrtType;" (translateType Null typemap)
      printfn "const unique %s: PrtType;" (translateType Int typemap)
      printfn "const unique %s: PrtType;" (translateType Bool typemap)
      printfn "const unique %s: PrtType;" (translateType Machine typemap)
      printfn "const unique %s: PrtType;" (translateType Type.Event typemap)
      for i = 1 to maxFields do
        printfn "const unique PrtTypeTuple%d: PrtType;" i
      Map.iter (fun t i -> 
        match t with
        | Seq _ -> printfn "const unique PrtTypeSeq%d: PrtType; // %s" i (printType t)
        | Map _ -> printfn "const unique PrtTypeMap%d: PrtType; // %s" i (printType t)
        | _ -> ()
        ) typemap
  
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
      for i = 0 to (maxFields-1) do 
        printfn "function PrtFieldTuple%d(PrtRef) : PrtRef;" i 
      printfn "function PrtFieldSeqStore(PrtRef) : [int]PrtRef;" 
      printfn "function PrtFieldSeqSize(PrtRef) : int;" 
      printfn "function PrtFieldMapKeys(PrtRef) : [int]PrtRef;" 
      printfn "function PrtFieldMapValues(PrtRef) : [int]PrtRef;" 
      printfn "function PrtFieldMapSize(PrtRef) : int;" 
      printfn "" 

      (* constructors of basic types *)
      printfn "axiom (PrtDynamicType(null) == %s);" (translateType Null typemap)
      printfn "axiom (PrtIsNull(null) == true);" 
      printfn "axiom (forall x : PrtRef :: {PrtIsNull(x)} x == null || !PrtIsNull(x));"
      printfn ""
      printfn "function PrtConstructFromInt(int) : PrtRef;" 
      printfn "axiom (forall x : int :: {PrtFieldInt(PrtConstructFromInt(x))} PrtFieldInt(PrtConstructFromInt(x)) == x);" 
      printfn "axiom (forall x : int :: {PrtDynamicType(PrtConstructFromInt(x))} PrtDynamicType(PrtConstructFromInt(x)) == %s);" (translateType Int typemap)
      printfn ""
      printfn "function {:inline} PrtConstructFromBool(v: bool) : PrtRef"
      printfn "{ if v then PrtTrue else PrtFalse }"
      printfn "axiom (PrtFieldBool(PrtTrue));"
      printfn "axiom (!PrtFieldBool(PrtFalse));"
      printfn "axiom (PrtDynamicType(PrtTrue) == %s);" (translateType Bool typemap)
      printfn "axiom (PrtDynamicType(PrtFalse) == %s);" (translateType Bool typemap)
      printfn ""
      printfn "function PrtConstructFromMachineId(int) : PrtRef;" 
      printfn "axiom (forall x : int :: {PrtFieldMachine(PrtConstructFromMachineId(x))} PrtFieldMachine(PrtConstructFromMachineId(x)) == x);" 
      printfn "axiom (forall x : int :: {PrtDynamicType(PrtConstructFromMachineId(x))} PrtDynamicType(PrtConstructFromMachineId(x)) == %s);" (translateType Machine typemap)
      printfn ""
      printfn "function PrtConstructFromEventId(int) : PrtRef;" 
      printfn "axiom (forall x : int :: {PrtFieldEvent(PrtConstructFromEventId(x))} PrtFieldEvent(PrtConstructFromEventId(x)) == x);" 
      printfn "axiom (forall x : int :: {PrtDynamicType(PrtConstructFromEventId(x))} PrtDynamicType(PrtConstructFromEventId(x)) == %s);" (translateType Type.Event typemap)
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

      printfn "procedure main() {"
      Map.iter (fun k v -> printfn "  var %s: PrtRef; // %s" k (printType v)) G
      printfn "  var tmpRhsValue: PrtRef;"
      for i = 0 to maxFields-1 do
        printfn "  var tmpRhsValue_%d: PrtRef;" i
      List.iter (fun s -> 
        begin
          printfnComment "%s" (printStmt s)
          translateStmt s G typemap
        end
      ) stmtlist
      printfn "}"

      (* Equals *)
      printEquals(maxFields)
    
      (* AssertIsType *)
      Set.iter (fun t -> printTypeCheck t typemap) !typesAsserted

      let s = IO.File.ReadAllLines("CommonBpl.bpl") in
      Array.iter (fun s -> printfn "%s" s) s
      0 // return an integer exit code