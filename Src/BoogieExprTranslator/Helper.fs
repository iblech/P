namespace Microsoft.P2Boogie

module Helper=
        
  open System
  open Syntax
  open Common
   
  let merge_maps map1 map2 = 
    (Map.fold (fun acc key value -> Map.add key value acc) map1 map2)

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
  ///print_list <printing function> <list> <seperator between elements>
  let rec print_list fn ls sep=
    match ls with
    | [] -> ""
    | [h] -> (fn h)
    | h::t -> sprintf "%s%s%s" (fn h) sep (print_list fn t sep)

  ///print_type <type>
  let rec print_type t =
    match t with
    | Null -> "null"
    | Bool -> "bool"
    | Int -> "int"
    | Machine -> "machine"
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
    | Or -> "||"
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
    | Neg -> "-"
    | Keys -> "keys"
    | Values -> "values"
    | Sizeof -> "sizeof"

  let rec print_expr (e: Expr) =
    match e with
    | Nil -> "null"
    | ConstBool(true) -> "true"
    | ConstBool(false) -> "false"
    | ConstInt(i) -> i.ToString()
    | This -> "this"
    | Nondet -> "$"
    | Event(s) -> s
    | Expr.Var(s) -> s
    | Expr.Bin(Idx, e1, e2) -> sprintf "%s[%s]" (print_expr e1) (print_expr e2) 
    | Expr.Bin(op, e1, e2) -> sprintf "(%s %s %s)" (print_expr e1) (print_binop op) (print_expr e2)
    | Expr.Un(op, e1) -> sprintf "%s(%s)" (print_uop op) (print_expr e1)
    | Expr.Dot(e, i) -> (print_expr e) + "." + i.ToString()
    | Cast(e, t) -> sprintf "(%s as %s)" (print_expr e) (print_type t)
    | Tuple([h]) -> sprintf "(%s,)" (print_expr h)
    | Tuple(ls) -> sprintf "(%s)" (print_list print_expr ls ", ")
    | Default(t) -> sprintf "default(%s)" (print_type t)
    | New(s, arg) -> sprintf "new %s(%s)" s (print_expr arg)
    | Expr.NamedDot(e,f) -> sprintf "%s.%s" (print_expr e) f
    | Expr.NamedTuple([(f, e)]) -> sprintf "(%s=%s,)"  f (print_expr e)
    | Expr.NamedTuple(es) -> sprintf "(%s)" (print_list (fun (f,e) -> sprintf "%s= %s" f (print_expr e)) es ", ")
    | Expr.Call(callee, args) -> sprintf "%s(%s)" callee (print_list print_expr args ", ")
   
  let rec print_lval (l: Lval) =
    match l with
    | Lval.Var(v) -> v
    | Lval.Dot(v, i) -> sprintf "%s.%d" (print_lval v) i
    | Lval.NamedDot(v, f) -> sprintf "%s.%s" (print_lval v) f
    | Lval.Index(l, e) -> sprintf "%s[%s]" (print_lval l) (print_expr e) 
  
  let print_env_tup (envType: VarDecl list) = 
    let tup = Expr.Tuple([for v in envType do yield Expr.Var(v.Name)])
    print_expr tup  

  let print_restore_env (envType: VarDecl list) =
    match envType with
    | [] -> ""
    | ls -> 
      begin
        let names = [for v in ls do yield v.Name] |>
                    Seq.mapi (fun i x -> i,x) |> List.ofSeq
        sprintf "%s;\n" (print_list (fun(i, s)-> sprintf "%s=env.%d" s i) names ";\n")
      end

  let print_env_type (env: VarDecl list) = 
    let tup = Type.Tuple([for v in env do yield v.Type])
    print_type tup

  let print_anon_fun f argType envType action ev_has_params fn_has_params env_non_empty=      
    let pl_decl = if ev_has_params then sprintf "(payload: %s)" (print_type argType) else ""
    let env_decl = if env_non_empty then sprintf "var env: %s;\nenv = " (print_env_type envType) else ""
    let param1 = if env_non_empty then (print_env_tup envType) else ""
    let comma = if fn_has_params && env_non_empty then ", " else ""
    let param2 = if fn_has_params then "payload" else ""
    let restore = if env_non_empty then (print_restore_env envType) else ""
    sprintf "%s %s {\n%s%s(%s%s%s);\n%s}\n" action pl_decl env_decl f param1 comma param2 restore

  let print_action (prog: ProgramDecl) cm fn action = 
    let fd = if (prog.FunMap.ContainsKey fn) then prog.FunMap.[fn]
             else  (prog.MachineMap.[cm].FunMap.[fn]) 
    let envType = if fd.EnvEmpty then List.Empty else fd.EnvVars.Value
    let arg = 
      match fd.EnvEmpty, fd.Formals.IsEmpty with
      | true, true -> List.Empty
      | true, false -> fd.Formals
      | false, _ ->  List.tail fd.Formals
    let argType = if (arg.IsEmpty) then Type.Null else (List.head arg).Type
    let has_params = 
      match action with
      | "exit" -> false
      | _ -> not arg.IsEmpty 
    print_anon_fun fn argType envType action has_params has_params (not fd.EnvEmpty)

  ///print_event_action <program> <event name> <machine name> <function name>
  let print_event_action (prog: ProgramDecl) cm action ev fn =
    let e = (Map.find ev prog.EventMap)
    let fd = if (prog.FunMap.ContainsKey fn) then prog.FunMap.[fn]
             else  (prog.MachineMap.[cm].FunMap.[fn]) 
    let envType = if fd.EnvEmpty then List.Empty else fd.EnvVars.Value
    let fn_has_params = if fd.EnvEmpty then (fd.Formals.Length = 1) else fd.Formals.Length = 2
    match e.Type with
      | Some(t) -> print_anon_fun fd.Name t envType action true fn_has_params (not fd.EnvEmpty)
      | None -> print_anon_fun fd.Name Type.Null envType action false fn_has_params (not fd.EnvEmpty)

  ///print_cases <program> <event name> <machine name> <function name>
  let print_cases prog cm (ev, fn) =     
    let action = sprintf "case %s: " ev 
    print_event_action prog cm action ev fn
    
  let rec print_stmt prog cm s =
    match s with
    | Assign(l, e) -> sprintf "%s = %s;" (print_lval l) (print_expr e)
    | Insert(l, e1, e2) -> sprintf "%s += (%s, %s);" (print_lval l) (print_expr e1) (print_expr e2)
    | Remove(l, e) -> sprintf "%s -= %s;" (print_lval l) (print_expr e)
    | Assert(e) -> sprintf "assert %s;" (print_expr e)
    | Assume(e) -> sprintf "assume %s;" (print_expr e)
    | NewStmt(s, Nil) -> sprintf "new %s();" s
    | NewStmt(s, e) -> sprintf "new %s(%s);" s (print_expr e)
    | Raise(e1, Nil) -> sprintf "raise %s;" (print_expr e1)
    | Raise(e1, e2) -> sprintf "raise %s, %s;" (print_expr e1) (print_expr e2)
    | Send (e1, e2, Nil) -> sprintf "send %s, %s;" (print_expr e1) (print_expr e2) 
    | Send (e1, e2, e3) -> sprintf "send %s, %s, %s;" (print_expr e1) (print_expr e2) (print_expr e3)
    | Skip -> ";\n"
    | While(c, s) -> sprintf "while(%s)\n{\n%s\n}\n" (print_expr c) (print_stmt prog cm s)
    | Ite(c, i, e) -> sprintf "if(%s)\n{\n%s\n}\nelse\n{\n%s\n}\n" (print_expr c) (print_stmt prog cm i) (print_stmt prog cm e)
    | SeqStmt(l) -> sprintf "\n%s\n" (print_list (print_stmt prog cm) l "\n")
    | Receive(l) -> sprintf "receive\n{\n%s\n}\n" (print_list (print_cases prog cm) l "\n")
    | Pop -> "pop;"
    | Return(None) -> "return;"
    | Return(Some(e)) -> sprintf "return (%s);" (print_expr e)
    | Monitor(e1, e2) -> sprintf "monitor (%s), (%s);" (print_expr e1) (print_expr e2)
    | FunStmt(s, el, None) -> sprintf "%s(%s);" s (print_list print_expr el ", ")
    | FunStmt(s, el, v) -> sprintf "%s = %s(%s);" v.Value s (print_list print_expr el ", ")

  let print_do prog cm (d: Syntax.DoDecl.T) = 
    match d with
    | Syntax.DoDecl.T.Defer(s) -> (sprintf "defer %s;" s)
    | Syntax.DoDecl.T.Ignore(s) -> (sprintf "ignore %s;" s)
    | Syntax.DoDecl.T.Call(e, f) -> 
      begin
        let action = sprintf "on %s do " e
        print_event_action prog cm action e f
      end

  let print_trans prog cm (t: Syntax.TransDecl.T) =
    match t with 
    | Syntax.TransDecl.T.Push(e, d) -> (sprintf "on %s push %s;" e d)
    | Syntax.TransDecl.T.Call(e, d, f) -> 
      begin
        let action = sprintf "on %s goto %s with " e d 
        print_event_action prog cm action e f
      end

  let (|InvariantEqual|_|) (str:string) arg = 
    if String.Compare(str, arg, StringComparison.OrdinalIgnoreCase) = 0
      then Some() else None

  let print_card (c: Syntax.Card) =
    match c with
    | Card.Assert(i) -> sprintf " assert %i" i
    | Card.Assume(i) -> sprintf " assume %i" i

  let print_var (v: Syntax.VarDecl) = 
    sprintf "var %s: %s" v.Name (print_type v.Type)
  
  let print_var_list (ls: VarDecl list) = 
    match ls with
    | [] -> ""
    | [h] -> (sprintf "%s;\n" (print_var h))
    | _ -> (sprintf "%s;\n" (print_list print_var ls ";\n"))

  let print_function prog cm (f: Syntax.FunDecl) = 
    let print_formal (v: VarDecl) = 
      sprintf "%s: %s" v.Name (print_type v.Type)
    let model = if f.IsModel then "model " else ""
    let args = (print_list print_formal f.Formals ", ")
    let ret = if (f.RetType.IsSome) then (sprintf ": %s" (print_type f.RetType.Value)) else ""
    let locals = (print_var_list f.Locals)
    let body = SeqStmt(f.Body)
    sprintf "%sfun %s(%s)%s\n{\n%s\n%s}" model f.Name args ret locals (print_stmt prog cm body)

  let print_event (e: Syntax.EventDecl) =
    let typ = if (e.Type.IsSome) then (sprintf ": %s" (print_type e.Type.Value)) else ""
    let qc = if (e.QC.IsSome) then (sprintf " %s" (print_card e.QC.Value)) else ""
    sprintf "event %s%s%s" e.Name qc typ

  let print_state (prog: ProgramDecl) cm (s: Syntax.StateDecl) = 
    let temp = 
      match s.Temperature with 
      | InvariantEqual "Hot" -> "hot"
      | InvariantEqual "Cold" -> "cold"
      | _ -> ""
    
    let print_entry_exit (ea: string option) action= 
      if ea.IsSome then begin
        let fn = ea.Value
        print_action prog cm fn action
      end
      else ""
    
    let entry = (print_entry_exit s.EntryAction "entry")
    let exit = (print_entry_exit s.ExitAction "exit")
    let dos = (print_list (print_do prog cm) s.Dos "\n")
    let trans = (print_list (print_trans prog cm) s.Transitions "\n")
    sprintf "\n%s state %s\n{\n%s%s%s%s}" temp s.Name entry exit dos trans

  let print_machine (prog: ProgramDecl) (m: Syntax.MachineDecl) =
    let main = if (m.Name = prog.MainMachine) then "main " else ""
    let machine = if (m.IsModel) then "model" else (if (m.IsMonitor) then "spec" else "machine")
    let monitors = if(m.IsMonitor) then (sprintf " monitors %s " (print_list (sprintf "%s") m.MonitorList ", ")) else ""
    let card = if (m.QC.IsSome) then (print_card m.QC.Value) else ""
    sprintf "%s%s %s%s%s\n{\n%s\n%s%s\n}\n" main machine m.Name card monitors 
              (print_var_list m.Globals) 
              (print_list (print_function prog m.Name) m.Functions "\n") 
              (print_list (fun (s: Syntax.StateDecl) -> 
                            if (s.Name = m.StartState) then (sprintf "start %s" (print_state prog m.Name s)) 
                            else (print_state prog m.Name s))  m.States "\n")

  let print_prog (prog: Syntax.ProgramDecl) (sw: System.IO.TextWriter) =
    begin
      let events = List.filter (fun(x:EventDecl) -> x.Name <> "null" && x.Name <>"halt") prog.Events
      match (print_list print_event events ";\n") with
      | "" -> sw.Write("")
      | s -> sw.WriteLine(sprintf "%s;" s)
      sw.WriteLine (print_list (print_function prog "") prog.StaticFuns "\n")
      sw.WriteLine (print_list (print_machine prog) prog.Machines "\n")           
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
