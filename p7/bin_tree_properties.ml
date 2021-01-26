open Bin_tree;;

let rec is_strict t =
  match t with
    Empty -> true
  | Node(_,l,r) -> is_strict l && is_strict r;;

let rec is_perfect t =
  if t = Empty then true
  else let l,r = Bin_tree.branches t in (Bin_tree.height l = Bin_tree.height r) && (is_perfect l) && (is_perfect r);;

let rec is_complet t =
  if t = Empty then true
  else let l,r = Bin_tree.branches t in (Bin_tree.height l) >= (Bin_tree.height r) && (is_complet l) && (is_complet r);;
