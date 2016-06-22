namespace Microsoft.P2Boogie
    
    module RemoveSideEffects = 
        open Syntax
        open Common
        open Helper
        open ProgramTyping

        (* Takes an expr as input, returns the re-written expr, a set of statements and updated environemt *)
        let rec remove_side_effects_expr expr G =
          let (nexpr, stlist, nG) =
            match expr with
            | Nil
            | ConstInt _
            | ConstBool _
            | Event _
            | This
            | Expr.Var(_) -> (expr, [], G)
            | Expr.Default t when t = Int || t = Null || t = Bool || t = Any || t = Machine || t = Type.Event -> (expr, [], G)
            | Nondet -> 
              begin
                let (l, G') = get_local Bool G in
                (Expr.Var(l), [Assign(Lval.Var(l), Nondet)], G')
              end
            | Bin(op, e1, e2) when (op = Eq || op = Neq) ->
              begin
                let (e1', s1, G') = remove_side_effects_expr e1 G in
                let (e2', s2, G'') = remove_side_effects_expr e2 G' in
                let (l, G''') = get_local Bool G'' in
                let nexpr = if op = Eq then Expr.Var(l) else Expr.Un(Not, Expr.Var(l)) in
                (nexpr, s1 @ s2 @ [Assign(Lval.Var(l), Bin(Eq, e1', e2'))], G''')
              end
            | Bin(op, e1, e2) when op = In || op = Idx ->
              begin
                let (l, G') = get_local (typeof expr G) G in
                let (e1', s1, G'') = remove_side_effects_expr e1 G' in
                let (e2', s2, G''') = remove_side_effects_expr e2 G'' in
                (Expr.Var(l), s1 @ s2 @ [Assign(Lval.Var(l), Bin(op, e1', e2'))], G''')
              end
            | Bin(op, e1, e2) ->
              begin
                let (e1', s1, G') = remove_side_effects_expr e1 G in
                let (e2', s2, G'') = remove_side_effects_expr e2 G' in
                (Bin(op, e1', e2'), s1 @ s2, G'')
              end
            | Un(Keys, e) ->
              begin
                let (l, G') = get_local (Seq (get_domain_type (typeof e G))) G in
                (Expr.Var(l), [Assign(Lval.Var(l), expr)], G')
              end
            | Un(Values, e) ->
              begin
                let (l, G') = get_local (Seq (get_range_type (typeof e G))) G in
                (Expr.Var(l), [Assign(Lval.Var(l), expr)], G')
              end
            | Un(op, e) ->
              begin
                let (e', s, G') = remove_side_effects_expr e G in
                (Un(op, e'), s, G')
              end
            | Expr.Dot(e,f) ->
              begin
                let (e', s, G') = remove_side_effects_expr e G in
                (Expr.Dot(e', f), s, G')
              end
            | Expr.NamedTuple(_)
            | Expr.NamedDot(_, _) -> raise Not_defined
            | Expr.Cast(e, t) when (is_subtype (typeof e G) t) -> 
              begin
                (* redundant cast *)
                remove_side_effects_expr e G
              end
            | Expr.Cast(e, t) -> 
              begin
                let (e', s, G') = remove_side_effects_expr e G in
                let (l, G'') = get_local t G' in
                (Expr.Var(l), s @ [Assign(Lval.Var(l), Expr.Cast(e',t))], G'')
              end
            | Expr.Default t ->
              begin
                let (l, G') = get_local t G in
                match t with 
                | Type.Tuple(ts) ->
                  begin
                    let (a, b, c) = 
                      List.fold (fun (partial_ls, partial_stlist, partial_G) ti -> 
                        begin
                          let (li, G'') = get_local ti partial_G in
                          let (e', s, G''') = remove_side_effects_expr (Expr.Default ti) G'' in
                          (li :: partial_ls, partial_stlist @ s @ [Assign(Lval.Var(li), e')], G''')
                        end
                        ) ([], [], G') ts
                    in
                    (Expr.Var(l), b @ [Assign(Lval.Var(l), Expr.Tuple (List.map Expr.Var (List.rev a)))], c)
                  end
                | _ -> (Expr.Var(l), [Assign(Lval.Var(l), expr)], G')
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
            | Expr.Call(callee, es) ->
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
                (Expr.Var(l), b @ [Assign(Lval.Var(l), Expr.Call(callee, List.rev a))], Gfinal)
              end
            | New(m, e) ->
              begin
                let (e', s, G') = remove_side_effects_expr e G in
                let (l, G'') = get_local (typeof expr G') G' in
                (Expr.Var(l), s @ [Assign(Lval.Var(l), New(m, e'))], G'')
              end
            in (nexpr, stlist, nG) 

        (* Takes an lval as input, returns the re-written lval, a set of statements and updated environemt *)
        let rec remove_side_effects_lval lval G =
          match lval with
          | Lval.Var(_) -> (lval, [], G)
          | Lval.Dot(l, f) -> 
            begin
              let (l', stlist, G') = remove_side_effects_lval l G in
              (Lval.Dot(l', f), stlist, G')
            end
          | Lval.NamedDot(_, _) -> raise Not_defined
          | Lval.Index(l, e) ->
            begin
              let (e', stlist1, G') = remove_side_effects_expr e G in
              let (l', stlist2, G'') = remove_side_effects_lval l G in
              (Lval.Index(l', e'), stlist1 @ stlist2, G'')
            end

        let remove_side_effects_stmt stmt G =
          match stmt with
          | Assign(l, e) -> 
            begin
              let (l', d1, G') = remove_side_effects_lval l G in
              let (e', d2, G'') = remove_side_effects_expr e G' in
              (d1 @ d2 @ [Assign(l', e')], G'')
            end
          | Insert(l, e1, e2) ->
            begin
              let (l', d1, G') = remove_side_effects_lval l G in
              let (e1', d2, G'') = remove_side_effects_expr e1 G' in
              let (e2', d3, G''') = remove_side_effects_expr e2 G'' in
              (d1 @ d2 @ d3 @ [Insert(l', e1', e2')], G''')
            end
          | Remove(l, e) ->
            begin
              let (l', d1, G') = remove_side_effects_lval l G in
              let (e', d2, G'') = remove_side_effects_expr e G' in
              (d1 @ d2 @ [Remove(l', e')], G'')
            end
          | Assume(e) ->
            begin
              let (e', d, G') = remove_side_effects_expr e G in
              (d @ [Assume(e')], G')
            end

        (* returns new list of statements and the new G *)
        let remove_side_effects_stlist stlist G =
          List.fold (fun (partial_stlist, partial_G) stmt ->
            begin
              let (d, G') = remove_side_effects_stmt stmt partial_G in
              (partial_stlist @ d, G')
            end
            ) ([], G) stlist

        (* returns a list of statements and a new G *)
        let rec normalize_lval_stmt st G =
          match st with
          | Assign(lval, e) ->
            begin
              match lval with
                 (* l.f = e
                  * ==> 
                  * l = (l.0, l.1, ..., e)
                  *)
              | Lval.Dot(l, f) -> 
                begin
                  let t = tuple_size (typeof_lval l G) in
                  let rhs = ref [] in
                  for i = (t-1) downto 0 do
                    if i = f then rhs := e :: !rhs 
                    else rhs := Expr.Dot(lval_to_expr l, f) :: !rhs
                  normalize_lval_stmt (Assign(l, Expr.Tuple !rhs)) G
                end
              | Lval.Index(Lval.Var(_), _) -> ([st], G)
                 (* l[e'] = e
                  * ==> 
                  * t = l; t[e'] = e; l = t
                  *)
              | Lval.Index(l, e') ->
                begin
                  let (t, G') = get_local (typeof_lval l G) G in
                  let s1 = Assign(Lval.Var(t), lval_to_expr l) in
                  let s2 = Assign(Lval.Index(Lval.Var(t), e'), e) in
                  let s3 = Assign(l, Expr.Var(t)) in
                  let (s3list, G'') = normalize_lval_stmt s3 G' in
                  ([s1; s2] @ s3list, G'')
                end
              | _ -> ([st], G)
            end
          | Remove(lval, e) ->
            begin
              match lval with
              (* lval -= e
               * ==>
               * t = lval; t -= e; lval = t
               *)
              | Lval.Dot(_ ,_)
              | Lval.Index(_, _) ->
                begin
                  let (t, G') = get_local (typeof_lval lval G) G in
                  let s1 = Assign(Lval.Var(t), lval_to_expr lval) in
                  let s2 = Remove(Lval.Var(t), e) in
                  let s3 = Assign(lval, Expr.Var(t)) in
                  let (s3list, G'') = normalize_lval_stmt s3 G' in
                  ([s1; s2] @s3list, G'')
                end
              | _ -> ([st], G)
            end
          | Insert(lval, e1, e2) ->
            begin
              match lval with
              (* lval += (e1,e2)
               * ==>
               * t = lval; t += (e1,e2); lval = t
               *)
              | Lval.Dot(_, _) 
              | Lval.Index(_, _) ->
                begin
                  let (t, G') = get_local (typeof_lval lval G) G in
                  let s1 = Assign(Lval.Var(t), lval_to_expr lval) in
                  let s2 = Insert(Lval.Var(t), e1, e2) in
                  let s3 = Assign(lval, Expr.Var(t)) in
                  let (s3list, G'') = normalize_lval_stmt s3 G' in
                  ([s1; s2] @s3list, G'')
                end
              | _ -> ([st], G)
            end
          | _ -> ([st], G)

        (* returns new list of statements and the new G *)
        let normalize_lval_stlist stlist G =
          List.fold (fun (partial_stlist, partial_G) stmt ->
            begin
              let (d, G') = normalize_lval_stmt stmt partial_G in
              (partial_stlist @ d, G')
            end
            ) ([], G) stlist
      
