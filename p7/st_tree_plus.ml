open St_tree;;

let is_single t =
    try let _ = branches t in false
    with No_branches -> true;;

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
    1 + max (height(l)) (height(r));;

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
    single (root t)
  else let (l,r) = branches t in
    comp (root t)(mirror r, mirror l);;

let rec tree_map f t =
  if (is_single t) then
    single (f (root t))
  else let (l,r) = branches t in
    comp (f (root  t)) ((tree_map f l), (tree_map f r));;
