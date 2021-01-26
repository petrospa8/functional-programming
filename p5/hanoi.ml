let rec hanoi (a,b,c) n =
  if n <= 0 then []
  else hanoi (a,c,b) (n-1) @ ((a,c)::(hanoi (b,a,c) (n-1)));;
