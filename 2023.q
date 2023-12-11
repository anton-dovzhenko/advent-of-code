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
//Task 5
.aoc2023.d5.t1: {
    x: "\n\n" vs x;
    s: "J"$" " vs last ": " vs first x;
    m: flip each "J"${" " vs/: x} each 1_'"\n"vs/:1_x;
    min{[s;m] s+sum (m[0]-m[1]) * s within/:m[1],'m[1]+m[2]-1} over enlist[s], m
 };


.aoc2023.d5.t2: {
    x: "\n\n" vs x;
    s: {(x[0];x[0]+x[1]-1)} each 2 cut "J"$" " vs last ": " vs first x;
    x: flip each {(x[1];x[1]+x[2]-1;x[0]-x[1])} each flip each "J"${" " vs/: x} each 1_'"\n"vs/:1_x;
    x: {(,/){(x[0 1], x[1]+1)!(2#x[2]), 0} each asc x} each x;
    min raze {[s;x]
        raze {[x;s]
            s: 2 cut distinct s[1]&s[0]|asc s, key x;
            {[x;s] s+0^value[x] key[x] bin s[0]}[x] each s
        }[x] each s
    }over enlist[s], x
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


//------------------------------------
//Task 8
.aoc2023.d8.t1: {
    x: "\n\n" vs x;
    i: ("LR"!0 1)x 0;
    x: `${raze", " vs/:" = (" vs -1_x}each "\n" vs first 1_x;
    map: x[;0]!x[;1 2];
    last {[i;map;x]
        if[x[0]=`ZZZ;:x];
        (map[x[0]] i[x[1] mod count i];x[1] + 1)
        }[i;map] over (`AAA;0)
 };


.aoc2023.d8.t2: {
    x: "\n\n" vs x;
    i: ("LR"!0 1)x 0;
    x: `${raze", " vs/:" = (" vs -1_x}each "\n" vs first 1_x;
    map: x[;0]!x[;1 2];
    start: {x where x like "*A"}key map;

    // TODO: import LCM
    last {[i;map;x]
        if[0=count x[0]; :x];
        if[any x[0] like "*Z";x[2],: x[1]];
        x[0]: x[0] where not x[0] like "*Z";
        ((flip map x 0) i[x[1] mod count i];x[1] + 1;x 2)
     }[i;map] over (start;0;`long$())
 };


//------------------------------------
//Task 9
.aoc2023.d9.t1: {sum {sum last each {0<>sum abs x}{1_deltas x}\x} each "J"$" "vs/:"\n" vs x};
.aoc2023.d9.t2: {sum {{y-x} over reverse first each {0<>sum abs x}{1_deltas x}\x} each "J"$" "vs/:"\n" vs x};


//------------------------------------
//Task 11
.aoc2023.d11.t: {[x;E]
    x: "\n" vs x;
    R: where all each "."=x;
    C: where all each "."=flip x;
    x: where each "#"=x;
    x: raze {x cross y}'[til count x;x];
    distance: {[E;R;C;p1;p2]
        d: (sum/) abs p1-p2;
        b: asc each p1,'p2;
        d + (E-1)*(sum R within b 0) + (sum C within b 1)
    }[E;R;C];
    first {0<>count x 1}{[x;d] (x[0]+sum d[first x 1]'[x 1];1_x 1)}[;distance]/(0;x)
 };

.aoc2023.d11.t1: .aoc2023.d11.t[;2];
.aoc2023.d11.t2: .aoc2023.d11.t[;1000000];



