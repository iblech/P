namespace Microsoft.P2Boogie
module ProgramTyping = 
  open Syntax
  open Common
  open Helper

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
        | Type.Tuple(ls) -> List.nth ls i
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

  let rec typeof_lval lval G =
    match lval with
    | Lval.Var(v) -> Map.find v G
    | Lval.Dot(l, i) -> 
      begin
        match (typeof_lval l G) with
        | Type.Tuple(ls) -> List.nth ls i
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
        | Default _ 
        | Expr.Var _ -> Set.empty
        | Bin(_, e1, e2) -> Set.union (all_exprs e1) (all_exprs e2)
        | Un(_, e') -> all_exprs e'
        | Expr.Dot(e', _) -> all_exprs e'
        | Expr.NamedDot(_, _) -> raise Not_defined
        | Expr.NamedTuple(_) -> raise Not_defined
        | Cast(e, t) -> all_exprs e
        | Expr.Tuple(es) -> List.fold (fun s e -> Set.union s (all_exprs e)) Set.empty es
        | New(_, e') -> all_exprs e' 
        | Call(_, es) -> List.fold (fun s e -> Set.union s (all_exprs e)) Set.empty es
      in
      ret.Add(e)
    in
    let all_types_expr e G = Set.map (fun e -> typeof e G) (all_exprs e) in
    let rec all_types_lval lval G =
      let ret =
        match lval with
        | Lval.Var(v) -> Set.empty
        | Lval.Dot(l, _) -> all_types_lval l G
        | Lval.NamedDot(_, _) -> raise Not_defined
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

