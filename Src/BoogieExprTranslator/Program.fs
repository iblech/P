open System

(* Types *)
type Type = Null | Bool | Int | Machine | Event | Any 
           | Seq of Type | Map of Type * Type 
           | Tuple of Type list

(* operators *)
type BinOp = Add | Sub | Mul | Intdiv | And | Or | Eq | Neq | Lt | Le | Gt | Ge | Idx | In

type UnOp = Not | Neg | Keys | Values | Sizeof

(* Expressions *)
type Expr = 
  | Nil 
  | ConstInt of int 
  | ConstBool of bool 
  | Event of string
  | This
  | Nondet
  | FairNonDet
  | Var of string 
  | Bin of BinOp * Expr * Expr 
  | Un of UnOp * Expr
  | Dot of Expr * int 
  | Cast of Expr * Type 
  | Tuple of Expr list

type Lval = Var of string | Dot of Lval * int | Index of Lval * Expr

(* Statements *)
type Stmt = Assign of Lval * Expr | Insert of Lval * Expr * Expr | Remove of Lval * Expr | Assume of Expr 

(* Input program *)
let stmtlist = [ 
                 Assign(Lval.Var("c"), Expr.Tuple [Expr.ConstInt 1; Expr.ConstInt 2]);  // c = (1,2)
                 Assign(Lval.Var("x"), Expr.Var("y"));  // x = y
                 Assign(Lval.Var("d"), Expr.Var("c"));  // d = c
                 Assign(Lval.Var("c"), Expr.Cast(Expr.Var("d"), Type.Tuple [Int; Int]));  // d = c
                 Insert(Lval.Index(Lval.Var("f"), Expr.ConstInt(0)), Expr.Bin(Idx, Expr.Var("e"), Expr.ConstInt(1)), Expr.ConstInt(2)); // f[0] += (e[1], 2)
               ]

let env = Map.ofList [ 
            ("a", Int); 
            ("b", Any); 
            ("c", Type.Tuple [Int; Int]); 
            ("d", Type.Tuple [Any; Any]); 
            ("e", Type.Seq Int);
            ("f", Type.Seq (Type.Seq Int));
            ("x", Int); 
            ("y", Int) 
          ]

(* Helpers *)
let rec lval_to_expr lval =
  match lval with
  | Lval.Var(v) -> Expr.Var(v)
  | Lval.Dot(l, i) -> Expr.Dot(lval_to_expr l, i)
  | Lval.Index(l, e) -> Expr.Bin(Idx, lval_to_expr l, e)

let is_intop op =
  match op with
  | Add 
  | Sub 
  | Mul 
  | Intdiv -> true
  | _ -> false

let is_relop op =
  match op with
  | Lt 
  | Le 
  | Gt 
  | Ge -> true
  | _ -> false

let is_boolop op =
  match op with
  | And 
  | Or -> true
  | _ -> false

let is_comparison op =
  match op with
  | Eq
  | Neq -> true
  | _ -> false

(* Exception for everything that we don't want to do *)
exception Not_defined;

(* Type exception for everything we don't want to type *)
exception Type_exception of string;

(* Printing functions *)
let rec print_list fn ls =
  match ls with
  | [] -> ""
  | [h] -> (fn h)
  | h::t -> sprintf "%s, %s" (fn h) (print_list fn t)

let rec print_type t =
  match t with
  | Null -> "null"
  | Bool -> "bool"
  | Int -> "int"
  | Machine -> "real"
  | Type.Event -> "event"
  | Any -> "any"
  | Type.Tuple(ls) -> sprintf "(%s)" (print_list print_type ls)
  | Type.Seq(t) -> sprintf "seq[%s]" (print_type t)
  | Type.Map(t1, t2) -> sprintf "map[%s, %s]" (print_type t1) (print_type t2)

let print_binop op =
  match op with
  | Add -> "+"
  | Sub -> "-"
  | Mul -> "*"
  | Intdiv -> "/"
  | And -> "&&"
  | Or -> "!!"
  | Eq -> "=="
  | Neq -> "!="
  | Lt -> "<"
  | Le -> "<="
  | Gt -> ">"
  | Ge -> ">="
  | Idx -> "[]"
  | In -> "in"

let print_uop op =
  match op with
  | Not -> "!"
  | Neg -> "~"
  | Keys -> "keys"
  | Values -> "values"
  | Sizeof -> "sizeof"

let rec print_expr (e: Expr) =
  match e with
  | Nil -> "nil"
  | ConstBool(b) -> b.ToString()
  | ConstInt(i) -> i.ToString()
  | This -> "this"
  | Nondet -> "*"
  | Event(s) -> s
  | Expr.Var(s) -> s
  | Expr.Bin(Idx, e1, e2) -> sprintf "%s[%s]" (print_expr e1) (print_expr e2) 
  | Expr.Bin(op, e1, e2) -> sprintf "(%s %s %s)" (print_expr e1) (print_binop op) (print_expr e2)
  | Expr.Un(op, e1) -> sprintf "%s(%s)" (print_uop op) (print_expr e1)
  | Expr.Dot(e, i) -> (print_expr e) + "." + i.ToString()
  | Cast(e, t) -> sprintf "(%s as %s)" (print_expr e) (print_type t)
  | Tuple(ls) -> sprintf "(%s)" (print_list print_expr ls)
 
let rec print_lval (l: Lval) =
  match l with
  | Lval.Var(v) -> v
  | Lval.Dot(v, i) -> sprintf "%s.%d" (print_lval v) i
  | Lval.Index(l, e) -> sprintf "%s[%s]" (print_lval l) (print_expr e) 

let print_stmt s =
  match s with
  | Assign(l, e) -> sprintf "%s = %s" (print_lval l) (print_expr e)
  | Insert(l, e1, e2) -> sprintf "%s += (%s, %s)" (print_lval l) (print_expr e1) (print_expr e2)
  | Remove(l, e) -> sprintf "%s -= %s" (print_lval l) (print_expr e)
  | Assume(e) -> sprintf "assume %s" (print_expr e)

(* Typing *)
let type_assert b s =
  if (not b) then raise (Type_exception s)

let rec is_subtype t1 t2 =
  match (t1, t2) with
  | (_, Any) -> true
  | (Null, Machine) -> true
  | (Null, Type.Event) -> true
  | (a,b) when a = b -> true
  | (Type.Seq(a), Type.Seq(b)) -> (is_subtype a b)
  | (Type.Map(k1, v1), Type.Map(k2, v2)) -> ((is_subtype k1 k2) && (is_subtype v1 v2))
  | (Type.Tuple(ls1), Type.Tuple(ls2)) ->
    begin
      if List.length ls1 <> List.length ls2 then false
      else begin
        let z = List.zip ls1 ls2 in
        let z = List.map (fun (a,b) -> (is_subtype a b)) z in
        List.fold (fun p b -> p && b) true z
      end
    end
  | _ -> false


let rec typeof expr G =
  match expr with
  | Nil -> Null
  | ConstBool _ -> Bool
  | ConstInt _ -> Int
  | This -> Machine
  | Nondet -> Bool
  | Event _ -> Type.Event
  | Expr.Var(v) -> G v
  | Expr.Bin(Idx, e1, e2) ->
    begin
      match typeof e1 G with
      | Seq(t1) -> 
        begin
          type_assert (is_subtype (typeof e1 G) Int) "Type error in indexing sequence"
          t1
        end
      | Map(t1, t2) ->
        begin
          type_assert (is_subtype (typeof e1 G) t1) "Type error in indexing map"
          t2
        end
      | _ -> raise Not_defined
    end
  | Expr.Bin(In, e1, e2) ->
    begin
      match typeof e2 G with
      | Map(t1, _) ->
        begin
          type_assert (is_subtype (typeof e1 G) t1) "Type error in key lookup"
          Bool
        end
      | _ -> raise Not_defined
    end
  | Expr.Bin(op, e1, e2) when is_intop op -> Int
  | Expr.Bin(op, e1, e2) when is_boolop op -> Bool
  | Expr.Bin(op, e1, e2) when is_relop op -> Bool
  | Expr.Bin(op, e1, e2) when is_comparison op -> Bool
  | Expr.Un(Not, e1) -> Bool
  | Expr.Un(Neg, e1) -> Int
  | Expr.Un(Keys, e1) -> 
    begin
      match typeof e1 G with
      | Map(t1, t2) -> Seq(t1)
      | _ -> raise Not_defined
    end
  | Expr.Un(Values, e1) ->
    begin
      match typeof e1 G with
      | Map(t1, t2) -> Seq(t2)
      | _ -> raise Not_defined
    end
  | Expr.Un(Sizeof, e1) -> Int
  | Expr.Dot(e, i) -> 
    begin
      let ts = typeof e G in
      match ts with
      | Type.Tuple(ls) -> List.nth ls i
      | _ -> raise Not_defined
    end
  | Cast(e, t) -> t
  | Expr.Tuple(es) -> Type.Tuple(List.map (fun e -> typeof e G) es)
  | _ -> raise Not_defined

let rec typeof_lval lval G =
  match lval with
  | Lval.Var(v) -> G v
  | Lval.Dot(l, i) -> 
    begin
      match (typeof_lval l G) with
      | Type.Tuple(ls) -> List.nth ls i
      | _ -> raise Not_defined
    end
  | Lval.Index(l, e) ->
    begin
      match typeof_lval l G with
      | Type.Seq(t) -> t
      | _ -> raise Not_defined
    end

let typecheck_stmt st G =
  match st with
  | Assign(l, e) -> type_assert (is_subtype (typeof_lval l G) (typeof e G)) (sprintf "Invalid assignment: %s" (print_stmt st))
  | Assume e ->  type_assert (is_subtype (typeof e G) Bool) (sprintf "Invalid assume: %s" (print_stmt st))
  | Insert(l, e1, e2) -> 
    match typeof_lval l G with
    | Seq(t) -> type_assert ((is_subtype (typeof e1 G) Int) && (is_subtype (typeof e2 G) t)) (sprintf "Invalid insert: %s" (print_stmt st))
    | Map(t1,t2) -> type_assert ((is_subtype (typeof e1 G) t1) && (is_subtype (typeof e2 G) t2)) (sprintf "Invalid insert: %s" (print_stmt st))
    | _ -> type_assert false (sprintf "Invalid insert: %s" (print_stmt st))
  | Remove(l, e) ->
    match typeof_lval l G with
    | Seq(t) -> type_assert (is_subtype (typeof e G) Int) (sprintf "Invalid remove: %s" (print_stmt st))
    | Map(t1,t2) -> type_assert (is_subtype (typeof e G) t1) (sprintf "Invalid remove: %s" (print_stmt st))
    | _ -> type_assert false (sprintf "Invalid remove: %s" (print_stmt st))


(* Quadratic time; can optimize *)
let rec find_all_types stmt G =
  let rec all_exprs e =
    let ret =
        match e with
        | Nil
        | ConstInt _
        | ConstBool _
        | Event _
        | This
        | Nondet
        | Expr.Var _ -> Set.empty
        | Bin(_, e1, e2) -> Set.union (all_exprs e1) (all_exprs e2)
        | Un(_, e') -> all_exprs e'
        | Expr.Dot(e', _) -> all_exprs e'
        | Cast(e, t) -> all_exprs e
        | Expr.Tuple(es) -> List.fold (fun s e -> Set.union s (all_exprs e)) Set.empty es
    in 
    ret.Add(e)
  in
  let all_types_expr e G = Set.map (fun e -> typeof e G) (all_exprs e) in
  let rec all_types_lval lval G =
    let ret =
      match lval with
      | Lval.Var(v) -> Set.empty
      | Lval.Dot(l, _) -> all_types_lval l G
      | Lval.Index(l, e) -> Set.union (all_types_lval l G) (all_types_expr e G)
    in
    ret.Add(typeof_lval lval G)
  in
  match stmt with
  | Assign(l, e) -> Set.union (all_types_expr e G) (all_types_lval l G)
  | Insert(l, e1, e2) -> Set.unionMany [(all_types_lval l G); (all_types_expr e1 G); (all_types_expr e2 G)]
  | Remove(l, e) -> Set.union (all_types_expr e G) (all_types_lval l G)
  | Assume(e) -> all_types_expr e G

let map_all_types stmtlist G =
  let types = List.fold (fun s stmt -> Set.union s (find_all_types stmt G)) Set.empty stmtlist in
  let types = Set.add Int types  in
  let (ret,_) = Set.fold (fun (m,i) t -> (Map.add t i m, i+1)) (Map.empty, 0) types in
  ret

let tuple_size t =
  match t with
  | Type.Tuple ls -> (List.length ls)
  | _ -> 0
  
(* find max tuple size *)
let max_tuple_size m = 
  Map.fold (fun max t _ -> if(max < tuple_size t) then tuple_size t else max) 0 m


(* global counter for fresh variables *)
let global_fresh_cnt = ref 0 in
let get_fresh_var () =
  begin
    let name = sprintf "_tmp%d" !global_fresh_cnt in
    global_fresh_cnt := !global_fresh_cnt + 1
    name
  end

let get_local ty G =
  let name = get_fresh_var() in
  (name, fun s -> if s = name then ty else G s)

(* Takes an expr as input, returns the re-written expr, a set of statements and updated environemt *)
let rec remove_side_effects_expr expr G =
  let (nexpr, stlist, nG) =
    match expr with
    | Nil
    | ConstInt _
    | ConstBool _
    | Event _
    | This
    | Nondet
    | Expr.Var(_) -> (expr, [], G)
    | Bin(op, e1, e2) ->
      begin
        let (e1', s1, G') = remove_side_effects_expr e1 G in
        let (e2', s2, G'') = remove_side_effects_expr e2 G' in
        (Bin(op, e1', e2'), s1 @ s2, G'')
      end
    | Un(op, e) ->
      begin
        let (e', s, G') = remove_side_effects_expr e G in
        (Un(op, e'), s, G')
      end
    | Expr.Dot(e,f) ->
      begin
        let (e', s, G') = remove_side_effects_expr e G in
        (Expr.Dot(e', f), s, G')
      end
    | Expr.Cast(e, t) -> 
      begin
        let (e', s, G') = remove_side_effects_expr e G in
        let (l, G'') = get_local t G' in
        (Expr.Var(l), s @ [Assign(Lval.Var(l), Expr.Cast(e',t))], G'')
      end
    | Expr.Tuple(es) ->
      begin
        let (a, b, c) = 
          List.fold (fun (partial_es, partial_stlist, partial_G) e -> 
            begin
              let (e', s, G') = remove_side_effects_expr e partial_G in
              (e' :: partial_es, partial_stlist @ s, G')
            end
            ) ([], [], G) es
        in
        let (l, Gfinal) = get_local (typeof expr G) c in
        (Expr.Var(l), b @ [Assign(Lval.Var(l), Expr.Tuple(List.rev a))], Gfinal)
      end
    in (nexpr, stlist, nG) 

(* Takes an lval as input, returns the re-written lval, a set of statements and updated environemt *)
let rec remove_side_effects_lval lval G =
  match lval with
  | Lval.Var(_) -> (lval, [], G)
  | Lval.Dot(l, f) -> 
    begin
      let (l', stlist, G') = remove_side_effects_lval l G in
      (Lval.Dot(l', f), stlist, G')
    end
  | Lval.Index(l, e) ->
    begin
      let (e', stlist1, G') = remove_side_effects_expr e G in
      let (l', stlist2, G'') = remove_side_effects_lval l G in
      (Lval.Index(l', e'), stlist1 @ stlist2, G'')
    end

let remove_side_effects_stmt stmt G =
  match stmt with
  | Assign(l, e) -> 
    begin
      let (l', d1, G') = remove_side_effects_lval l G in
      let (e', d2, G'') = remove_side_effects_expr e G' in
      (d1 @ d2 @ [Assign(l', e')], G'')
    end
  | Insert(l, e1, e2) ->
    begin
      let (l', d1, G') = remove_side_effects_lval l G in
      let (e1', d2, G'') = remove_side_effects_expr e1 G' in
      let (e2', d3, G''') = remove_side_effects_expr e2 G'' in
      (d1 @ d2 @ d3 @ [Insert(l', e1', e2')], G''')
    end
  | Remove(l, e) ->
    begin
      let (l', d1, G') = remove_side_effects_lval l G in
      let (e', d2, G'') = remove_side_effects_expr e G' in
      (d1 @ d2 @ [Remove(l', e')], G'')
    end
  | Assume(e) ->
    begin
      let (e', d, G') = remove_side_effects_expr e G in
      (d @ [Assume(e')], G')
    end

(* returns new list of statements and the new G *)
let remove_side_effects_stlist stlist G =
  List.fold (fun (partial_stlist, partial_G) stmt ->
    begin
      let (d, G') = remove_side_effects_stmt stmt partial_G in
      (partial_stlist @ d, G')
    end
    ) ([], G) stlist

(* returns a list of statements and a new G *)
let rec normalize_lval_stmt st G =
  match st with
  | Assign(lval, e) ->
    begin
      match lval with
         (* l.f = e
          * ==> 
          * l = (l.0, l.1, ..., e)
          *)
      | Lval.Dot(l, f) -> 
        begin
          let t = tuple_size (typeof_lval l G) in
          let rhs = ref [] in
          for i = (t-1) downto 0 do
            if i = f then rhs := e :: !rhs 
            else rhs := Expr.Dot(lval_to_expr l, f) :: !rhs
          normalize_lval_stmt (Assign(l, Expr.Tuple !rhs)) G
        end
      | Lval.Index(Lval.Var(_), _) -> ([st], G)
         (* l[e'] = e
          * ==> 
          * t = l; t[e'] = e; l = t
          *)
      | Lval.Index(l, e') ->
        begin
          let (t, G') = get_local (typeof_lval l G) G in
          let s1 = Assign(Lval.Var(t), lval_to_expr l) in
          let s2 = Assign(Lval.Index(Lval.Var(t), e'), e) in
          let s3 = Assign(l, Expr.Var(t)) in
          let (s3list, G'') = normalize_lval_stmt s3 G' in
          ([s1; s2] @ s3list, G'')
        end
      | _ -> ([st], G)
    end
  | Remove(lval, e) ->
    begin
      match lval with
      (* lval -= e
       * ==>
       * t = lval; t -= e; lval = t
       *)
      | Lval.Dot(_ ,_)
      | Lval.Index(_, _) ->
        begin
          let (t, G') = get_local (typeof_lval lval G) G in
          let s1 = Assign(Lval.Var(t), lval_to_expr lval) in
          let s2 = Remove(Lval.Var(t), e) in
          let s3 = Assign(lval, Expr.Var(t)) in
          let (s3list, G'') = normalize_lval_stmt s3 G' in
          ([s1; s2] @s3list, G'')
        end
      | _ -> ([st], G)
    end
  | Insert(lval, e1, e2) ->
    begin
      match lval with
      (* lval += (e1,e2)
       * ==>
       * t = lval; t += (e1,e2); lval = t
       *)
      | Lval.Dot(_, _) 
      | Lval.Index(_, _) ->
        begin
          let (t, G') = get_local (typeof_lval lval G) G in
          let s1 = Assign(Lval.Var(t), lval_to_expr lval) in
          let s2 = Insert(Lval.Var(t), e1, e2) in
          let s3 = Assign(lval, Expr.Var(t)) in
          let (s3list, G'') = normalize_lval_stmt s3 G' in
          ([s1; s2] @s3list, G'')
        end
      | _ -> ([st], G)
    end
  | _ -> ([st], G)

(* returns new list of statements and the new G *)
let normalize_lval_stlist stlist G =
  List.fold (fun (partial_stlist, partial_G) stmt ->
    begin
      let (d, G') = normalize_lval_stmt stmt partial_G in
      (partial_stlist @ d, G')
    end
    ) ([], G) stlist
      
(* Translation of normalized side-effect-free programs to Boogie *)

(*
let rec translate_expr expr G =
  match expr with
  | Expr.Const(i) -> sprintf "PrtFromInt(%d)" i 
  | Expr.Var(v) -> v
  | Expr.Op(e1, e2) -> sprintf "PrtFromInt(PrtToInt(%s) + PrtToInt(%s))" (translate_expr e1 G) (translate_expr e2 G)
  | Expr.Dot(e, f) -> sprintf "PrtSelectFn_%d(%s)" f (translate_expr expr G)
  | Expr.Index(e1, e2) -> sprintf "ReadSeq(%s, PrtToInt(%s))" (translate_expr e1 G) (translate_expr e2 G)
  | Expr.Cast(_, _) -> raise Not_defined
  | Expr.Tuple(_) -> raise Not_defined

let translate_assign lval expr G typemap =
  let gen_rhs_value e G =
    let rhs_var = "tmp_rhs_value" in
    printfn "%s := %s;" rhs_var (translate_expr e G)
    rhs_var
  in
  let gen_type_assertion rhs_var t1 t2 =
    if is_subtype t1 t2 then
      ()   (* redundant cast *)
    else
      (* TODO: This is more strict than what P allows *)
      (* P will actually go inspect all keys/values inside seq and maps and assert they are of the right type *)
      (* We avoid this enumeration of the data structure, but may reject some valid P programs *)
      printfn "assert PrtSubType(PrtDynamicType(%s), PrtType%d);" rhs_var (Map.find t2 typemap)
  in 
  let get_lhs_var lval = match lval with
                         | Lval.Var(v) -> v
                         | _ -> raise Not_defined
  in

  match (lval, expr) with 
  | _, Expr.Cast(e, t) -> 
    begin
      (* evaluate rhs *)
      let rhs_var = gen_rhs_value e G in
      (* generate type assertion *)
      gen_type_assertion rhs_var (typeof e G) t
      printfn "%s := %s;" (get_lhs_var lval) rhs_var      
    end
  | _, Expr.Tuple(es) ->
    begin
      for i = 0 to (List.length es) - 1 do
        let ei = (List.nth es i) in
        printfn "tmp_rhs_value_%d := %s;" i (translate_expr ei G)
      printfn "call %s := AllocatePrtRef();" (get_lhs_var lval)
      printfn "assume PrtDynamicType(%s) == PrtType%d;" (get_lhs_var lval) (Map.find (typeof_lval lval G) typemap)
      for i = 0 to (List.length es) - 1 do
        printfn "assume PrtSelectFn_%d(%s) == tmp_rhs_value_%d;" i (get_lhs_var lval) i
    end
  | Lval.Index(Lval.Var(lhs_var), e), _ ->
    begin
      printfn "call %s := WriteSeq(%s, PrtToInt(%s), %s);" lhs_var lhs_var (translate_expr e G) (translate_expr expr G)
    end
  | _, _ ->
      printfn "%s := %s;" (get_lhs_var lval) (translate_expr expr G)


let translate_insert v e1 e2 G =
  printfn "call %s := InsertSeq(%s, %s, %s);" v v (translate_expr e1 G) (translate_expr e2 G)

let translate_remove v e1 G =
  printfn "call %s := RemoveSeq(%s, %s);" v v (translate_expr e1 G)

let translate_stmt stmt G typemap =
  match stmt with
  | Assign(l, e) -> translate_assign l e G typemap
  | Insert(Lval.Var(v), e1, e2) -> translate_insert v e1 e2 G
  | Remove(Lval.Var(v), e1) -> translate_remove v e1 G
  | Assume(e) -> printfn "assume %s;" (translate_expr e G)
  | Send(e) -> printfn "call PrtSend(%s);" (translate_expr e G)
  | _ -> raise Not_defined

let printfn_comment x = 
  printf "// "
  printfn x
   
[<EntryPoint>]
let main argv = 
    printfn_comment "Input program:";
    List.iter (fun s -> printfn_comment "%s" (print_stmt s)) stmtlist;
    printfn_comment "Input type environment";
    Map.iter (fun v t -> printfn_comment "%s -> %s" v (print_type t)) env;

    let G = fun v -> if Map.containsKey v env then Map.find v env else raise Not_defined in

    (* Remove side effects *)
    let (stmtlist, G) = normalize_lval_stlist stmtlist G in
    let (stmtlist, G) = remove_side_effects_stlist stmtlist G in

    printfn_comment "Side-effect-free program:"
    List.iter (fun s -> printfn_comment "%s" (print_stmt s)) stmtlist;

    (* Enumerate types in the program *)
    printfn "type PrtType;";
    let typemap = map_all_types stmtlist G in
    Map.iter (fun t i -> printfn "const unique PrtType%d: PrtType; // %s" i (print_type t)) typemap;

    (* Enumerate the subtyping relationship *)
    printfn "function PrtSubType(PrtType,PrtType):bool;";
    Map.iter (fun t1 i1 -> 
      Map.iter (fun t2 i2 -> 
      begin
        if is_subtype t1 t2 then printfn "axiom PrtSubType(PrtType%d, PrtType%d);" i1 i2
        else printfn "axiom !PrtSubType(PrtType%d, PrtType%d);" i1 i2
      end
      ) typemap) typemap;

    let max_fields = max_tuple_size typemap in

    (* ref type *)
    printfn "type {:datatype} PrtRef;"
    printfn "function {:constructor} Null() : PrtRef;"
    printfn "function {:constructor} ConstInt(value:int) : PrtRef;"
    printfn "function {:constructor} ConstBool(value:bool) : PrtRef;"
    printfn "function {:constructor} Machine(mid:int) : PrtRef;"
    printfn "function {:constructor} Event(typ:int) : PrtRef;"
    for i = 1 to max_fields do
      printf "function {:constructor} Tuple%d(" i
      for j = 0 to (i-1) do
        printf "f%d:PrtRef" j
      printfn "): PrtRef;"
    printfn "function {:constructor} Seq(size:int, map: [int]PrtRef) : PrtRef;"
    printfn "function {:constructor} Map(size:int, keys: [int]PrtRef, values: [int]PrtRef, lookup_index: [PrtRef]int, keyset: [PrtRef]bool) : PrtRef;"
    printfn ""

    (* runtime type *)
    printfn "function PrtDynamicType(PrtRef):PrtType;"
    printfn ""

    (* Allocation *)
    printfn "procedure {:allocator} AllocatePrtRef() returns (x: PrtRef);"
    printfn ""

    (* Sequence *)
    printfn "function {:inline} SeqIndexInBounds(seq: PrtRef, index: int) : bool"
    printfn "{ 0 <= index && index < size#Seq(seq) }"

    printfn "function {:inline} ReadSeq(seq: PrtRef, index: int) : PrtRef"
    printfn "{ map#Seq(seq)[index] }"

    printfn "procedure {:inline} WriteSeq(seq: PrtRef, index: int, value: PrtRef)  returns (nseq: PrtRef);"
    printfn "procedure {:inline} InsertSeq(seq: PrtRef, index: int, value: PrtRef)  returns (nseq: PrtRef);"
    printfn "procedure {:inline} RemoveSeq(seq: PrtRef, index: int)  returns (nseq: PrtRef);"

    (* Maps *)
    printfn "function {:inline} MapContainsKey(m: PrtRef, index: PrtRef) : bool"
    printfn "{ keyset#Map[index] }"

    printfn "function {:inline} ReadMap(m: PrtRef, index: PrtRef) : PrtRef"
    printfn "{ values#Map(m)[lookup_index#Map(m)[index]] }"

    printfn "function {:inline} MapGetKeys(m: PrtRef) : PrtRef"
    printfn "{  }"


    printfn "procedure {:inline} WriteMap(seq: PrtRef, index: int, value: PrtRef)  returns (nseq: PrtRef);"
    printfn "procedure {:inline} InsertMap(seq: PrtRef, index: int, value: PrtRef)  returns (nseq: PrtRef);"
    printfn "procedure {:inline} RemoveMap(seq: PrtRef, index: int)  returns (nseq: PrtRef);"

    printfn "procedure main() {"
    List.iter (fun s -> translate_stmt s G typemap) stmtlist
    printfn "}"

    0 // return an integer exit code
*)