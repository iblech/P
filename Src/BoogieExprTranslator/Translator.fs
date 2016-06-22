namespace Microsoft.P2Boogie

    module Translator=

        open System
        open Syntax
        open Helper
        open Common
        open ProgramTyping
        open RemoveSideEffects

        (* Translation of normalized side-effect-free programs to Boogie *)

        let translate_type t typmap =
          match t with
          | Null -> "PrtTypeNull"
          | Bool -> "PrtTypeBool"
          | Int -> "PrtTypeInt"
          | Machine -> "PrtTypeMachine"
          | Type.Event -> "PrtTypeEvent"
          | Type.NamedTuple(_) -> raise Not_defined
          | Type.ModelType s -> sprintf "PrtTypeModel%s" s
          | Any -> raise Not_defined
          | Type.Tuple(ls) -> sprintf "PrtTypeTuple%d" (List.length ls)
          | Type.Seq(t1) -> sprintf "PrtTypeSeq%d" (Map.find t typmap)
          | Type.Map(t1, t2) -> sprintf "PrtTypeMap%d" (Map.find t typmap)

        let event_to_int_map = ref Map.empty
        let event_to_int_counter = ref 0

        let rec translate_expr expr G =
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
              if Map.containsKey s !event_to_int_map then sprintf "PrtConstructFromEvent(%d)" (Map.find s !event_to_int_map)
              else begin
                let v = !event_to_int_counter in
                event_to_int_counter := !event_to_int_counter + 1
                event_to_int_map := Map.add s v !event_to_int_map
                sprintf "PrtConstructFromEvent(%d)" v
              end
            end
          | Expr.Var(v) -> v
          | Expr.Bin(op, e1, e2) when  is_intop(op) -> sprintf "PrtConstructFromInt(PrtFieldInt(%s) %s PrtFieldInt(%s))" (translate_expr e1 G) (print_binop op) (translate_expr e2 G)
          | Expr.Bin(op, e1, e2) when  is_relop(op) -> sprintf "PrtConstructFromBool(PrtFieldInt(%s) %s PrtFieldInt(%s))" (translate_expr e1 G) (print_binop op) (translate_expr e2 G)
          | Expr.Bin(op, e1, e2) when  is_boolop(op) -> sprintf "PrtConstructFromBool(PrtFieldBool(%s) %s PrtFieldBool(%s))" (translate_expr e1 G) (print_binop op) (translate_expr e2 G)
          | Expr.Bin(op, e1, e2) when  is_comparison(op) -> raise Not_defined
          | Expr.Bin(Idx, e1, e2) -> raise Not_defined
          | Expr.Bin(In, e1, e2) -> raise Not_defined
          | Expr.Un(Not, e) -> sprintf "PrtConstructFromBool(!PrtFieldBool(%s))" (translate_expr e G)
          | Expr.Un(Neg, e) -> sprintf "PrtConstructFromInt(0 - PrtFieldInt(%s))" (translate_expr e G)
          | Expr.Un(Sizeof, e) when is_seq (typeof e G) -> sprintf "PrtConstructFromInt(PrtFieldSeqSize(%s))" (translate_expr e G)
          | Expr.Un(Sizeof, e) -> sprintf "PrtConstructFromInt(PrtFieldMapSize(%s))" (translate_expr e G)
          | Expr.Dot(e, f) -> sprintf "PrtFieldTuple%d(%s)" f (translate_expr e G)
          | _ -> raise Not_defined

        let types_asserted = ref Set.empty

        let translate_assign lval expr G typemap =
          let gen_rhs_value e G =
            let rhs_var = "tmp_rhs_value" in
            printfn "%s := %s;" rhs_var (translate_expr e G)
            rhs_var
          in
          let get_lhs_var lval = match lval with
                                 | Lval.Var(v) -> v
                                 | _ -> raise Not_defined
          in
          let rec set_types_asserted t =
            types_asserted := Set.add t !types_asserted
            match t with
            | Type.Tuple ts -> List.iter set_types_asserted ts
            | _ -> ()
          match (lval, expr) with 
          | _, Expr.Cast(e, t) -> 
            begin
              (* evaluate rhs *)
              let rhs_var = gen_rhs_value e G in
              (* generate type assertion *)
              set_types_asserted t
              printfn "call AssertIsType%d(%s);" (Map.find t typemap) rhs_var
              (* the assignment *)
              printfn "%s := %s;" (get_lhs_var lval) rhs_var      
            end
          | _, Expr.Tuple(es) ->
            begin
              for i = 0 to (List.length es) - 1 do
                let ei = (List.nth es i) in
                printfn "tmp_rhs_value_%d := %s;" i (translate_expr ei G)
              printfn "call %s := AllocatePrtRef();" (get_lhs_var lval)
              printfn "assume PrtDynamicType(%s) == PrtTypeTuple%d;" (get_lhs_var lval) (List.length es)
              for i = 0 to (List.length es) - 1 do
                printfn "assume PrtFieldTuple%d(%s) == tmp_rhs_value_%d;" i (get_lhs_var lval) i
            end
          | _, Expr.Call(callee, args) ->
            begin
              printfn "call %s := %s(%s);" (get_lhs_var lval) callee (print_list (fun e -> translate_expr e G) args)
            end
          | _, Expr.Default(Seq(t)) ->
            begin
              printfn "call %s := AllocatePrtRef();" (get_lhs_var lval)
              printfn "assume PrtDynamicType(%s) == PrtTypeSeq%d;" (get_lhs_var lval) (Map.find (Seq(t)) typemap)
              printfn "assume PrtFieldSeqSize(%s) == 0;" (get_lhs_var lval) 
            end
          | _, Expr.Default(Map(t1, t2)) ->
            begin
              printfn "call %s := AllocatePrtRef();" (get_lhs_var lval)
              printfn "assume PrtDynamicType(%s) == PrtTypeMap%d;" (get_lhs_var lval) (Map.find (Map(t1, t2)) typemap)
              printfn "assume PrtFieldMapSize(%s) == 0;" (get_lhs_var lval) 
            end
          | _, Expr.Bin(Idx, e1, e2) ->
            begin
              match is_map (typeof e1 G) with
              | true ->  printfn "call %s := ReadMap(%s, %s);" (get_lhs_var lval) (translate_expr e1 G) (translate_expr e2 G)
              | false -> printfn "assert SeqIndexInBounds(%s, PrtFieldInt(%s)); %s := ReadSeq(%s, PrtFieldInt(%s));" (translate_expr e1 G) (translate_expr e2 G) (get_lhs_var lval) (translate_expr e1 G) (translate_expr e2 G)
            end
          | _, Expr.Bin(In, e1, e2) ->
            begin
              printfn "call %s := MapContainsKey(%s, %s);" (get_lhs_var lval) (translate_expr e1 G) (translate_expr e2 G)
            end
          | _, Expr.Bin(Eq, e1, e2) ->
            begin
              printfn "call %s := PrtEquals(%s, %s);" (get_lhs_var lval) (translate_expr e1 G) (translate_expr e2 G)
            end
          | _, Expr.Un(Keys, e) ->
            begin
              printfn "call %s := MapGetKeys(%s);" (get_lhs_var lval) (translate_expr e G)
            end
          | _, Expr.Un(Values, e) ->
            begin
              printfn "call %s := MapGetValues(%s);" (get_lhs_var lval) (translate_expr e G)
            end
          | _, Expr.Nondet ->
            begin
              printfn "havoc %s;" (get_lhs_var lval) 
            end
          | Lval.Index(Lval.Var(lhs_var), e), _ when is_seq (typeof_lval (Lval.Var(lhs_var)) G) ->
            begin
              printfn "call %s := WriteSeq(%s, PrtFieldInt(%s), %s);" lhs_var lhs_var (translate_expr e G) (translate_expr expr G)
            end
          | Lval.Index(Lval.Var(lhs_var), e), _ ->
            begin
              printfn "call %s := WriteMap%s, %s, %s);" lhs_var lhs_var (translate_expr e G) (translate_expr expr G)
            end
          | _, _ ->
              printfn "%s := %s;" (get_lhs_var lval) (translate_expr expr G)

        let translate_insert v e1 e2 G =
          match is_seq (typeof (Expr.Var(v)) G) with
          | true -> printfn "call %s := InsertSeq(%s, PrtFieldInt(%s), %s);" v v (translate_expr e1 G) (translate_expr e2 G)
          | false -> printfn "call %s := InsertMap(%s, PrtFieldInt(%s), %s);" v v (translate_expr e1 G) (translate_expr e2 G)

        let translate_remove v e1 G =
          match is_seq (typeof (Expr.Var(v)) G) with
          | true -> printfn "call %s := RemoveSeq(%s, PrtFieldInt(%s));" v v (translate_expr e1 G)
          | false -> printfn "call %s := RemoveMap(%s, PrtFieldInt(%s));" v v (translate_expr e1 G)

        let translate_stmt stmt G typemap =
          match stmt with
          | Assign(l, e) -> translate_assign l e G typemap
          | Insert(Lval.Var(v), e1, e2) -> translate_insert v e1 e2 G
          | Remove(Lval.Var(v), e1) -> translate_remove v e1 G
          | Assume(e) -> printfn "assume PrtFieldBool(%s);" (translate_expr e G)
          | _ -> raise Not_defined

        let printfn_comment x = 
          printf "// "
          printfn x

        let print_equals max_fields =
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
  
            for i = 1 to max_fields do
              printfn "  if(ta == PrtTypeTuple%d) { call v := PrtEqualsTuple%d(a,b); return; }" i i
    
            printfn "
          // Map, Seq type
          assume false;
        }        
            "
            for i = 1 to max_fields do
              printfn "procedure PrtEqualsTuple%d(x: PrtRef, y: PrtRef) returns (v: bool) {" i
              for j = 0 to (i-1) do
                printfn "  call v := PrtEquals(PrtFieldTuple%d(x), PrtFieldTuple%d(y));" j j
                if j <> (i-1) then printfn "  if(!v) { return; }"
              printfn "}"
 
        let print_type_check t typemap =
          let tindex =  Map.find t typemap in
          printfn "// Type %s" (print_type t)
          printfn "procedure AssertIsType%d(x: PrtRef) {" tindex
          match t with
          | Null -> raise Not_defined
          | Any -> raise Not_defined
          | Bool 
          | Seq(_)
          | Map(_, _)
          | Int -> printfn "  assert PrtDynamicType(x) == %s;" (translate_type t typemap)
          | Machine
          | Type.Event -> printfn "  assert PrtDynamicType(x) == %s || PrtIsNull(x);" (translate_type t typemap)
          | Type.NamedTuple(_) -> raise Not_defined
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
            printfn_comment "Input program:";
            List.iter (fun s -> printfn_comment "%s" (print_stmt s)) stmtlist;
            printfn_comment "Input type environment";
            Map.iter (fun v t -> printfn_comment "%s -> %s" v (print_type t)) env;

            let G = env in

            (* Remove namedtuples *)
            let stmtlist = List.map (fun st-> RemoveNamedTuples.process_stmt st G) stmtlist in
            let G = RemoveNamedTuples.process_env G in

            (* Remove side effects *)
            let (stmtlist, G) = normalize_lval_stlist stmtlist G in
            let (stmtlist, G) = remove_side_effects_stlist stmtlist G in

            printfn_comment "Side-effect-free program:"
            List.iter (fun s -> printfn_comment "%s" (print_stmt s)) stmtlist;

            (* Top-level types *)
            let typemap = map_all_types stmtlist G in
            let max_fields = max_tuple_size typemap in

            printfn "type PrtType;";
            printfn "const unique %s: PrtType;" (translate_type Null typemap)
            printfn "const unique %s: PrtType;" (translate_type Int typemap)
            printfn "const unique %s: PrtType;" (translate_type Bool typemap)
            printfn "const unique %s: PrtType;" (translate_type Machine typemap)
            printfn "const unique %s: PrtType;" (translate_type Type.Event typemap)
            for i = 1 to max_fields do
              printfn "const unique PrtTypeTuple%d: PrtType;" i
            Map.iter (fun t i -> 
              match t with
              | Seq _ -> printfn "const unique PrtTypeSeq%d: PrtType; // %s" i (print_type t)
              | Map _ -> printfn "const unique PrtTypeMap%d: PrtType; // %s" i (print_type t)
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
            for i = 0 to (max_fields-1) do 
              printfn "function PrtFieldTuple%d(PrtRef) : PrtRef;" i 
            printfn "function PrtFieldSeqStore(PrtRef) : [int]PrtRef;" 
            printfn "function PrtFieldSeqSize(PrtRef) : int;" 
            printfn "function PrtFieldMapKeys(PrtRef) : [int]PrtRef;" 
            printfn "function PrtFieldMapValues(PrtRef) : [int]PrtRef;" 
            printfn "function PrtFieldMapSize(PrtRef) : int;" 
            printfn "" 

            (* constructors of basic types *)
            printfn "axiom (PrtDynamicType(null) == %s);" (translate_type Null typemap)
            printfn "axiom (PrtIsNull(null) == true);" 
            printfn "axiom (forall x : PrtRef :: {PrtIsNull(x)} x == null || !PrtIsNull(x));"
            printfn ""
            printfn "function PrtConstructFromInt(int) : PrtRef;" 
            printfn "axiom (forall x : int :: {PrtFieldInt(PrtConstructFromInt(x))} PrtFieldInt(PrtConstructFromInt(x)) == x);" 
            printfn "axiom (forall x : int :: {PrtDynamicType(PrtConstructFromInt(x))} PrtDynamicType(PrtConstructFromInt(x)) == %s);" (translate_type Int typemap)
            printfn ""
            printfn "function {:inline} PrtConstructFromBool(v: bool) : PrtRef"
            printfn "{ if v then PrtTrue else PrtFalse }"
            printfn "axiom (PrtFieldBool(PrtTrue));"
            printfn "axiom (!PrtFieldBool(PrtFalse));"
            printfn "axiom (PrtDynamicType(PrtTrue) == %s);" (translate_type Bool typemap)
            printfn "axiom (PrtDynamicType(PrtFalse) == %s);" (translate_type Bool typemap)
            printfn ""
            printfn "function PrtConstructFromMachineId(int) : PrtRef;" 
            printfn "axiom (forall x : int :: {PrtFieldMachine(PrtConstructFromMachineId(x))} PrtFieldMachine(PrtConstructFromMachineId(x)) == x);" 
            printfn "axiom (forall x : int :: {PrtDynamicType(PrtConstructFromMachineId(x))} PrtDynamicType(PrtConstructFromMachineId(x)) == %s);" (translate_type Machine typemap)
            printfn ""
            printfn "function PrtConstructFromEventId(int) : PrtRef;" 
            printfn "axiom (forall x : int :: {PrtFieldEvent(PrtConstructFromEventId(x))} PrtFieldEvent(PrtConstructFromEventId(x)) == x);" 
            printfn "axiom (forall x : int :: {PrtDynamicType(PrtConstructFromEventId(x))} PrtDynamicType(PrtConstructFromEventId(x)) == %s);" (translate_type Type.Event typemap)
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
            Map.iter (fun k v -> printfn "  var %s: PrtRef; // %s" k (print_type v)) G
            printfn "  var tmp_rhs_value: PrtRef;"
            for i = 0 to max_fields-1 do
              printfn "  var tmp_rhs_value_%d: PrtRef;" i
            List.iter (fun s -> 
              begin
                printfn_comment "%s" (print_stmt s)
                translate_stmt s G typemap
              end
            ) stmtlist
            printfn "}"

            (* Equals *)
            print_equals(max_fields)
    
            (* AssertIsType *)
            Set.iter (fun t -> print_type_check t typemap) !types_asserted

            let s = IO.File.ReadAllLines("CommonBpl.bpl") in
            Array.iter (fun s -> printfn "%s" s) s
            0 // return an integer exit code
