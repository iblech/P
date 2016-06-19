module Helper

open System
open Syntax
open Common

(* Helpers *)
let rec lval_to_expr lval =
  match lval with
  | Lval.Var(v) -> Expr.Var(v)
  | Lval.Dot(l, i) -> Expr.Dot(lval_to_expr l, i)
  | Lval.NamedDot(l, f) -> Expr.NamedDot(lval_to_expr l, f)
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

let lookup_named_field_type f ts =
  let (a,b) = List.find (fun (a,b) -> a = f) ts
  in b

let lookup_named_field_index f ts =
  List.findIndex (fun (a,b) -> a = f) ts
   
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
  | Type.NamedTuple nls -> sprintf ("%s") (print_list (fun (f,t) -> sprintf "%s: %s" f (print_type t)) nls)
  | Type.ModelType s -> sprintf "Model(%s)" s

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
  | Default(t) -> sprintf "default(%s)" (print_type t)
  | New(s, arg) -> sprintf "new %s(%s)" s (print_expr arg)
  | Expr.NamedDot(e,f) -> sprintf "%s.%s" (print_expr e) f
  | Expr.NamedTuple(es) -> sprintf "(%s)" (print_list (fun (f,e) -> sprintf "%s: %s" f (print_expr e)) es)
  | Expr.Call(callee, args) -> sprintf "%s(%s)" callee (print_list print_expr args)
   
let rec print_lval (l: Lval) =
  match l with
  | Lval.Var(v) -> v
  | Lval.Dot(v, i) -> sprintf "%s.%d" (print_lval v) i
  | Lval.NamedDot(v, f) -> sprintf "%s.%s" (print_lval v) f
  | Lval.Index(l, e) -> sprintf "%s[%s]" (print_lval l) (print_expr e) 

let print_stmt s =
  match s with
  | Assign(l, e) -> sprintf "%s = %s" (print_lval l) (print_expr e)
  | Insert(l, e1, e2) -> sprintf "%s += (%s, %s)" (print_lval l) (print_expr e1) (print_expr e2)
  | Remove(l, e) -> sprintf "%s -= %s" (print_lval l) (print_expr e)
  | Assume(e) -> sprintf "assume %s" (print_expr e)

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
  (name, Map.add name ty G)
