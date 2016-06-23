namespace Microsoft.P2Boogie

module Helper=
        
  open System
  open Syntax
  open Common

  let mutable prog: Syntax.ProgramDecl = null
 
    
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
  let rec print_list fn ls sep=
    match ls with
    | [] -> ""
    | [h] -> (fn h)
    | h::t -> sprintf "%s%s%s" (fn h) sep (print_list fn t sep)

  let rec print_type t =
    match t with
    | Null -> "null"
    | Bool -> "bool"
    | Int -> "int"
    | Machine -> "real"
    | Type.Event -> "event"
    | Any -> "any"
    | Type.Tuple(ls) -> sprintf "(%s)" (print_list print_type ls ", ")
    | Type.Seq(t) -> sprintf "seq[%s]" (print_type t)
    | Type.Map(t1, t2) -> sprintf "map[%s, %s]" (print_type t1) (print_type t2)
    | Type.NamedTuple nls -> sprintf "(%s)" (print_list (fun (f,t) -> sprintf "%s: %s" f (print_type t)) nls ", ")
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
    | Tuple(ls) -> sprintf "(%s)" (print_list print_expr ls ", ")
    | Default(t) -> sprintf "default(%s)" (print_type t)
    | New(s, arg) -> sprintf "new %s(%s)" s (print_expr arg)
    | Expr.NamedDot(e,f) -> sprintf "%s.%s" (print_expr e) f
    | Expr.NamedTuple(es) -> sprintf "(%s)" (print_list (fun (f,e) -> sprintf "%s: %s" f (print_expr e)) es ", ")
    | Expr.Call(callee, args) -> sprintf "%s(%s)" callee (print_list print_expr args ", ")
   
  let rec print_lval (l: Lval) =
    match l with
    | Lval.Var(v) -> v
    | Lval.Dot(v, i) -> sprintf "%s.%d" (print_lval v) i
    | Lval.NamedDot(v, f) -> sprintf "%s.%s" (print_lval v) f
    | Lval.Index(l, e) -> sprintf "%s[%s]" (print_lval l) (print_expr e) 

  let case_arg s1 s2 =
        let e = (Map.find s1 prog.EventMap)
        let f = (Map.find s2 prog.FunMap) 
        match e.Type with
        | None -> sprintf "{\n%s()\n}" f.Name
        | t -> sprintf "(payload: %s){\n%s(payload)\n}" (print_type t.Value) f.Name

  let print_cases (s1, s2) = 
    begin
      sprintf "case %s:%s" s1 (case_arg s1 s2) 
    end

  let rec print_stmt s =
    match s with
    | Assign(l, e) -> sprintf "%s = %s;\n" (print_lval l) (print_expr e)
    | Insert(l, e1, e2) -> sprintf "%s += (%s, %s);\n" (print_lval l) (print_expr e1) (print_expr e2)
    | Remove(l, e) -> sprintf "%s -= %s;\n" (print_lval l) (print_expr e)
    | Assert(e) -> sprintf "assert %s;\n" (print_expr e)
    | Assume(e) -> ""
    | NewStmt(s, e) -> sprintf "new %s(%s);\n" s (print_expr e)
    | Raise(e1, e2) -> sprintf "raise %s, %s;\n" (print_expr e1) (print_expr e2)
    | Send (e1, e2, e3) -> sprintf "send %s, %s, %s;\n" (print_expr e1) (print_expr e2) (print_expr e3)
    | Skip -> ";\n"
    | While(c, s) -> sprintf "while(%s)\n{\n%s\n}\n" (print_expr c) (print_stmt s)
    | Ite(c, i, e) -> sprintf "if(%s)\n{\n%s\n}\nelse\n{\n%s\n}\n" (print_expr c) (print_stmt i) (print_stmt e)
    | SeqStmt(l) -> sprintf "{\n%s\n}\n" (print_list print_stmt l ";\n")
    | Receive(l) -> sprintf "receive\n{\n%s\n}\n" (print_list print_cases l "\n")
    | Pop -> "pop;\n"
    | Return(e) -> sprintf "return (%s);\n" (print_expr e)
    | Monitor(e1, e2) -> sprintf "monitor (%s), (%s)" (print_expr e1) (print_expr e2)
    | FunStmt(s, el, None) -> sprintf "%s(%s);\n" s (print_list print_expr el ", ")
    | FunStmt(s, el, v) -> sprintf "%s = %s(%s);\n" v.Value s (print_list print_expr el ", ")

  let print_do (d: Syntax.DoDecl.T) = 
    match d with
    | Syntax.DoDecl.T.Defer(s) -> (sprintf "defer %s;" s)
    | Syntax.DoDecl.T.Ignore(s) -> (sprintf "ignore %s;" s)
    | Syntax.DoDecl.T.Call(e, f) -> (sprintf "on %s do %s" e (case_arg e f))

  let print_trans (t: Syntax.TransDecl.T) =
    match t with 
    | Syntax.TransDecl.T.Push(e, d) -> (sprintf "on %s push %s;" e d)
    | Syntax.TransDecl.T.Call(e, d, f) -> (sprintf "on %s goto %s with %s" e d (case_arg e f))

  let (|InvariantEqual|_|) (str:string) arg = 
    if String.Compare(str, arg, StringComparison.OrdinalIgnoreCase) = 0
      then Some() else None

  let print_card (c: Syntax.Card) =
    match c with
    | Card.Assert(i) -> sprintf "assert %i" i
    | Card.Assume(i) -> sprintf "assume %i" i

  let print_var (v: Syntax.VarDecl) = 
    sprintf "%s: %s" v.Name (print_type v.Type)

  let print_function (f: Syntax.FunDecl) = 
    let model = if f.IsModel then "model" else ""
    let args = (print_list print_var f.Formals ", ")
    let ret = if (f.RetType.IsSome) then (sprintf ": %s" (print_type f.RetType.Value)) else ""
    let locals = (print_list print_var f.Locals ";\n")
    sprintf "%s fun %s(%s)%s\n{%s%s}" model f.Name args ret locals (print_stmt f.Body)

  let print_event (e: Syntax.EventDecl) =
    let typ = if (e.Type.IsSome) then (sprintf ": %s" (print_type e.Type.Value)) else ""
    sprintf "event %s%s" e.Name typ

  let print_state (s: Syntax.StateDecl) = 
    let temp = 
      match s.Temperature with 
      | InvariantEqual "Hot" -> "hot"
      | InvariantEqual "Cold" -> "cold"
      | _ -> ""
    let entry = if (s.EntryAction.IsSome) then (sprintf "entry %s;\n" s.EntryAction.Value) else ""
    let exit = if (s.ExitAction.IsSome) then (sprintf "entry %s;\n" s.ExitAction.Value) else ""
    let dos = (print_list print_do s.Dos "\n")
    let trans = (print_list print_trans s.Transitions "\n")
    sprintf "%s state\n{%s%s%s%s}" temp entry exit dos trans

  let print_machine (m: Syntax.MachineDecl) =
    let main = if (m.Name = prog.MainMachine) then "main" else ""
    let machine = if (m.IsModel) then "model" else (if (m.IsMonitor) then "spec" else "machine")
    let monitors = if(m.IsMonitor) then (sprintf "monitors %s" (print_list (sprintf "%s") m.MonitorList ", ")) else ""
    let card = if (m.QC.IsSome) then (print_card m.QC.Value) else ""
    sprintf "%s %s %s %s %s\n{\n%s%s%s\n}\n" main machine m.Name card monitors 
              (print_list print_var m.Globals ";\n") 
              (print_list print_function m.Functions "\n") 
              (print_list (fun (s: Syntax.StateDecl) -> if (s.Name = m.StartState) then (sprintf "start %s" (print_state s)) else (print_state s))  m.States "\n")

  let print_prog (p: Syntax.ProgramDecl) (sw: System.IO.StreamWriter) =
    begin
      prog <- p
      sw.WriteLine (print_list print_event p.Events ";\n")
      sw.WriteLine (print_list (fun(f) -> sprintf "static %s" (print_function f)) p.StaticFuns "\n")
      sw.WriteLine (print_list print_machine p.Machines "\n")           
    end
  
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
