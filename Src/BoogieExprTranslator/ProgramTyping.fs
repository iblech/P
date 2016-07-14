namespace Microsoft.P2Boogie
module ProgramTyping = 
  open Syntax
  open Common
  open Helper

    (* Typing *)
  ///If not b, raise Type exception with message s.
  let type_assert b s =
    if (not b) then 
      begin
        printfn "%s" s
        raise (Type_exception s)
      end

  ///Is t1 a subtype of t2?
  let rec is_subtype t1 t2 =
    match (t1, t2) with
    | (_, Any) -> true
    | (Null, Type.Machine) -> true
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
    | (Type.NamedTuple(ls1), Type.NamedTuple(ls2)) ->
      begin
        if List.length ls1 <> List.length ls2 then false
        else begin
          let z = List.zip ls1 ls2 in
              let z = List.map (fun ((f1,a),(f2,b)) -> (f1 = f2) && (is_subtype a b)) z in
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
    | Expr.Var(v) -> Map.find v G
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
        | Type.Tuple(ls) -> List.item i ls
        | _ -> raise Not_defined
      end
    | Expr.NamedDot(e, f) -> 
      begin
        let ts = typeof e G in
        match ts with
        | Type.NamedTuple(ls) -> lookup_named_field_type f ls
        | _ -> raise Not_defined
      end
    | Cast(e, t) -> t
    | Expr.Tuple(es) -> Type.Tuple(List.map (fun e -> typeof e G) es)
    | Expr.NamedTuple(es) -> Type.NamedTuple(List.map (fun (f, e) -> (f, typeof e G)) es)
    | Default(t) -> t
    | New(_, _) -> Machine
    | Call(callee, args) -> Map.find callee G
    | _ -> raise Not_defined

  ///typeof_lval <lval> <Referencing Environment>
  let rec typeof_lval lval G  =
    match lval with
    | Lval.Var(v) -> Map.find v G
    | Lval.Dot(l, i) -> 
      begin
        match (typeof_lval l G) with
        | Type.Tuple(ls) -> List.item i ls
        | _ -> raise Not_defined
      end
    | Lval.NamedDot(l, f) -> 
      begin
        match (typeof_lval l G) with
        | Type.NamedTuple(ls) -> lookup_named_field_type f ls
        | _ -> raise Not_defined
      end
    | Lval.Index(l, e) ->
      begin
        match typeof_lval l G with
        | Type.Seq(t) -> t
        | Type.Map(t1, t2) -> t2
        | _ -> raise Not_defined
      end


  ///typecheck_expr <program> <Referencing Environment> <current machine> <expression>
  let rec typecheck_expr (prog:ProgramDecl) G cm expr =
    match expr with
    | Nil -> Null
    | ConstBool _ -> Bool
    | ConstInt _ -> Int
    | This -> Type.Machine
    | Nondet -> Bool
    | Event _ -> Type.Event
    | Expr.Var(v) -> Map.find v G
    | Expr.Bin(Idx, e1, e2) ->
      begin
        match typecheck_expr prog G cm e1 with
        | Seq(t1) -> 
          begin
            type_assert (is_subtype (typecheck_expr prog G cm e2) Int) (sprintf "Type error in indexing sequence: %s" (print_expr expr))
            t1
          end
        | Map(t1, t2) ->
          begin
            type_assert (is_subtype (typecheck_expr prog G cm e2) t1) "Type error in indexing map"
            t2
          end
        | _ -> raise Not_defined
      end
    | Expr.Bin(In, e1, e2) ->
      begin
        match typecheck_expr prog G cm e2 with
        | Map(t1, _) ->
          begin
            type_assert (is_subtype (typecheck_expr prog G cm e1) t1) "Type error in key lookup"
            Bool
          end
        | _ -> raise Not_defined
      end
    | Expr.Bin(op, e1, e2) when is_intop op -> 
      begin
        type_assert ((is_subtype (typecheck_expr prog G cm e1) Int) && (is_subtype (typecheck_expr prog G cm e2) Int)) (sprintf "Error: Non-integer arguments to intOp: %s" (print_expr expr))
        Int
      end
    | Expr.Bin(op, e1, e2) when is_boolop op -> 
      begin
        type_assert ((is_subtype (typecheck_expr prog G cm e1) Bool) && (is_subtype (typecheck_expr prog G cm e2) Bool)) (sprintf "Error: Non-boolean arguments to boolOp: %s" (print_expr expr))
        Bool
      end
    | Expr.Bin(op, e1, e2) when is_relop op -> 
      begin
        type_assert ((is_subtype (typecheck_expr prog G cm e1) Int) && (is_subtype (typecheck_expr prog G cm e2) Int)) (sprintf "Error: Non-integer arguments to intOp: %s" (print_expr expr))
        Bool
      end
    | Expr.Bin(op, e1, e2) when is_comparison op ->
      begin
        let t1 = (typecheck_expr prog G cm e1)
        let t2 = (typecheck_expr prog G cm e2)
        type_assert ((is_subtype t1 t2) || (is_subtype t2 t1))(sprintf "Error: Arguments to ComparisonOp not of same type: %s" (print_expr expr))
        Bool
      end
    | Expr.Un(Not, e1) -> 
      begin
        type_assert (is_subtype (typecheck_expr prog G cm e1) Bool) 
          (sprintf "Error: Non-boolean argument to boolOp: %s" (print_expr expr))
        Bool
      end
    | Expr.Un(Neg, e1) -> 
      begin
        type_assert (is_subtype (typecheck_expr prog G cm e1) Int) 
          (sprintf "Error: Non-integer argument to intOp: %s" (print_expr expr))
        Int
      end
    | Expr.Un(Keys, e1) -> 
      begin
        match typecheck_expr prog G cm e1 with
        | Map(t1, t2) -> Seq(t1)
        | _ -> raise Not_defined
      end
    | Expr.Un(Values, e1) ->
      begin
        match typecheck_expr prog G cm e1 with
        | Map(t1, t2) -> Seq(t2)
        | _ -> raise Not_defined
      end
    | Expr.Un(Sizeof, e1) -> Int
    | Expr.Dot(e, i) -> 
      begin
        let ts = typecheck_expr prog G cm e in
        match ts with
        | Type.Tuple(ls) -> List.item i ls
        | _ -> raise Not_defined
      end
    | Expr.NamedDot(e, f) -> 
      begin
        let ts = typecheck_expr prog G cm e in
        match ts with
        | Type.NamedTuple(ls) -> lookup_named_field_type f ls
        | _ -> raise Not_defined
      end
(* More checks here. Also, need to add dynamic check for down-casting. *) 
    | Cast(e, t) -> 
      let et = (typecheck_expr prog G cm e) in 
        if ((is_subtype t et) || (is_subtype et t)) then t 
        else raise (Type_exception (sprintf "Cannot upcast/downcast %s to %s!" (print_type et) (print_type t)))
    | Expr.Tuple(es) -> Type.Tuple(List.map (fun e -> (typecheck_expr prog G cm e)) es)
    | Expr.NamedTuple(es) -> Type.NamedTuple(List.map (fun (f, e) -> (f, typecheck_expr prog G cm e)) es)
    | Default(t) -> t
    | New(m, e) -> typecheck_new prog G m e
    | Call(callee, args) -> 
      match (typecheck_call prog G cm callee args) with (* More checks here. *)
      | None -> (raise (Type_exception (sprintf "A void function %s is present in expression %s" callee (print_expr expr))))
      | Some(t) -> t
    | _ -> raise Not_defined
    
  ///Checks if function call is valid; returns return type if yes.
  ///typecheck_call <program> <Referencing Environment> <current machine> <function> <args>
  and typecheck_call (prog:ProgramDecl) G cm f args = 
    let fn = 
      if (prog.FunMap.ContainsKey f) then prog.FunMap.[f]
      else (prog.MachineMap.[cm]).FunMap.[f]
    let arg_types = (List.map (fun x -> (typecheck_expr prog G cm x)) args)
    let formal_types = (List.map (fun (x: Syntax.VarDecl) -> x.Type) fn.Formals)
    if (List.length args) <> (List.length fn.Formals) then raise Not_defined
    else
        if (not (List.fold (fun p b -> p && b) true 
                    (List.map (fun (a, b) -> (is_subtype a b)) 
                    (List.zip arg_types formal_types)))) then
          raise (Type_exception (sprintf "Non-matching types to %s: expected (%s), got (%s)" f 
                  (print_list print_type formal_types ", ") 
                  (print_list print_type arg_types  ", ")))
        else fn.RetType
  ///Returns Type.Machine if the new is okay.
  ///typecheck_new <program> <Referencing Environment> <Machine> <expression>
  and typecheck_new (prog:ProgramDecl) G M e = 
    if (not (Map.containsKey M prog.MachineMap)) then raise Not_defined
    else begin
      let sName = (prog.MachineMap.[M]).StartState
      let ea = (prog.MachineMap.[M].StateMap.[sName]).EntryAction
      if (ea.IsSome) then begin
        let e' = 
          match e with
          | Expr.Nil -> []
          | _ -> [e]
        if (typecheck_call prog G M ea.Value e').IsSome then raise Not_defined 
        else Type.Machine
      end
      else begin
        match e with
        | Expr.Nil -> Type.Machine
        | _ -> raise Not_defined
      end
    end

  ///typecheck_lval <prog> <Referencing Environment> <Current Machine> <lval>
  let rec typecheck_lval prog G cm lval = 
    match lval with
    | Lval.Var(v) -> Map.find v G
    | Lval.Dot(l, i) -> 
      begin
        match (typecheck_lval prog G cm l) with
        | Type.Tuple(ls) -> List.item i ls
        | _ -> raise Not_defined
      end
    | Lval.NamedDot(l, f) -> 
      begin
        match (typecheck_lval prog G cm l) with
        | Type.NamedTuple(ls) -> lookup_named_field_type f ls
        | _ -> raise Not_defined
      end
    | Lval.Index(l, e) ->
      begin
        let eType = typecheck_expr prog G cm e
        match typecheck_lval prog G cm l with
        | Type.Seq(t) -> 
          begin
            type_assert (is_subtype eType Int) (sprintf "Error in indexing: %s is not an integer" (print_expr e))
            t
          end
        | Type.Map(t1, t2) ->
          begin
            type_assert (is_subtype eType t1) (sprintf "Error in indexing: %s is not of type %s" (print_expr e) (print_type t1))
            t2
          end
        | _ -> raise Not_defined
      end

  ///Check if event e with argument arg is valid to raise.
  ///typecheck_call <program> <Referencing Environment> <current machine> <event> <arg>
  let typecheck_event_with_args (prog: Syntax.ProgramDecl) G cm event arg =
    match event with
    | Event(e) ->
      begin
        let ev = (Map.tryFind e prog.EventMap)
        type_assert ev.IsSome (sprintf "No such event as %s!" e)
        if ev.Value.Type.IsSome then
          (type_assert (is_subtype (typecheck_expr prog G cm arg) ev.Value.Type.Value) 
                       (sprintf "Event requires %s type %s, but got %s" e (print_type ev.Value.Type.Value)
                       (print_type (typecheck_expr prog G cm arg))))
        else (type_assert (arg = Expr.Nil) (sprintf "Event %s takes no argument, but got %s" e (print_expr arg)))
      end
    | Expr.Dot(_)| Expr.NamedDot(_) | Expr.Nil | Expr.Call(_) | Expr.Default(_) |     Expr.Cast(_) | Expr.Var(_) ->
      begin
        let t = typecheck_expr prog G cm event
        type_assert (is_subtype t Type.Event) (sprintf "%s is not an event!" (print_expr event))
      end
      //ToDo add dynamic check for arg type.
    | _ -> raise Not_defined

  ///Check if a send statement is valid.
  ///typecheck_send <program> <Referencing Environment> <current machine> <destination machine> <event> <arg>
  let typecheck_send (prog: Syntax.ProgramDecl) G cm M ev arg = 
    type_assert (is_subtype (typecheck_expr prog G cm M) Type.Machine) (sprintf "%s is not a machine!" (print_expr M))
    typecheck_event_with_args prog G cm ev arg
  
  ///Check if a case is valid.
  ///typecheck_case <program> <Referencing Environment> <current machine> <event> <action>  
  //This is a special case. We have to exclude the environment arg of the anon function.
  let typecheck_case (prog: ProgramDecl) cm e f= 
    let ev = prog.EventMap.[e]
    let fd = if (prog.FunMap.ContainsKey f) then prog.FunMap.[f]
             else  (prog.MachineMap.[cm].FunMap.[f]) 
    let len = fd.Formals.Length
    match ev.Type, fd.EnvEmpty with
    | None, true -> 
      begin
        if len <> 0 then raise (Type_exception (sprintf "Error in case statement: The event %s must take provide an argument"  e))
      end
    | None, false -> 
      begin
        if len <> 1 then raise (Type_exception (sprintf "Error in case statement: The event %s must take provide an argument"  e))
      end

    | Some(t), false -> 
      begin
        if len <> 2 then raise (Type_exception (sprintf "Error in case statement: The event %s must provide an argument"  e))
        let arg = List.item 1 fd.Formals
        type_assert (is_subtype t arg.Type) (sprintf "Invalid argument to %s: expects %s, not %s" f (print_type arg.Type) (print_type t))
      end
    | Some(t), true -> 
      begin
        if len <> 1 then raise (Type_exception (sprintf "Error in case statement: The event %s must not provide an argument"  e))
        let arg = List.item 0 fd.Formals
        type_assert (is_subtype t arg.Type) (sprintf "Invalid argument to %s: expects %s, not %s" f (print_type arg.Type) (print_type t))
      end
  
  ///Type check statements.
  ///typecheck_stmt <program> <Referencing Environment> <current machine> <current function> <statement>
  let rec typecheck_stmt prog G cm cf st =
    match st with
    | Assign(l, e) -> 
      begin
        let ltype = (typecheck_lval prog G cm l)
        let rtype = (typecheck_expr prog G cm e)
        type_assert (is_subtype rtype ltype) (sprintf "Invalid assignment: %s; lhs has type %s, but rhs has type %s " (print_stmt prog cm st) (print_type ltype) (print_type rtype))
      end
    | Insert(l, e1, e2) -> 
      match typecheck_lval prog G cm l with
      | Seq(t) -> type_assert ((is_subtype (typecheck_expr prog G cm e1) Int) && (is_subtype (typecheck_expr prog G cm e2) t)) (sprintf "Invalid insert: %s" (print_stmt prog cm st))
      | Map(t1,t2) -> type_assert ((is_subtype (typecheck_expr prog G cm e1) t1) && (is_subtype (typecheck_expr prog G cm e2) t2)) (sprintf "Invalid insert: %s" (print_stmt prog cm st))
      | _ -> type_assert false (sprintf "Invalid insert: %s" (print_stmt prog cm st))
    | Remove(l, e) ->
      match typecheck_lval prog G cm l with
      | Seq(t) -> type_assert (is_subtype (typecheck_expr prog G cm e) Int) (sprintf "Invalid remove: %s" (print_stmt prog cm st))
      | Map(t1,t2) -> type_assert (is_subtype (typecheck_expr prog G cm e) t1) (sprintf "Invalid remove: %s" (print_stmt prog cm st))
      | _ -> type_assert false (sprintf "Invalid remove: %s" (print_stmt prog cm st))
    | Assume e ->  type_assert (is_subtype (typecheck_expr prog G cm e) Bool) (sprintf "Invalid assume: %s" (print_stmt prog cm st))
    | Assert e -> type_assert (is_subtype (typecheck_expr prog G cm e) Bool) (sprintf "Invalid assert: %s" (print_stmt prog cm st))
    | NewStmt(m, e) -> 
      match (typecheck_new prog G m e) with
      | Type.Machine -> (type_assert true (sprintf "Invalid New Statement: %s" (print_stmt prog cm st)))
      | _ -> (type_assert false (sprintf "Invalid New Statement: %s" (print_stmt prog cm st)))
    | FunStmt(f, el, None) -> ignore (typecheck_call prog G cm f el)
    | FunStmt(f, el, v) -> 
      match (typecheck_call prog G cm f el) with
      | Some(t) -> (type_assert (is_subtype t (Map.find v.Value G)) (sprintf "Invalid types in Statement: %s, expected type %s, but got %s" (print_stmt prog cm st) (print_type t) (print_type (Map.find v.Value G))))
      | None -> raise Not_defined
    | Raise(e, arg) -> typecheck_event_with_args prog G cm e arg
    | Send(M, e, arg) -> typecheck_send prog G cm M e arg
    | While(c, s) -> 
      begin 
        (type_assert (is_subtype (typecheck_expr prog G cm c) Bool) (sprintf "%s does not have type bool!" (print_expr c)))
        (typecheck_stmt prog G cm cf s)
      end
    | Ite(c, i, e) ->
      begin 
        (type_assert (is_subtype (typecheck_expr prog G cm c) Bool) (sprintf "%s does not have type bool!" (print_expr c)))
        (typecheck_stmt prog G cm cf i)
        (typecheck_stmt prog G cm cf e)
      end
    | SeqStmt(lst) -> (List.iter (fun s -> (typecheck_stmt prog G cm cf s)) lst)
    | Receive(lst) -> (List.iter(fun(e, a) -> (typecheck_case prog cm e a)) lst)
    //ToDo add dynamic check that the event will accept the arg given.
    | Monitor(e, arg) -> (typecheck_event_with_args prog G cm e arg)
    | Return(Some(e)) -> 
      begin
        let fn = (if (prog.FunMap.ContainsKey cf) then prog.FunMap.[cf]
                  else  (prog.MachineMap.[cm].FunMap.[cf]))
        let rettype = fn.RetType
        if (rettype.IsSome) then   
          (type_assert (is_subtype (typecheck_expr prog G cm e) rettype.Value) 
                       (sprintf "%s: Invalid value for return expression: expected %s, got %s" cf 
                       (print_type rettype.Value)
                       (print_type (typecheck_expr prog G cm e))))
        else type_assert false (sprintf "%s: Function cannot return a value, got %s" cf (print_expr e))
      end
    | Return(None) ->
      begin
        let fn = (if (prog.FunMap.ContainsKey cf) then prog.FunMap.[cf]
                  else  (prog.MachineMap.[cm].FunMap.[cf]))
        let rettype = fn.RetType
        type_assert rettype.IsNone 
          (if rettype.IsSome then 
            (sprintf "%s: Function returns a %s, but got no return value" cf (print_type rettype.Value))
          else "")
      end
    | Pop -> ignore true
    | Skip -> ignore true //A fancy way of generating unit.

  let typecheck_fun (prog: ProgramDecl) G cm (f: FunDecl) =
    let G' = (merge_maps G f.VarMap)
    let body = SeqStmt(f.Body)
    (typecheck_stmt prog G' cm f.Name body)
    
  let typecheck_machine (prog: ProgramDecl) G (md: MachineDecl) = 
    let funs = 
      let map = ref Map.empty in
        List.iter (fun(f: FunDecl) -> map := Map.add f.Name (if f.RetType.IsSome then f.RetType.Value else Type.Null) !map) md.Functions
      !map 
    let G' = merge_maps (merge_maps G md.VarMap) funs
    (List.iter (typecheck_fun prog G' md.Name) md.Functions)
    //There's no typecheck_state because entry actions, exit actions,  
    //actions on transitions/dos are all functions.

  let typecheck_program (prog: ProgramDecl) = 
    let G =           
      let map = ref Map.empty in
        List.iter (fun(f: FunDecl) -> map := Map.add f.Name (if f.RetType.IsSome then f.RetType.Value else Type.Null) !map) prog.StaticFuns
      !map 
    (List.iter (typecheck_machine prog G) prog.Machines) 
    (List.iter (typecheck_fun prog G "") prog.StaticFuns) 
   