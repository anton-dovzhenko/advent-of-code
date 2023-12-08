//------------------------------------
//Task 1
.aoc2023.d1.t1: {
    x: "\n" vs x;
    sum "J"$x@'{(first x;last x)} each where each x in .Q.n
 };


.aoc2023.d1.t2: {
    x: "\n" vs x;
    N: (("one";"two";"three";"four";"five";"six";"seven";"eight";"nine"), .Q.n)!1_.Q.n, .Q.n;
    sum "J"$(N {[N;x] N {first where x=min x}first each x ss/:N}[key N] each x),'
        (N {[N;x] N {last where x=max x}last each x ss/:N}[key N] each x)
 };

