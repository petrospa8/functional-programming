let init x f =
  if x < 0 then raise(Invalid_argument "init")
  else let rec aux n l =
    if n = x then List.rev l
    else aux (n + 1) ((f n)::l) in
  aux 0 [];;

let suml l = List.fold_left (+) 0 l;;

let maxl = function
  [] -> raise (Failure "maxl")
  | h::t -> List.fold_left (max) h t;;

let to0from n =
  let rec aux x l =
    if x = 0 then List.rev (x::l)
    else aux (x-1) (x::l)
  in aux n [];;

let fromto m n = if m < n then [] else init (n - m + 1) ((+) m);;

let from1to n = init n ((+) 1);;

let append l1 l2 = List.rev_append (List.rev l1) l2;;

let concat l =
  let rec aux temp l =
    match l with
         [] -> temp
       | h::t -> let rec aux2 temp2 l =
          match l with
            [] -> List.rev temp2
            | h1::t1 -> aux2 (h1::temp2) t1 in
        aux (List.rev_append (List.rev temp) (aux2 [] h)) t in
  aux [] l;;

let map f l =
  let rec aux laux l2 =
    match l2 with
      [] -> laux
      | h::t-> aux ((f h)::laux) t in
    List.rev(aux [] l);;

let power x y =
   if y < 0 then raise(Invalid_argument "power")
   else if y == 0 then 1
   else let rec aux x2 acc =
    if acc == 1 then x2
    else aux (x*x2) (acc - 1) in
  aux x y;;

let fib n =
  let rec aux i j cont =
    if cont = n then j
    else aux j (i + j) (cont + 1) in
  aux 0 1 1;;

let fact n =
  let rec aux p i =
    if i = 0 then float_of_int p
    else aux (p * i) (i - 1)
  in aux 1 n;;

let incseg l = List.fold_right (fun x t -> x::List.map ((+) x) t) l [];;

let concat l =
  let rec aux temp l =
    match l with
         [] -> temp
       | h::t -> let rec aux2 temp2 l =
          match l with
            [] -> List.rev temp2
            | h1::t1 -> aux2 (h1::temp2) t1 in
        aux (List.rev_append (List.rev temp) (aux2 [] h)) t in
  aux [] l;;

let incseg l =
  match l with
    [] -> []
    | h::t -> let rec aux acc laux lst =
      match lst with
        [] -> List.rev laux
        | h::t -> aux (acc + h) ((acc + h)::laux) t in
    aux 0 [] l;;

let rec multicomp l x =
  match List.rev l with
    [] -> x
    | h::t -> multicomp t (h x);;

let rec insert x = function
  [] -> [x]
  | l -> let rec aux laux lst =
    match laux,lst with
    [],[] -> [x]
    | _,[] -> List.rev_append (List.rev laux) [x]
    | _, h::t -> if x <= h then List.rev_append (List.rev laux) (x::lst)
      else aux (List.rev_append (List.rev laux) [h]) t in
  aux [] l;;

  let rec insert_gen f x = function
    [] -> [x]
    | l -> let rec aux laux lst =
      match laux,lst with
      [],[] -> [x]
      | _,[] -> List.rev_append (List.rev laux) [x]
      | _, h::t -> if f x h then List.rev_append (List.rev laux) (x::lst)
        else aux (List.rev_append (List.rev laux) [h]) t in
    aux [] l;;
