let hd = function
        [] -> raise(Failure "hd")
     | a::b -> a;;

let tl = function
        [] -> raise(Failure "hd")
     | a::b -> b;;

let length l =
 let rec aux(n,ls) =
   match ls with
   [] -> n
   | _::t -> aux(n+1,t)
   in aux(0,l);;

let nth l z =
  if z < 0 then raise(Invalid_argument "nth")
  else let rec aux l z=
  match l with
    [] -> raise(Failure "nth")
  | h::t -> if z = 0 then h
            else aux t (z - 1) in
  aux l z;;

let rec append l1 l2 =
	match l1 with
	 [] -> l2
	| (h::t) -> h::(append t l2);;

let rec rev l =
  match l with
  [] -> []
  | h::t -> append (rev t) [h];;

let rec rev_append l1 l2 =
	match l1 with
    [] -> l2
  | h::t -> rev_append t (h::l2);;

let rec concat = function
	 [] -> []
	| a::t -> append a (concat t);;

let flatten = concat;;

let rec map f l =
	match l with
	  [] -> []
	| a::t -> (f a)::(map f t);;

  let rec map2 f l1 l2 =
  	match (l1 , l2) with
  	  ([],[]) -> []
  	| (h1::t1, h2::t2) -> let rec aux la lb =
        match (la,lb) with
        ((a1::b1),(a2::b2)) -> a1 a2::(aux b1 b2)
        |([],[]) -> []
        |(_::_,[]) -> raise(Invalid_argument "map2")
        |([],_::_) ->raise(Invalid_argument "map2")
        in aux (map f l1) l2
  	| (_::_,[]) -> raise(Invalid_argument "map2")
    | ([],_::_) -> raise(Invalid_argument "map2");;

let fold_left f a l =
	match l with
	  [] -> a
	| _ -> let rec aux f x l =
    match l with
      [] -> x
      | h::t -> aux f (f x h) t in
  aux f a l;;

let rec fold_right f l a =
	match l with
    [] -> a
    | _ -> let rec aux f l x =
      match l with
        [] -> x
        | h::t -> aux f t (f h x) in
  aux f (rev l) a;;

let rec find p l =
	match l with
	  [] -> raise Not_found
  	| a::t -> if (p a) then a
  			      else find p t ;;

let rec find_all p l =
	match l with
		  [] -> []
		| a::t -> if (p a) then
				a::(find_all p t)
			else find_all p t;;

let rec exists p l =
	match l with
		  [] -> false
		| h::t -> (p h) || exists p t;;

let rec mem p l =
	match l with
		  [] -> false
		| h::t -> (p == h) || mem p t;;

let rec filter p l =
  match l with
      [] -> []
    | h::t -> if (p h) then
                h::(filter p t) else (filter p t);;

let find_all = filter;;

let partition p l =
  let rec aux p l l1 l2 =
    match l with
    [] -> (l1,l2)
    | h::t -> if (p h) then aux p t (rev_append (rev(l1)) [h]) l2
              else aux p t l1 (rev_append (rev(l2)) [h])
    in aux p l [] [];;

let rec for_all p l =
match l with
[] -> true
| h::t -> (p h) && for_all p t;;


let rec split l=
  match l with
    [] -> ([],[])
    | (a,b)::t -> ((a::(map fst t)),(b::(map snd t)));;

let rec combine l1 l2 =
  match (l1,l2) with
    ([],[]) -> []
    |(a::_,[]) -> raise(Invalid_argument "combine")
    |([], a::_) -> raise(Invalid_argument "combine")
    |(h1::t1,h2::t2) -> (h1,h2)::(combine t1 t2);;
