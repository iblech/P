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
        type_assert ((is_subtype (typecheck_expr prog G cm e1) Int) && (is_subtype (typecheck_expr prog G cm e2) Int)) (sprintf "Error: Non-integer arguments to intOp: %s" (print_expr expr))
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
    | New(m, e) -> (typecheck_new prog G cm e)
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
  ///typecheck_new <program> <Referencing Environment> <current machine> <expression>
  and typecheck_new (prog:ProgramDecl) G cm e = 
    if (not (Map.containsKey cm prog.MachineMap)) then raise Not_defined
    else begin
      let sName = (prog.MachineMap.[cm]).StartState
      let ea = (prog.MachineMap.[cm].StateMap.[sName]).EntryAction
      if (ea.IsSome) then begin
        if (typecheck_call prog G cm ea.Value (e::[])).IsSome then raise Not_defined 
        else Type.Machine
      end
      else begin
        match e with
        | Expr.Nil -> Type.Machine
        | _ -> raise Not_defined
      end
    end

  ///typecheck_expr_lval <lval> <Referencing Environment>
  let rec typecheck_expr_lval lval G  =
    match lval with
    | Lval.Var(v) -> Map.find v G
    | Lval.Dot(l, i) -> 
      begin
        match (typecheck_expr_lval l G) with
        | Type.Tuple(ls) -> List.item i ls
        | _ -> raise Not_defined
      end
    | Lval.NamedDot(l, f) -> 
      begin
        match (typecheck_expr_lval l G) with
        | Type.NamedTuple(ls) -> lookup_named_field_type f ls
        | _ -> raise Not_defined
      end
    | Lval.Index(l, e) ->
      begin
        match typecheck_expr_lval l G with
        | Type.Seq(t) -> t
        | _ -> raise Not_defined
      end

  ///Check if event e with argument arg is valid to raise.
  ///typecheck_call <program> <Referencing Environment> <current machine> <event> <arg>
  let typecheck_event_with_args (prog: Syntax.ProgramDecl) G cm e arg= 
    if (prog.EventMap.ContainsKey e) then begin
      let ev = (Map.find e prog.EventMap)
      if ev.Type.IsSome then
        (type_assert (is_subtype (typecheck_expr prog G cm arg) ev.Type.Value) 
                   (sprintf "Event requires %s type %s, but got %s" e (print_type ev.Type.Value) (print_type (typecheck_expr prog G cm arg))))
      else (type_assert (arg = Expr.Nil) (sprintf "Event %s takes no argument, but got %s" e (print_expr arg)))
   end

  ///Check if an expression returns a valid machine.
  ///typecheck_call <program> <Referencing Environment> <current machine> <Machine expression>  
  let typecheck_machine_expr prog G cm M = 
    match M with
    | Expr.Var(name) -> (type_assert ((Map.containsKey name G) && (is_subtype (Map.find name G) Type.Machine)) 
                                    (sprintf "No machine named %s!" name))
    | New(name, arg) -> (ignore true) //typecheck_new)
    | Call(fName, args) -> 
        let ret = (typecheck_call prog G cm fName args) in
          if ret.IsSome then
            (type_assert (is_subtype ret.Value Type.Machine) 
                        (sprintf "The function %s does not return a machine!" fName))
          else (raise (Type_exception (sprintf "The function %s does not return a machine!" fName)))
    | This -> (ignore true) //Fancy way of saying do nothing.
    | _ -> raise Not_defined  

  ///Check if a send statement is valid.
  ///typecheck_send <program> <Referencing Environment> <current machine> <destination machine> <event> <arg>
  let typecheck_send (prog: Syntax.ProgramDecl) G cm M ev arg = 
    (typecheck_machine_expr prog G cm M)
    (typecheck_event_with_args prog G cm ev arg)
  
  ///Check if a case is valid.
  ///typecheck_case <program> <Referencing Environment> <current machine> <event> <action>  
  let typecheck_case (prog: ProgramDecl) G cm e f= 
    let fn = prog.MachineMap.[cm].FunMap.[f]
    let ev = prog.EventMap.[e]
    (type_assert (fn.RetType = ev.Type) (sprintf "Non-matching return types in case declaration for %s" e))
    
    if (ev.Type.IsSome) then 
      begin
        let s = (sprintf "%s_payload" f)
        (ignore (typecheck_call prog G cm f [Expr.Var(s)]))
      end
    else (ignore (typecheck_call prog G cm f []))
  
  ///Type check statements.
  ///typecheck_stmt <program> <Referencing Environment> <current machine> <current function> <statement>
  let rec typecheck_stmt prog G cm cf st =
    match st with
    | Assign(l, e) -> type_assert (is_subtype (typecheck_expr_lval l G) (typecheck_expr prog G cm e)) (sprintf "Invalid assignment: %s" (print_stmt prog cm st))
    | Insert(l, e1, e2) -> 
      match typecheck_expr_lval l G with
      | Seq(t) -> type_assert ((is_subtype (typecheck_expr prog G cm e1) Int) && (is_subtype (typecheck_expr prog G cm e2) t)) (sprintf "Invalid insert: %s" (print_stmt prog cm st))
      | Map(t1,t2) -> type_assert ((is_subtype (typecheck_expr prog G cm e1) t1) && (is_subtype (typecheck_expr prog G cm e2) t2)) (sprintf "Invalid insert: %s" (print_stmt prog cm st))
      | _ -> type_assert false (sprintf "Invalid insert: %s" (print_stmt prog cm st))
    | Remove(l, e) ->
      match typecheck_expr_lval l G with
      | Seq(t) -> type_assert (is_subtype (typecheck_expr prog G cm e) Int) (sprintf "Invalid remove: %s" (print_stmt prog cm st))
      | Map(t1,t2) -> type_assert (is_subtype (typecheck_expr prog G cm e) t1) (sprintf "Invalid remove: %s" (print_stmt prog cm st))
      | _ -> type_assert false (sprintf "Invalid remove: %s" (print_stmt prog cm st))
    | Assume e ->  type_assert (is_subtype (typecheck_expr prog G cm e) Bool) (sprintf "Invalid assume: %s" (print_stmt prog cm st))
    | Assert e -> type_assert (is_subtype (typecheck_expr prog G cm e) Bool) (sprintf "Invalid assert: %s" (print_stmt prog cm st))
    | NewStmt(m, e) -> 
      match (typecheck_new prog G cm e) with
      | Type.Machine -> (type_assert true (sprintf "Invalid New Statement: %s" (print_stmt prog cm st)))
      | _ -> (type_assert false (sprintf "Invalid New Statement: %s" (print_stmt prog cm st)))
    | FunStmt(f, el, None) -> ignore (typecheck_call prog G cm f el)
    | FunStmt(f, el, v) -> 
      match (typecheck_call prog G cm f el) with
      | Some(t) -> (type_assert (is_subtype t (Map.find v.Value G)) (sprintf "Invalid types in Statement: %s, expected type %s, but got %s" (print_stmt prog cm st) (print_type t) (print_type (Map.find v.Value G))))
      | None -> raise Not_defined
    | Raise(Event(e), arg) -> (typecheck_event_with_args prog G cm e arg)
    | Send(M, Event(e), arg) -> (typecheck_send prog G cm M e arg)
   
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
    | Receive(lst) -> (List.iter(fun(e, a) -> (typecheck_case prog G cm e a)) lst)
    | Monitor(Event(ev), arg) -> (typecheck_event_with_args prog G cm ev arg)
    //ToDo add dynamic check that the event will accept the arg given.
    | Monitor(Expr.Var(e), _) -> (type_assert (is_subtype (Map.find e G) Type.Event) (sprintf "%s is not an event!" e)) 
    | Return(Some(e)) -> 
      begin
        let rettype = prog.MachineMap.[cm].FunMap.[cf].RetType
        if (rettype.IsSome) then   
          (type_assert (is_subtype (typecheck_expr prog G cm e) rettype.Value) 
                       (sprintf "Invalid value for return expression: expected %s, got %s" 
                       (print_type rettype.Value)
                       (print_type (typecheck_expr prog G cm e))))
        else (type_assert (e = Expr.Nil) (sprintf "Function does not return a value, but got %s" (print_expr e)))
      end
    | Return(None) -> ignore true
    | Pop -> ignore true
    | Skip -> ignore true //A fancy way of generating unit.
    | _ -> 
      begin
        printfn "%s" (print_stmt prog cm st)
        raise Not_defined
      end
  let typecheck_fun (prog: ProgramDecl) G cm (f: FunDecl) =
    let G' = (merge_maps G f.VarMap)
    (typecheck_stmt prog G' cm f.Name f.Body)
    
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
   