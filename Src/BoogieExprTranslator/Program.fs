open System

(* Types *)
type Type = INT | ANY | Tuple of Type list

(* Expressions *)
type Expr = Const of int | Var of string | Op of Expr * Expr | Dot of Expr * int | Cast of Expr * Type | Tuple of Expr list
type Lval = Var of string | Dot of Lval * int
type Stmt = Assign of Lval * Expr | Assume of Expr | Send of Expr

let rec lval_to_expr lval =
  match lval with
  | Lval.Var(v) -> Expr.Var(v)
  | Lval.Dot(l, i) -> Expr.Dot(lval_to_expr l, i)

(* Input program *)
let stmtlist = [ 
                 Assign(Lval.Var("c"), Expr.Tuple [Expr.Const 1; Expr.Const 2]);  // c = (1,2)
                 Assign(Lval.Var("x"), Expr.Var("y"));  // x = y
                 Assign(Lval.Var("d"), Expr.Var("c"));  // d = c
                 Assign(Lval.Var("c"), Expr.Cast(Expr.Var("d"), Type.Tuple [INT; INT]));  // d = c
               ]

let env = Map.ofList [ 
            ("a", INT); 
            ("b", ANY); 
            ("c", Type.Tuple [INT; INT]); 
            ("d", Type.Tuple [ANY; ANY]); 
            ("x", INT); 
            ("y", INT) 
          ]

(* Exception for everything that we don't want to do *)
exception Not_defined;

(* Printing functions *)
let rec print_list fn ls =
  match ls with
  | [] -> ""
  | [h] -> (fn h)
  | h::t -> sprintf "%s, %s" (fn h) (print_list fn t)

let rec print_type t =
  match t with
  | INT -> "int"
  | ANY -> "any"
  | Type.Tuple(ls) -> sprintf "(%s)" (print_list print_type ls)

let rec print_lval (l: Lval) =
  match l with
  | Lval.Var(v) -> v
  | Lval.Dot(v, i) -> sprintf "%s.%d" (print_lval v) i
   
let rec print_expr (e: Expr) =
  match e with
  | Const(i) -> i.ToString()
  | Expr.Var(s) -> s
  | Op(e1,e2) -> sprintf "(%s + %s)" (print_expr e1) (print_expr e2)
  | Expr.Dot(e, i) -> (print_expr e) + "." + i.ToString()
  | Cast(e, t) -> sprintf "(%s as %s)" (print_expr e) (print_type t)
  | Tuple(ls) -> sprintf "(%s)" (print_list print_expr ls)
 
let print_stmt s =
  match s with
  | Assign(l, e) -> sprintf "%s = %s" (print_lval l) (print_expr e)
  | Assume(e) -> sprintf "assume %s" (print_expr e)
  | Send(e) -> sprintf "send %s" (print_expr e)

let rec typeof expr G =
  match expr with
  | Const(_) -> INT
  | Expr.Var(v) -> G v
  | Op(e1, e2) -> INT
  | Expr.Dot(e, i) -> 
  begin
    let ts = typeof e G in
    match ts with
    | Type.Tuple(ls) -> List.nth ls i
    | _ -> raise Not_defined
  end
  | Cast(e, t) -> t
  | Expr.Tuple(es) -> Type.Tuple(List.map (fun e -> typeof e G) es)

let rec typeof_lval lval G =
  match lval with
  | Lval.Var(v) -> G v
  | Lval.Dot(l, i) -> 
    begin
    match (typeof_lval l G) with
    | Type.Tuple(ls) -> List.nth ls i
    | _ -> raise Not_defined
  end

(* Quadratic time; can optimize *)
let rec find_all_types stmt G =
  let rec all_exprs e =
    let ret =
        match e with
        | Const(_) -> Set.empty
        | Expr.Var(v) -> Set.empty
        | Op(e1, e2) -> Set.union (all_exprs e1) (all_exprs e2)
        | Expr.Dot(e', _) -> all_exprs e'
        | Cast(e, t) -> all_exprs e
        | Expr.Tuple(es) -> List.fold (fun s e -> Set.union s (all_exprs e)) Set.empty es
    in 
    ret.Add(e)
  in
  let all_types_expr e G = Set.map (fun e -> typeof e G) (all_exprs e) in
  let rec all_types_lval lval G =
    match lval with
    | Lval.Var(v) -> Set.singleton (G v)
    | Lval.Dot(l, _) -> Set.union (Set.singleton (typeof_lval lval G)) (Set.singleton (typeof_lval l G))
  in
  match stmt with
  | Assign(l, e) -> Set.union (all_types_expr e G) (all_types_lval l G)
  | Assume(e) -> all_types_expr e G
  | Send(e) -> all_types_expr e G

let rec is_subtype t1 t2 =
  match (t1, t2) with
  | (_, ANY) -> true
  | (a,b) when a = b -> true
  | (Type.Tuple(ls1), Type.Tuple(ls2)) ->
    begin
      if List.length ls1 <> List.length ls2 then false
      else begin
        let z = List.zip ls1 ls2 in
        let z = List.map (fun (a,b) -> (is_subtype a b)) z in
        List.fold (fun p b -> p && b) false z
      end
    end
  | _ -> false

let map_all_types stmtlist G =
  let types = List.fold (fun s stmt -> Set.union s (find_all_types stmt G)) Set.empty stmtlist in
  let (ret,_) = Set.fold (fun (m,i) t -> (Map.add t i m, i+1)) (Map.empty, 0) types in
  ret


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

(* Takes an expr as input, returns the re-written expr, a set of statements and updated environemt *)
let rec remove_side_effects_expr expr G =
  
  let get_local ty G =
    let name = get_fresh_var() in
    (name, fun s -> if s = name then ty else G s)
  in
  let (nexpr, stlist, nG) =
    match expr with
    | Expr.Const(_) 
    | Expr.Var(_) -> (expr, [], G)
    | Expr.Op(e1, e2) ->
      begin
        let (e1', s1, G') = remove_side_effects_expr e1 G in
        let (e2', s2, G'') = remove_side_effects_expr e2 G' in
        (Expr.Op(e1', e2'), s1 @ s2, G'')
      end
    | Expr.Dot(e,f) ->
      begin
        let (e', s, G') = remove_side_effects_expr e G in
        (Expr.Dot(e', f), s, G')
      end
    | Expr.Cast(e, t) -> 
      begin
        let (e', s, G') = remove_side_effects_expr e G in
        let (l, G'') = get_local t G' in
        (Expr.Var(l), s @ [Assign(Lval.Var(l), Expr.Cast(e',t))], G'')
      end
    | Expr.Tuple(es) ->
      begin
        let (a, b, c) = 
          List.fold (fun (partial_es, partial_stlist, partial_G) e -> 
            begin
              let (e', s, G') = remove_side_effects_expr e partial_G in
              (e' :: partial_es, partial_stlist @ s, G')
            end
            ) ([], [], G) es
        in
        let (l, Gfinal) = get_local (typeof expr G) c in
        (Expr.Var(l), b @ [Assign(Lval.Var(l), Expr.Tuple(List.rev a))], Gfinal)
      end
    in (nexpr, stlist, nG) 

let remove_side_effects_stmt stmt G =
  match stmt with
  | Assign(l, e) -> 
    begin
      let (e', d, G') = remove_side_effects_expr e G in
      (d @ [Assign(l, e')], G')
    end
  | Assume(e) ->
    begin
      let (e', d, G') = remove_side_effects_expr e G in
      (d @ [Assume(e')], G')
    end
  | Send(e) ->
    begin
      let (e', d, G') = remove_side_effects_expr e G in
      (d @ [Send(e')], G')
    end

(* returns new list of statements and the new G *)
let remove_side_effects_stlist stlist G =
  List.fold (fun (partial_stlist, partial_G) stmt ->
    begin
      let (d, G') = remove_side_effects_stmt stmt partial_G in
      (partial_stlist @ d, G')
    end
    ) ([], G) stlist


let rec normalize_lval_stmt st G =
  match st with
  | Assign(l, e) ->
    begin
      match l with
      | Lval.Dot(l', f) -> 
        begin
          let t = tuple_size (typeof_lval l' G) in
          let rhs = ref [] in
          for i = (t-1) downto 0 do
            if i = f then rhs := e :: !rhs 
            else rhs := Expr.Dot(lval_to_expr l', f) :: !rhs
          normalize_lval_stmt (Assign(l', Expr.Tuple !rhs)) G
        end
      | _ -> Assign(l, e)
    end
  | _ -> st
  
(* Translation of normalized side-effect-free programs to Boogie *)
let translate_type t =
  match t with
  | INT -> "int"
  | _ -> "PrtRef"

let translate_decl env =
  Map.iter (fun v t -> printfn "var %s: %s" v (translate_type t)) env

let rec translate_expr expr G =
  match expr with
  | Expr.Const(i) -> i.ToString()
  | Expr.Var(v) -> v
  | Expr.Op(e1, e2) -> sprintf "(%s + %s)" (translate_expr e1 G) (translate_expr e2 G)
  | Expr.Dot(e, f) -> sprintf "PrtSelectFn_%d_%s(%s)" f (translate_type (typeof expr G)) (translate_expr expr G)
  | Expr.Cast(_, _) -> raise Not_defined
  | Expr.Tuple(_) -> raise Not_defined

(*
let rec enumerate_struct expr G =
*)


let translate_assign lval expr G typemap =
  let lhs = match lval with
            | Lval.Var(v) -> v
            | _ -> raise Not_defined
  in
  let do_copy_int e G lhs_var rhs_var =
    match typeof e G with
    | INT -> printfn "%s := %s;" lhs_var rhs_var
    | ANY -> printfn "%s := PrtSelectFn_int(%s);" lhs_var rhs_var
    | _ -> raise Not_defined
  in
  let do_copy_any e G lhs_var rhs_var =
    match typeof e G with
    | INT -> 
      begin
        printfn "call %s := AllocatePrtRef();" lhs_var
        printfn "assume PrtSelectFn_int(%s) == %s;" lhs_var rhs_var
      end
    | _ -> printfn "%s := %s;" lhs_var rhs_var
  in
  let do_copy l e G lhs_var rhs_var =
    match typeof_lval l G with
    | INT -> do_copy_int e G lhs_var rhs_var
    | _ -> do_copy_any e G lhs_var rhs_var
  in

  let gen_rhs_value e G =
    let rhs_var =     
      match typeof e G with
      | INT -> "tmp_rhs_value_int"
      | _ -> "tmp_rhs_value_PrtRef"
    in
    printfn "%s := %s" rhs_var (translate_expr e G)
    rhs_var
  in
  let gen_type_assertion e G t =
    match typeof e G with
    | INT -> () (* redundant cast *)
    | _ -> printfn "assert PrtSubType(PrtDynamicType(tmp_rhs_value_PrtRef), PrtType%d);" (Map.find t typemap)
  in
  match expr with 
  | Expr.Cast(e, t) -> 
    begin
      (* evaluate rhs *)
      let rhs_var = gen_rhs_value e G in
      (* generate type assertion *)
      gen_type_assertion e G t
      do_copy lval e G lhs rhs_var
    end
  | Expr.Tuple(es) ->
    begin
      for i = 0 to (List.length es) - 1 do
        let ei = (List.nth es i) in
        printfn "tmp_rhs_value_%d_%s := %s;" i (translate_type (typeof ei G)) (translate_expr ei G)
      printfn "call %s := AllocatePrtRef();" lhs
      printfn "assume PrtDynamicType(%s) == PrtType%d;" lhs (Map.find (typeof_lval lval G) typemap)
      for i = 0 to (List.length es) - 1 do
        let ti = translate_type (typeof (List.nth es i) G) in
        printfn "assume PrtSelectFn_%d_%s(%s) == tmp_rhs_value_%d_%s;" i ti lhs i ti
    end
  | _ ->
    begin
      (* evaluate rhs *)
      let rhs_var = gen_rhs_value expr G in
      do_copy lval expr G lhs rhs_var
    end

let translate_stmt stmt G typemap =
  match stmt with
  | Assign(l, e) -> translate_assign l e G typemap
  | _ -> ()
  
[<EntryPoint>]
let main argv = 
    printfn "Input program:";
    List.iter (fun s -> printfn "%s" (print_stmt s)) stmtlist;
    printfn "Input type environment";
    Map.iter (fun v t -> printfn "%s -> %s" v (print_type t)) env;

    let G = fun v -> if Map.containsKey v env then Map.find v env else raise Not_defined in

    (* Remove side effects *)
    let stmtlist = List.map (fun s -> normalize_lval_stmt s G) stmtlist in
    let (stmtlist, G) = remove_side_effects_stlist stmtlist G in

    printfn "Side-effect-free program:"
    List.iter (fun s -> printfn "%s" (print_stmt s)) stmtlist;

    (* Enumerate types in the program *)
    printfn "type PrtType;";
    let typemap = map_all_types stmtlist G in
    Map.iter (fun t i -> printfn "const unique PrtType%d: PrtType; // %s" i (print_type t)) typemap;

    (* Enumerate the subtyping relationship *)
    printfn "function PrtSubType(PrtType,PrtType):bool;";
    Map.iter (fun t1 i1 -> 
      Map.iter (fun t2 i2 -> 
      begin
        if is_subtype t1 t2 then printfn "axiom PrtSubType(PrtType%d, PrtType%d);" i1 i2
        else printfn "axiom !PrtSubType(PrtType%d, PrtType%d);" i1 i2
      end
      ) typemap) typemap;

    (* ref type *)
    printfn "type PrtRef;"
    printfn ""

    (* runtime type *)
    printfn "function PrtDynamicType(PrtRef):PrtType;"
    printfn ""

    (* fields *)
    let max_fields = max_tuple_size typemap in

    printfn "function PrtSelectFn_int(PrtRef) : int;"
    for i = 0 to (max_fields-1) do
      printfn "function PrtSelectFn_%d_int(PrtRef) : int;" i
      printfn "function PrtSelectFn_%d_PrtRef(PrtRef) : PrtRef;" i
    printfn ""

    (* Allocation *)
    printfn "//var PrtRefAlloc: [PrtRef]bool;"
    printfn "//const null: PrtRef;"
    printfn "procedure AllocatePrtRef() returns (x: PrtRef) {"
    printfn "  //assume !PrtRefAlloc[x] && x != null;"
    printfn "  //PrtRefAlloc[x] := true;"
    printfn "}"
    printfn ""

    List.iter (fun s -> translate_stmt s G typemap) stmtlist
    0 // return an integer exit code
