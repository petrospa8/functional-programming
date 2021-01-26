let x = 1;;
(*- : val x : int = 1 *)

let y = 2;;
(*val y : int = 2 *)

x - y;;
(*- : int = -1*)

let x = y in x - y;;
(*- : int = 0*)

(*z;;
Error: Unbound value z*)
(*z es un nombre al que no se le ha asignado ningún valor*)
'z';;
(*- : char = 'z'*)

let z = x + y;;
(* val z : int = 3*)

z;;
(* - : int = 3*)

let y = 5 in x + y;;
(* - : int = 6*)

x + y;;
(*-: int = 3*)

let p = 2,5;;
(* val p : int*int = (2,5) *)

snd p, fst p;;
(*- : int*int = (5,2) *)

p;;
(*- : int*int = (2,5) *)

(*let p = 0,1 in p snd p, fst p;;
Error: This expression has type int * int
       This is not a function; it cannot be applied.*)
(* Ya que p no es una función, no puede aplicarse a snd p*)
let p = 0,1 in snd p, fst p;;
(*- : int*int = (1,0)*)

p;;
(*- : int*int = (2,5) *)

let x,y = p;;
(*val x : int = 2
  val y : int = 5*)

let z = x + y;;
(*val z : int = 7*)

let x,y = p,x;;
(*val x : int*int = (2,5)
  val y : int = 2 *)

let x = let x,y = 2,3 in x * x + y;;
(*val x : int = 7*)

x + y;;
(*- : int = 9*)

z;;
(*- : int = 7*)

let x = x + y in let y = x * y in x + y + z;;
(*- : int = 34*)

x + y + z;;
(*- : int = 16*)

int_of_float;;
(*- : float -> int = <fun>*)

float_of_int;;
(*- : int -> float = <fun>*)

int_of_char;;
(*- : char -> int = <fun>*)

char_of_int;;
(*- : int -> char = <fun>*)

abs;;
(*- : int -> int = <fun>*)

sqrt;;
(*- : float -> float = <fun>*)

truncate;;
(*- : float -> int = <fun>*)

ceil;;
(*- : float -> float = <fun>*)

floor;;
(*- : float -> float = <fun>*)

Char.code;;
(*- : char -> int = <fun>*)

String.length;;
(* - : String -> int = <fun>*)

fst;;
(*- : 'a * 'b -> 'a *)

snd;;
(*- : 'a * 'b -> 'b *)

function x -> 2 * x;;
(*- : int -> int = <fun> *)

(function x -> 2 * x) (2 + 1);;
(*- : int = 6*)

function (x,y) -> x;;
(*- : 'a * 'b' -> 'a = <fun>*)

let f = function x -> 2 * x;;
(* val f : int -> int = <fun> *)

f (2+1);;
(*- : int = 6 *)

f 2 + 1;;
(*- : int = 5 *)

let n = 1;;
(*val n : int = 1*)

(*sum n 10;;
Error: Unbound value sum*)
(*sum no es el identificador de ninguna función*)
(+) n 10;;
(*- : int = 11*)

(*let sumn = sum n;;
Error: Unbound value sum*)
(* sum sigue sin estar identificado con ningún valor ni función*)
let sumn = (+) n;;
(*val sumn : int -> int = <fun>*)

let n = 1000;;
(*val n : int = 1000*)

sumn 100;;
(*- : int = 101*)
