let rlist_t r n =
  if n <= 0 then []
  else let rec aux cont lst =
    if cont = n then lst
    else aux (cont + 1) (Random.int r::lst)
  in aux 0 [];;


let insert_t x l =
	let rec aux y = function
	[] -> List.rev (x::y)
	|h::t -> if x <= h then
    List.rev_append y (x::(h::t))
		else aux (h::y) t
	in aux [] l;;

let rec insert x = function
    [] -> [x]
  | h::t -> if x <= h then x::h::t
            else h::insert x t;;

let isort_t l =
  let rec aux lord lunor =
    match lunor with
      [] -> lord
      | h::t -> aux (insert_t h lord) t in
    aux [] (List.rev l);;

let rec isort = function
  [] -> []
  | h::t -> insert h (isort t);;

let rec divide = function
  h1::h2::t -> let t1,t2 = divide t in
               h1::t1, h2::t2
               | l -> l,[];;
let divide_t l =
  let rec aux l1 l2 lst=
    match lst with
      h1::h2::t -> aux (h1::l1) (h2::l2) t
      | lt-> ((List.rev_append (List.rev lt) l1) , l2) in
  aux [] [] l;;

let rec merge l1 l2 = match l1,l2 with
  [], l | l, [] -> l
  | h1::t1, h2::t2 -> if h1 <= h2 then h1::merge t1 l2
                    else h2::merge l1 t2;;

let rec msort l = match l with
  [] | [_] -> l
  | _ -> let l1,l2 = divide l in
       merge (msort l1) (msort l2);;


let merge_t l1 l2 =
  let rec aux la lb laux =
    match la,lb with
      [],[] -> laux
      | [],l | l,[] -> List.rev_append laux l
      | h1::t1 , h2::t2 -> if h1 <= h2 then aux t1 (h2::t2) (h1::laux)
        else aux (h1::t1) t2 (h2::laux) in
  aux l1 l2 [];;

let rec msort_qt l = match l with
  [] | [_] -> l
| _ -> let l1,l2 = divide_t l in
       merge_t (msort_qt l1) (msort_qt l2);;


let partition_t p l =
 let rec aux p l l1 l2 =
   match l with
   [] -> (l1,l2)
   | h::t -> if (p h) then aux p t (List.rev_append (List.rev(l1)) [h]) l2
             else aux p t l1 (List.rev_append (List.rev(l2)) [h])
   in aux p l [] [];;

 let rec qsort_qt l = match l with
  [] | [_] -> l
  | h::t -> let l1,l2 = List.partition ((<=) h) t in
    List.rev_append (List.rev (qsort_qt l2)) (h::qsort_qt l1);;


let init x f =
  if x < 0 then raise(Invalid_argument "init")
  else let rec aux n l =
    if n = x then List.rev l
    else aux (n + 1) ((f n)::l) in
  aux 0 [];;

let fromto m n = if m > n then [] else init (n - m + 1) ((+) m);;

let rec qsort l = match l with
  [] | [_] -> l
| h::t -> let l1,l2 = List.partition ((<=) h) t in
          qsort l2 @ (h::qsort l1);;

let crono f x =
  let t = Sys.time () in
  let _ = f x in
  Sys.time () -. t;;

let rec merge_gen f l1 l2 = match l1,l2 with
  [], l | l, [] -> l
| h1::t1, h2::t2 -> if f h1 h2 then h1::merge t1 l2
                    else h2::merge l1 t2;;
let rec msort_gen f l = match l with
  [] | [_] -> l
  | _ -> let l1,l2 = divide l in
       merge_gen f (msort l1) (msort l2);;

let rec insert_gen f x = function
  [] -> [x]
  | h::t -> if f x h then x::h::t
          else h::insert x t;;

let rec isort_gen f l = match l with
  [] -> []
| h::t -> insert_gen f h (isort_gen f t);;

let insert_t_gen f x l =
	let rec aux y = function
	[] -> List.rev (x::y)
	|h::t -> if f x h then
    List.rev_append y (x::(h::t))
		else aux (h::y) t
	in aux [] l;;

let isort_t_gen f l =
  let rec aux lord lunor =
    match lunor with
      [] -> lord
      | h::t -> aux (insert_t_gen f h lord) t in
    aux [] l;;

let merge_t_gen f l1 l2 =
  let rec aux la lb laux =
   match la,lb with
     [],[] -> laux
     | [],l | l,[] -> List.rev_append laux l
     | h1::t1 , h2::t2 -> if f h1 h2 then aux t1 (h2::t2) (h1::laux)
       else aux (h1::t1) t2 (h2::laux) in
  aux l1 l2 [];;


let rec msort_qt_gen f l = match l with
 [] | [_] -> l
 | _ -> let l1,l2 = divide_t l in
      merge_t_gen f (msort_qt_gen f l1) (msort_qt_gen f l2);;

let rec qsort_gen f l = match l with
 [] | [_] -> l
 | h::t -> let l1,l2 = List.partition (f h) t in
         qsort l2 @ (h::qsort l1);;


let rec qsort_qt_gen f l = match l with
[] | [_] -> l
| h::t -> let l1,l2 = List.partition (f h) t in
  List.rev_append (List.rev (qsort_qt l2)) (h::qsort_qt l1);;
