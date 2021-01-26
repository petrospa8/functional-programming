( );;
(*- : unit = () *)

2 + 5 * 3;;
(* - : int = 17*)

1.0;;
(*- : float = 1.*)

(*1.0 * 2;;
Error: This expression has type float but an expression was expected of type
         int  *)
(* El símbolo del producto de números reales es *. y 2 no es un float *)
1.0 *. 2.;;
(*- : float = 2.*)

(*2 - 2.0;;
Error: This expression has type float but an expression was expected of type
         int*)
(* - es el símbolo de resta para números enteros y 2 no es un float *)
2. -. 2.0;;
(*- : float = 0.*)

(*3.0 + 2.0;;
Error: This expression has type float but an expression was expected of type
         int*)
(* El símbolo + corresponde a la suma de enteros +. para floats*)
3.0 +. 2.0;;
(*- : float = 5.*)

5 / 3;;
(*- : int = 1*)

5 mod 3;;
(*- : int = 2*)

3.0 *. 2.0 ** 3.0;;
(*- : float = 24.*)

3.0 = float_of_int 3;;
(*- : bool = true*)

(*sqrt 4;;
Error: This expression has type int but an expression was expected of type
         float*)
(* sqrt funciona únicamente con floats *)
sqrt 4.;;
(*- : float = 2.*)

int_of_float 2.1 + int_of_float (-2.9);;
(*- : int = 0*)
(* int_of_float toma la parte entera de un float *)

(*truncate 2.1 +. floor (-2.9);;
Error: This expression has type int but an expression was expected of type
         float*)
(* +. es el simbolo de la suma de floats, truncate devuelve un entero *)
floor 2.1 +. floor (-2.9);;
(*- : float = -1.*)

(*floor 2. +. truncate (-2.9);;
Error:  This expression has type int but an expression was expected of type
         float*)
(* truncate devuelve un entero *)
truncate 2. + truncate (-2.9);;
(*- : int = 0*)

(*ceil 2.1 +. ceil -2.9;;
Error: This expression has type float -> float
       but an expression was expected of type float*)
(*Los números negativos deben ser expresados con paréntesis *)
ceil 2.1 +. ceil (-2.9);;
(*- : float = 1.*)

'B';;
(*- : char = 'B'*)

int_of_char 'A';;
(*- : int = 65*)

char_of_int 66;;
(*- : char = 'B'*)

Char.code 'B';;
(*- : int = 66*)

Char.chr 67;;
(*- : char = 'C'*)

'\067';;
(*- : char = 'C'*)

(*Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'Ñ');;
Warning 3: deprecated: ISO-Latin1 characters in identifiers
Error: Syntax error: operator expected.*)
(* La ñ no está en la tabla asci de OCaml *)
Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'N');;
(*- : char = 'n'*)

(*Char.uppercase 'ñ';;
Warning 3: deprecated: ISO-Latin1 characters in identifiers
Error: Syntax error*)
(* La ñ no está en la tabla asci que reconoce OCaml *)
Char.uppercase 'n';;
(*- : char = 'N'*)

Char.lowercase 'O';;
(*- : char = 'o'*)

"this is a string";;
(*- : string = "this is a string"*)

String.length "longitud";;
(*- : int = 8*)

(*"1999" + "1";;
Error: This expression has type string but an expression was expected of type
         int*)
(* Esta no es la sintaxis para concatenar strings, debe usarse ^ *)
"1999" ^ "1";;
(*- : string = "19991"*)

"1999" ^ "1";;
(*- : string = "19991"*)

int_of_string "1999" + 1;;
(*- : int = 2000*)

"\064\065";;
(*- : string = "@A"*)

string_of_int 010;;
(*- : string = "10"*)
(* 010 = 10*)

not true;;
(*- : bool = false*)

true && false;;
(*- : bool = false*)

true || false;;
(*- : bool = true*)

(1 < 2) = false;;
(*- : bool = false*)

"1" < "2";;
(*- : bool = true*)

2 < 12;;
(*- : bool = true*)

"2" < "12";;
(*- : bool = false*)

"uno" < "dos";;
(*- : bool = false*)

2,5;;
(*- : int * int = (2, 5)*)

"hola", "adios";;
(*- : string * string = ("hola", "adios")*)

0, 0.0;;
(*- : int * float = (0, 0.)*)

fst ('a',0);;
(*- : char = 'a'*)

snd (false, true);;
(*- : bool = true*)

(1,2,3);;
(*- : int * int * int = (1,2,3)*)

(1,2),3;;
(*- : (int * int) * int = ((1,2),3)*)

fst ((1,2),3);;
(*- : int * int = (1,2)*)

if 3 = 4 then 0 else 4;;
(*- : int = 4*)

if 3 = 4 then "0" else "4";;
(*- : string = "4"*)

(*if 3 = 4 then 0 else "4";;
Error: This expression has type string but an expression was expected of type
         int*)
(* Ambos outputs de la función if deben pertenecer al mismo tipo*)
if 3 = 4 then 0 else 4;;
(*- : int = 4*)

let pi = 2.0 *. asin 1.0;;
(*val pi : float = 3.14159265358979312*)

sin (pi /. 2.);;
(*- : float = 1.*)
