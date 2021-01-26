let lowercase = function a -> if ((123 > Char.code a) && (Char.code a > 96)) then char_of_int( Char.code a - 32) else a;;
let uppercase = function a -> if ((91 > Char.code a) && (Char.code a > 64)) then char_of_int( Char.code a + 32) else a;;
