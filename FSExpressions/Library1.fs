namespace FSExpressions

open System

module Expressions =
    (* Types *)
    type Type = Null | Bool | Int | Machine | Event | Any 
               | Seq of Type 
               | Map of Type * Type 
               | Tuple of Type list
               | NamedTuple of (string * Type) list

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
      | Halt
      | Null
      | Var of string 
      | Bin of BinOp * Expr * Expr 
      | Un of UnOp * Expr
      | Dot of Expr * int 
      | Cast of Expr * Type 
      | Tuple of Expr list
      | NamedTuple of (string * Expr) list
      | New of string * Expr list
      | Default of Type
      | FunApp of string * Expr list 
      (* Note : Exprs is just an Expr list. *)


    type Lval = Var of string 
                | Dot of Lval * int 
                | Index of Lval * Expr

    (* Statements *)
    type Stmt = Assign of Lval * Expr 
               | Insert of Lval * Expr * Expr 
               | Remove of Lval * Expr 
               | Assert of Expr 
               | New of Expr
               | Seq of Stmt * Stmt
               | Ite of Expr * Stmt * Stmt
               | While of Expr * Stmt
               | FunStmt of Lval * String * Expr list
               (* | Raise of Type.Event *)
               (* | Send of Expr Come  Back *)
               | Skip (* Can we just say Skip is null? *)
               | Pop
               | Return of Expr
               | Receive of Cases

    type Cases = 
    



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
      | Default(t) -> sprintf "default(%s)" (print_type t)
      | New(s, args) -> sprintf "new %s(%s)" s (print_list print_expr args)
 
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
