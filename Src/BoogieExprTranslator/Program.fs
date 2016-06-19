
module Program
open System

(* Types *)
type Type = Null | Bool | Int | Machine | Event | Any 
           | Seq of Type | Map of Type * Type 
           | Tuple of Type list
           | NamedTuple of (string * Type) list
           | ModelType of string

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
  | NamedDot of Expr * string 
  | Cast of Expr * Type 
  | Tuple of Expr list
  | NamedTuple of (string * Expr) list
  | New of string * Expr 
  | Default of Type
  | Call of string * Expr list

type Lval = Var of string | Dot of Lval * int | NamedDot of Lval * string | Index of Lval * Expr

(* Statements *)
type Stmt = 
  | Assign of Lval * Expr 
  | Insert of Lval * Expr * Expr 
  | Remove of Lval * Expr 
  | Assume of Expr 
  | Assert of Expr
  | NewStmt of string * Expr
  | Raise of Expr * Expr
  | Send of Expr * Expr * Expr
  | Skip
  | While of Expr * Stmt
  | Ite of Expr * Stmt * Stmt
  | SeqStmt of Stmt list
  (*
  | Cases of (string * string) list
  | Receive of (string * string) list 
  | Pop
  | Return of Expr
  | Monitor of Expr * Expr  
  | FunStmt of string * Expr list * string option
  *)

(* Variable and type *)
type VarDecl = (string * Type)

module FunDecl =
  (* name, params, return, locals, body *)
  type T = string * VarDecl list * Type option * VarDecl list * Stmt

  let get_name (f: T) =
    let (name, _, _, _, _) = f in name

module TransDecl =

  type T = 
    | Push of string * string
    | Call of string * string * string

  let get_event td =
    match td with
    | Push(e, _) -> e
    | Call(e, _, _)  -> e

  let get_dest td =
    match td with
    | Push(_, s) -> s
    | Call(_, s, _)  -> s

module DoDecl =

  type T =
    | Defer of string
    | Ignore of string
    | Call of string * string

  let get_event td =
    match td with
    | Defer e-> e
    | Ignore e -> e
    | Call(e, _)  -> e
  
module StateDecl =
  (* name, entryaction, exitaction, transitions, dos  *)
  type T = string * string * string * TransDecl.T list * DoDecl.T list

  let get_name (st : T) =
    let (name, _, _, _, _) = st in name

  let get_entryaction (st : T) =
    let (_, name, _, _, _) = st in name

  let get_exitaction (st : T) =
    let (_, _, name, _, _) = st in name

  let get_transitions (st : T) =
    let (_, _, _, tr, _) = st in tr

  let get_dos (st : T) =
    let (_, _, _, _, tr) = st in tr
 
module MachineDecl =
  (* name, is_monitor, start state, globals, functions, states *)
  type T = string * bool * string * VarDecl list * FunDecl.T list * StateDecl.T list

  let get_name (m: T) =
    let (name, _, _, _, _, _) = m in name   

  let is_monitor (m: T) =
    let (_, b, _, _, _, _) = m in b   

  let get_start_state_name (m: T) =
    let (_, _, ss, _, _, _) = m in ss   

  let get_globals (m: T) =
    let (_, _, _, g, _, _) = m in g   

  let get_funs (m: T) =
    let (_, _, _, _, f, _) = m in f   

  let get_states (m: T) =
    let (_, _, _, _, _, states) = m in 
    let map = ref Map.empty in
    List.iter (fun state -> map := Map.add (StateDecl.get_name state) state !map) states
    !map       
    
(* Input program *)
let stmtlist = [ 
                 Assign(Lval.Var("c"), Expr.Tuple [Expr.ConstInt 1; Expr.ConstInt 2]);  // c = (1,2)
                 Assign(Lval.Var("x"), Expr.Var("y"));  // x = y
                 Assign(Lval.Var("d"), Expr.Var("c"));  // d = c
                 Assign(Lval.Var("c"), Expr.Cast(Expr.Var("d"), Type.Tuple [Int; Int]));  // d = c
                 Insert(Lval.Index(Lval.Var("f"), Expr.ConstInt(0)), Expr.Bin(Idx, Expr.Var("e"), Expr.ConstInt(1)), Expr.ConstInt(2)); // f[0] += (e[1], 2)
                 Assign(Lval.Var("g"), New("M", Expr.ConstInt 1)); // g = new M(1)
                 Assign(Lval.Var("f"), Default(Type.Seq (Type.Seq Int))); // f = default(seq[seq[int]])
                 Assign(Lval.Var("h"), Default(Type.Tuple [Type.Tuple [Any; Any]; Int])); // h = default(((any,any),int)))
                 Assign(Lval.Var("i"), Expr.NamedTuple([("f1", Expr.ConstInt 1); ("f2", Expr.ConstBool true)])); // i = (f1: 1, f2: true)
                 Assign(Lval.Var("a"), Expr.NamedDot(Expr.Var("i"), "f1")); // a = i.f1
               ]

let env = Map.ofList [ 
            ("a", Int); 
            ("b", Any); 
            ("c", Type.Tuple [Int; Int]); 
            ("d", Type.Tuple [Any; Any]); 
            ("e", Type.Seq Int);
            ("f", Type.Seq (Type.Seq Int));
            ("g", Type.Machine);
            ("h", Type.Tuple [Type.Tuple [Any; Any]; Int]);
            ("i", Type.NamedTuple [("f1", Type.Int); ("f2", Type.Bool)]);
            ("x", Int); 
            ("y", Int) 
          ]


