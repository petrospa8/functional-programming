type log_exp =
    Const of bool
  | Var of string
  | Neg of log_exp
  | Disj of log_exp * log_exp
  | Conj of log_exp * log_exp
  | Cond of log_exp * log_exp
  | BiCond of log_exp * log_exp;;

let rec eval ctx = function
    Const b -> b
  | Var s -> List.assoc s ctx
  | Neg e -> not (eval ctx e)
  | Disj (e1, e2) -> (eval ctx e1) || (eval ctx e2)
  | Conj (e1, e2) -> (eval ctx e1) && (eval ctx e2)
  | Cond (e1, e2) -> (not (eval ctx e1)) || (eval ctx e2)
  | BiCond (e1, e2) -> (eval ctx e1) = (eval ctx e2);;

type oper = Not;;

type biOper = Or | And | If | Iff;;

type prop =
    C of bool
  | V of string
  | Op of oper * prop
  | BiOp of biOper * prop * prop;;

let rec prop_of_log_exp = function
	  Const a -> C a
	| Var a -> V a
	| Neg a -> Op (Not, prop_of_log_exp a)
	| Disj (a,b) -> BiOp (Or, prop_of_log_exp a, prop_of_log_exp b)
	| Conj (a,b) -> BiOp (And, prop_of_log_exp a, prop_of_log_exp b)
	| Cond (a,b) -> BiOp (If, prop_of_log_exp a, prop_of_log_exp b)
	| BiCond (a,b) -> BiOp (Iff, prop_of_log_exp a, prop_of_log_exp b);;

let rec log_exp_of_prop = function
    C a -> Const a
  | V a -> Var a
  | Op (Not, a) -> Neg (log_exp_of_prop a)
  | BiOp (Or,a,b) -> Disj (log_exp_of_prop a, log_exp_of_prop b)
  | BiOp (And,a,b) -> Conj (log_exp_of_prop a, log_exp_of_prop b)
  | BiOp (If,a,b) -> Cond (log_exp_of_prop a, log_exp_of_prop b)
  | BiOp (Iff,a,b) -> BiCond (log_exp_of_prop a, log_exp_of_prop b);;

let opval = function
  Not -> not;;

let biopval = function
    Or -> (||)
  | And -> (&&)
  | If -> (fun a b -> (not a) || b)
  | Iff -> (fun a b -> (not a || b) && (not b || a));;

let rec peval l pr =
  match pr with
     C a -> a
   | V a -> (eval l (Var a))
   | Op (a,b) -> (opval a) (peval l b)
   | BiOp (a,b,c) -> (biopval a) (peval l b) (peval l c);;

let init x f =
if x < 0 then raise(Invalid_argument "init")
else let rec aux n l =
  if n = x then List.rev l
  else aux (n + 1) ((f n)::l) in
aux 0 [];;

let rec rem_dup = function
  [] -> []
 | h::t -> if List.mem h t then
    rem_dup t
  else h::rem_dup t;;

let rec not_list l =
  match l with
    [] -> []
  | h::t -> if h then
      false::not_list t
  else true::t;;

let rec isTau_list l =
  match l with
	   [] -> true
   | h::t -> h && isTau_list t;;


let rec combine l1 l2 =
 match (l1,l2) with
    ([],[]) -> []
   |(a::_,[]) -> raise(Invalid_argument "combine")
   |([], a::_) -> raise(Invalid_argument "combine")
   |(h1::t1,h2::t2) -> (h1,h2)::(combine t1 t2);;

let is_tau p =
	let rec aux q = function
		C b -> []
		|V a -> [a]
		|Op (x,y) -> aux q y
		|BiOp (x,y,z) -> aux q y @ aux q z in
    let laux = rem_dup (aux [] p) in
	let lst = ref (init (List.length laux) (fun _ -> false)) in
	let valor = ref true in
	while !valor && not (isTau_list !lst) do
		valor := peval (combine laux !lst) p;
		lst := not_list !lst
	done;
	!valor;;
