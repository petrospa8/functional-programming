type 'a bin_tree =
     Empty
   | Node of 'a * 'a bin_tree * 'a bin_tree;;

exception No_branches

let empty = Empty;;
let comp r (i,d) = Node (r,i,d);;
let root = function
   Node (r,_,_) -> r
  | Empty -> raise (Invalid_argument "root");;

let branches = function Node (_,i,d) -> (i,d) | _ -> raise No_branches;;
let is_empty = function Empty -> true | _ -> false;;
let is_single = function
   Node (_,Empty,Empty) -> true
  | _ -> false;;

let left t =
   fst (branches t);;

let right t =
  snd (branches t);;

let rec size t =
  if (is_single t) then 1
    else let (l,r) = branches t in
      2 + (size l) + (size r);;

let rec height t =
if (is_single t) then 1
  else let (l,r) = branches t in
    1 + max (height l) (height r);;

let rec pre_order t =
  if (is_single t) then
    [root t]
  else let (l,r) = branches t in
   root t::((pre_order l) @ (pre_order r));;

let rec post_order t =
  if (is_single t) then
    [root t]
  else let (l,r) = branches t in
    ((post_order l) @ (post_order r)) @ [root t];;

let rec in_order t =
  if (is_single t) then
    [root t]
  else let (l,r) = branches t in
    in_order(l) @ [root t] @ (in_order l);;

let rec leaves t =
  if (is_single t) then
    [root t]
  else let (l,r) = branches t in
    leaves(l) @ leaves(r);;

let rec mirror t =
  if (is_single t) then
    Node (root t, Empty, Empty)
  else let (l,r) = branches t in
    Node ((root t), mirror r, mirror l);;

let rec tree_map f = function
  Empty -> Empty
  | Node (a, l, r) -> Node (f a, tree_map f l, tree_map f r);;
