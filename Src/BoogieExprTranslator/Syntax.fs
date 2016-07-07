namespace Microsoft.P2Boogie
module Syntax =
  open System

  (* Types *)
  [<Serializable>]
  type Type = Null | Bool | Int | Machine | Event | Any 
              | Seq of Type | Map of Type * Type 
              | Tuple of Type list
              | NamedTuple of (string * Type) list
              | ModelType of string

  (* Events *)
  [<Serializable>]
  type Card = Assert of int
              | Assume of int 

  [<Serializable>]  
  type EventDecl(name: string, qc: Card option, typ: Type option)=
    member this.Name = name
    member this.QC = qc
    member this.Type = typ

  (* operators *)
  [<Serializable>]
  type BinOp = Add | Sub | Mul | Intdiv | And | Or | Eq | Neq | Lt | Le | Gt | Ge | Idx | In

  [<Serializable>]
  type UnOp = Not | Neg | Keys | Values | Sizeof

  (* Expressions *)
  [<Serializable>]
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

  [<Serializable>]
  type Lval = Var of string | Dot of Lval * int | NamedDot of Lval * string | Index of Lval * Expr

  (* Statements *)
  [<Serializable>]
  type Stmt = 
    | Assign of Lval * Expr 
    | Insert of Lval * Expr * Expr 
    | Remove of Lval * Expr 
    | Assert of Expr
    | Assume of Expr
    | NewStmt of string * Expr
    | Raise of Expr * Expr
    | Send of Expr * Expr * Expr
    | Skip
    | While of Expr * Stmt
    | Ite of Expr * Stmt * Stmt
    | SeqStmt of Stmt list
    | Receive of (string * string) list 
    | Pop
    | Return of Expr option
    | Monitor of Expr * Expr  
    | FunStmt of string * Expr list * string option

  (* Variable and type *)
  [<Serializable>]
  type VarDecl(name: string, typ: Type) =
    member this.Name = name
    member this.Type = typ

  [<Serializable>]
  type FunDecl(name: string, formals: VarDecl list, rettype: Type option, 
                  locals: VarDecl list, body: Stmt list, is_model: bool, is_pure: bool, env_empty: bool, env_vars: VarDecl list option) =
    member this.Name = name
    member this.Formals = formals
    member this.RetType = rettype
    member this.Locals = locals
    member this.Body = body
    member this.IsModel = is_model
    member this.IsPure = is_pure
    member this.EnvEmpty = env_empty
    member this.EnvVars = env_vars

//Implicitly assumes that there are no conflicts in the names of locals and formals.
    member this.VarMap = 
      let ls =
        let map = ref Map.empty in
        List.iter (fun (var: VarDecl) -> map := Map.add var.Name var.Type !map) 
          this.Locals
        !map 
      in
        let fs = 
          let map = ref Map.empty in
          List.iter (fun (var: VarDecl) -> map := Map.add var.Name var.Type !map) 
            this.Formals
          !map 
        in
           (Map.fold (fun acc key value -> Map.add key value acc) ls fs)

  [<Serializable>]
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
  
  [<Serializable>]
  type StateDecl(name: string, temperature: string, entryaction: string option, exitaction: string option, transitions: TransDecl.T list, dos: DoDecl.T list) =
    member this.Name = name
    member this.Temperature = temperature
    member this.EntryAction = entryaction
    member this.ExitAction = exitaction
    member this.Transitions = transitions
    member this.Dos = dos
   
  [<Serializable>]
  type MachineDecl(name: string, start_state: string, globals: VarDecl list, 
                      functions: FunDecl list, states: StateDecl list, 
                      is_monitor: bool, monitors_list: string List, 
                      qc: Card option, is_model: bool) =
    member this.Name = name
    member this.StartState = start_state
    member this.Globals = globals
    member this.Functions = functions
    member this.States = states
    member this.IsMonitor = is_monitor
    member this.MonitorList = monitors_list
    member this.QC = qc;
    member this.IsModel = is_model

    member this.StateMap =
      let map = ref Map.empty in
      List.iter (fun (state: StateDecl) -> map := Map.add state.Name state !map) this.States
      !map       
     
    member this.FunMap = 
      let map = ref Map.empty in
      List.iter (fun (fd: FunDecl) -> map := Map.add fd.Name fd !map) this.Functions
      !map
  
    member this.VarMap =
      let map = ref Map.empty in
      List.iter (fun (var: VarDecl) -> map := Map.add var.Name var.Type !map) this.Globals
      !map       
   
  [<Serializable>]
  [<AllowNullLiteral>]
  type ProgramDecl(mainmachine: string, machines: MachineDecl list, 
                      events: EventDecl list, static_funs: FunDecl list) =
    member this.MainMachine = mainmachine
    member this.Machines = machines
    member this.Events = events
    member this.StaticFuns = static_funs
    
    member this.MachineMap =
      let map = ref Map.empty in
      List.iter (fun (machine: MachineDecl) -> map := Map.add machine.Name machine !map) this.Machines
      !map       
    
    member this.FunMap =
      let map = ref Map.empty in
      List.iter (fun (fd: FunDecl) -> map := Map.add fd.Name fd !map) this.StaticFuns
      !map       
   
    member this.EventMap =
      let map = ref Map.empty in
      List.iter (fun (event: EventDecl) -> map := Map.add event.Name event !map) this.Events
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


