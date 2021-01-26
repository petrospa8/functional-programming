let lprod l1 l2 =
   let rec aux laux la lb =
     match (la,lb) with
     ([],[]) -> laux
     |(a::_,[]) -> raise(Invalid_argument "lprod")
     |([], a::_) -> raise(Invalid_argument "lprod")
     | (a::t1, b::t2) -> aux (List.rev_append (List.rev laux) [(a,b)]) t1 t2 in
   aux [] l1 l2;;
