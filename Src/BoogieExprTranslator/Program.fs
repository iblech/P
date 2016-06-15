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


(* Exception for everything that we don't want to do *)
exception Not_defined;

(* Type exception for everything we don't want to type *)
exception Type_exception of string;


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

let is_seq t =
  match t with
  | Seq _ -> true
  | _ -> false

let is_map t =
  match t with
  | Map _ -> true
  | _ -> false

let get_domain_type t =
  match t with
  | Map(t1,t2) -> t1
  | _ -> raise Not_defined

let get_range_type t =
  match t with
  | Map(t1, t2) -> t2
  | Seq(t2) -> t2
  | _ -> raise Not_defined

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
  if (not b) then 
    begin
      printfn "%s" s
      raise (Type_exception s)
    end

let rec is_subtype t1 t2 =
  match (t1, t2) with
  | (_, Any) -> true
  | (Null, Machine) -> true
  | (Null, Type.Event) -> true
  | (a,b) when a = b -> true
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
          type_assert (is_subtype (typeof e2 G) Int) (sprintf "Type error in indexing sequence: %s" (print_expr expr))
          t1
        end
      | Map(t1, t2) ->
        begin
          type_assert (is_subtype (typeof e2 G) t1) "Type error in indexing map"
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
    | Expr.Var(_) -> (expr, [], G)
    | Nondet -> 
      begin
        let (l, G') = get_local Bool G in
        (Expr.Var(l), [Assign(Lval.Var(l), Nondet)], G')
      end
    | Bin(op, e1, e2) when (op = Eq || op = Neq) ->
      begin
        let (e1', s1, G') = remove_side_effects_expr e1 G in
        let (e2', s2, G'') = remove_side_effects_expr e2 G' in
        let (l, G''') = get_local Bool G'' in
        let nexpr = if op = Eq then Expr.Var(l) else Expr.Un(Not, Expr.Var(l)) in
        (nexpr, s1 @ s2 @ [Assign(Lval.Var(l), Bin(Eq, e1', e2'))], G''')
      end
    | Bin(op, e1, e2) when op = In || op = Idx ->
      begin
        let (l, G') = get_local (typeof expr G) G in
        let (e1', s1, G'') = remove_side_effects_expr e1 G' in
        let (e2', s2, G''') = remove_side_effects_expr e2 G'' in
        (Expr.Var(l), s1 @ s2 @ [Assign(Lval.Var(l), Bin(op, e1', e2'))], G''')
      end
    | Bin(op, e1, e2) ->
      begin
        let (e1', s1, G') = remove_side_effects_expr e1 G in
        let (e2', s2, G'') = remove_side_effects_expr e2 G' in
        (Bin(op, e1', e2'), s1 @ s2, G'')
      end
    | Un(Keys, e) ->
      begin
        let (l, G') = get_local (Seq (get_domain_type (typeof e G))) G in
        (Expr.Var(l), [Assign(Lval.Var(l), expr)], G')
      end
    | Un(Values, e) ->
      begin
        let (l, G') = get_local (Seq (get_range_type (typeof e G))) G in
        (Expr.Var(l), [Assign(Lval.Var(l), expr)], G')
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
    | Expr.Cast(e, t) when (is_subtype (typeof e G) t) -> 
      begin
        (* redundant cast *)
        remove_side_effects_expr e G
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

let translate_type t typmap =
  match t with
  | Null -> "PrtTypeNull"
  | Bool -> "PrtTypeBool"
  | Int -> "PrtTypeInt"
  | Machine -> "PrtTypeMachine"
  | Type.Event -> "PrtTypeEvent"
  | Any -> raise Not_defined
  | Type.Tuple(ls) -> sprintf "PrtTypeTuple%d" (List.length ls)
  | Type.Seq(t) -> sprintf "PrtTypeSeq%d" (Map.find t typmap)
  | Type.Map(t1, t2) -> sprintf "PrtTypeMap%d" (Map.find t typmap)

let event_to_int_map = ref Map.empty
let event_to_int_counter = ref 0

let rec translate_expr expr G =
  match expr with
  | Nil -> "null"
  | Expr.ConstInt(i) -> sprintf "PrtConstructFromInt(%d)" i 
  | Expr.ConstBool(b) -> if b then "PrtTrue" else "PrtFalse"
  | Expr.This -> "null" (* TODO: Fix *)
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

  match (lval, expr) with 
  | _, Expr.Cast(e, t) -> 
    begin
      (* evaluate rhs *)
      let rhs_var = gen_rhs_value e G in
      (* generate type assertion *)
      types_asserted := Set.add t !types_asserted
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
    List.iter (fun s -> 
      begin
        printfn_comment "%s" (print_stmt s)
        translate_stmt s G typemap
      end
    ) stmtlist
    printfn "}"

    (* Equals *)
    print_equals(max_fields)
    
    let s = IO.File.ReadAllLines("CommonBpl.bpl") in
    Array.iter (fun s -> printfn "%s" s) s
    0 // return an integer exit code
