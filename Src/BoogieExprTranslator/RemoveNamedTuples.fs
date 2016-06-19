module RemoveNamedTuples
open Program
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

let rec process_expr expr G =
    match expr with
    | Nil
    | ConstInt _
    | ConstBool _
    | Event _
    | This
    | Nondet
    | Expr.Var _ -> expr
    | Default t -> Default (process_type t)
    | Bin(op, e1, e2) -> Bin(op, process_expr e1 G, process_expr e2 G)
    | Un(op, e) -> Un(op, process_expr e G)
    | Expr.Dot(e,i) -> Expr.Dot(process_expr e G, i)
    | Expr.NamedDot(e, f) ->
    begin
        let (Type.NamedTuple(ts)) = typeof e G in
        let index = lookup_named_field_index f ts in
        Expr.Dot(process_expr e G, index)
    end
    | Cast(e, t) -> Cast(process_expr e G, process_type t)
    | Tuple(es) -> Tuple(List.map (fun e -> process_expr e G) es)
    | NamedTuple(es) -> Tuple(List.map (fun (f,e) -> process_expr e G) es)
    | New(s, e) -> New(s, process_expr e G)
    | Call(callee, args) -> Call(callee, List.map (fun e -> process_expr e G) args)

let rec process_lval lval G =
    match lval with
    | Var _ -> lval
    | Dot(l, i) -> Dot(process_lval l G, i)
    | NamedDot(l, f) -> 
    begin
        let (Type.NamedTuple(ts)) = typeof_lval l G in
        Dot(process_lval l G, lookup_named_field_index f ts)
    end
    | Index(l, e) -> Index(process_lval l G, process_expr e G)

let process_stmt st G =
    match st with
    | Assign(l, e) -> Assign(process_lval l G, process_expr e G)
    | Insert (l, e1, e2) -> Insert(process_lval l G, process_expr e1 G, process_expr e2 G)
    | Remove (l, e) -> Remove(process_lval l G, process_expr e G)
    | Assume e -> Assume (process_expr e G)

let process_env G =
    Map.map (fun key value -> process_type value) G



