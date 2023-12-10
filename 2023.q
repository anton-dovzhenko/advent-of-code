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


//------------------------------------
//Task 7
.aoc2023.d7.t1: {
    x: update "J"$points from flip`cards`points!flip" "vs/:"\n" vs x;
    x: update score: {value desc count each group x} each cards, ct: 0 from x;
    x: update cards1: ("AKQJT98765432"!13#.Q.a)cards from x;
    x: update score: ((1 1 1 1 1;2 1 1 1;2 2 1;3 1 1;3 2;4 1;enlist 5)!til 7)score from x;
    x: `score xdesc `cards1 xasc x;
    sum {x*1+til count x}reverse x`points
 };


.aoc2023.d7.t2: {
    x: update "J"$points from flip`cards`points!flip" "vs/:"\n" vs x;
    x: update jc: `long$sum each cards="J" from x;
    x: update cards1: ssr[;"J";""] each cards from x;
    x: update score: {value desc count each group x} each cards1 from x;
    x: update score: {$[0=count x;x,y;[x[0]+:y; x]]}'[score;`long$sum each cards="J"] from x;
    x: update cards: ("AKQT98765432J"!13#.Q.a)cards from x;
    x: update score: ((1 1 1 1 1;2 1 1 1;2 2 1;3 1 1;3 2;4 1;enlist 5)!til 7)score from x;
    x: `score xdesc `cards xasc x;
    sum {x*1+til count x} reverse x`points
 };