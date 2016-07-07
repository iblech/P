namespace Microsoft.P2Boogie
module RemoveNamedTuples = 
  open Syntax
  open Common
  open Helper
  open ProgramTyping

  let rec process_type ty =
    match ty with
    | Type.NamedTuple ts -> Type.Tuple (List.map (fun (a,b) -> process_type b) ts)
    | Seq t -> Seq (process_type t)
    | Map(t1,t2) -> Map(process_type t1, process_type t2)
    | Type.Tuple ts -> Type.Tuple (List.map (fun a -> process_type a) ts)
    | _ -> ty

  let rec process_expr G expr =
    match expr with
    | Nil
    | ConstInt _
    | ConstBool _
    | Event _
    | This
    | Nondet
    | Expr.Var _ -> expr
    | Default t -> Default (process_type t)
    | Bin(op, e1, e2) -> Bin(op, process_expr G e1 , process_expr G e2)
    | Un(op, e) -> Un(op, process_expr G e)
    | Expr.Dot(e,i) -> Expr.Dot(process_expr G e, i)
    | Expr.NamedDot(e, f) ->
    begin
      let (Type.NamedTuple(ts)) = typeof e G in
      let index = lookup_named_field_index f ts in
        Expr.Dot(process_expr G e , index)
    end
    | Cast(e, t) -> Cast(process_expr G e, process_type t)
    | Tuple(es) -> Tuple(List.map (fun e -> process_expr G e) es)
    | NamedTuple(es) -> Tuple(List.map (fun (f,e) -> process_expr G e) es)
    | New(s, e) -> New(s, process_expr G e)
    | Call(callee, args) -> Call(callee, List.map (fun e -> process_expr G e) args)

  let rec process_lval G lval =
    match lval with
    | Var _ -> lval
    | Dot(l, i) -> Dot(process_lval G l, i)
    | NamedDot(l, f) -> 
    begin
      let (Type.NamedTuple(ts)) = typeof_lval l G in
      Dot(process_lval G l, lookup_named_field_index f ts)
    end
    | Index(l, e) -> Index(process_lval G l, process_expr G e)

  let rec process_stmt G st =
    match st with
    | Assign(l, e) -> Assign(process_lval G l, process_expr G e)
    | Insert (l, e1, e2) -> Insert(process_lval G l, process_expr G e1, process_expr G e2)
    | Remove (l, e) -> Remove(process_lval G l, process_expr G e)
    | Assume e -> Assume (process_expr G e)
    | Assert e -> Assert (process_expr G e)
    | NewStmt(_, Nil) -> st
    | NewStmt(s, e)-> NewStmt(s, (process_expr G e))
    | Raise(e1, Nil) -> Raise((process_expr G e1), Nil)
    | Raise(e1, e2) -> Raise((process_expr G e1), (process_expr G e2))
    | Send (e1, e2, Nil) -> Send((process_expr G e1), (process_expr G e2), Nil)
    | Send (e1, e2, e3) -> Send((process_expr G e1), (process_expr G e2), (process_expr G e3))
    | Skip -> st
    | While(c, s) -> While((process_expr G c), (process_stmt G s))
    | Ite(c, i, e) -> Ite((process_expr G c), (process_stmt G i), (process_stmt G e))
    | SeqStmt(l) -> SeqStmt(List.map (process_stmt G) l)
    | Receive(l) -> st //Come back!
    | Pop -> st
    | Return(None) -> st
    | Return(Some(e)) -> Return (Some (process_expr G e))
    | Monitor(e1, e2) -> Monitor((process_expr G e1), (process_expr G e2))
    | FunStmt(s, el, None) -> FunStmt(s, (List.map (process_expr G) el), None)
    | FunStmt(s, el, v) -> FunStmt(s, (List.map (process_expr G) el), v)

  let process_env G =
    Map.map (fun key value -> process_type value) G

  let process_vd (vd: VarDecl) = 
    new VarDecl(vd.Name, (process_type vd.Type))
  
  let process_ed (ed: EventDecl) = 
    match ed.Type with 
    | None -> ed
    | Some(t) -> new EventDecl(ed.Name, ed.QC, Some(process_type t))

 ///Return a new FunDecl with all named tuples removed.
  let remove_named_tuples_fn G (f: FunDecl) = 
    let G' = merge_maps G f.VarMap
    let formals = List.map process_vd f.Formals
    let retType = 
      match f.RetType with
      | None -> None
      | Some(t) -> Some(process_type(t))
    let locals = List.map process_vd f.Locals
    let stmts = List.map (process_stmt G') f.Body
    let envVars = 
      match f.EnvVars with
      | None -> None  
      | Some(ls) -> Some(List.map process_vd ls)
    new FunDecl(f.Name, formals, retType, locals, stmts, f.IsModel, f.IsPure, f.EnvEmpty, envVars)

  ///Return a new MachineDecl with all named tuples removed. 
  let remove_named_tuples_machine G (m:MachineDecl) = 
    let funs = 
      let map = ref Map.empty in
        List.iter (fun(f: FunDecl) -> map := Map.add f.Name (if f.RetType.IsSome then f.RetType.Value else Type.Null) !map) m.Functions
      !map 
    let G' = merge_maps (merge_maps G m.VarMap) funs
    let globals = List.map process_vd m.Globals
    let fList = List.map (remove_named_tuples_fn G') m.Functions 
    new MachineDecl(m.Name, m.StartState, globals, fList, m.States, m.IsMonitor, m.MonitorList, m.QC, m.IsModel)

  ///Return a new ProgramDecl with all named tuples removed.  
  let remove_named_tuples_program (prog: ProgramDecl) = 
    let G =           
      let map = ref Map.empty in
        List.iter (fun(f: FunDecl) -> map := Map.add f.Name (if f.RetType.IsSome then f.RetType.Value else Type.Null) !map) prog.StaticFuns
      !map 
    let eList = List.map process_ed prog.Events
    let mList = List.map (remove_named_tuples_machine G) prog.Machines
    let fList = List.map (remove_named_tuples_fn G) prog.StaticFuns
    new ProgramDecl(prog.MainMachine, mList, eList, fList)