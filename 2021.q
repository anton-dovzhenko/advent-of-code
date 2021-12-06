//------------------------------------
//Task 1
.aoc2021.d1.t1: {-1+sum 0<deltas "J"$"\n" vs x};
.aoc2021.d1.t2: {-1+sum 0<deltas 2_3 msum "J"$"\n" vs x};


//------------------------------------
//Task 2
.aoc2021.d2.t1: {
    x: flip update `$c, "J"$u from `c`u!flip " " vs/:"\n" vs x;
    x: update (`forward`down`up!(1 0;0 -1;0 1))c from x;
    prd abs exec sum c*u from x
 };


.aoc2021.d2.t2: {
    x: flip {(`$x 0;"J"$x 1)} flip " " vs/:"\n" vs x;
    x: {x + (`down`up`forward!((y 1;0;0);(neg y 1;0;0);(0;y 1;x[0]*y 1)))y 0} over (enlist 0 0 0), x;
    prd 1 _ x
 };


//------------------------------------
//Task 3
.aoc2021.d3.t1: {
    x: (("J"$/:)')flip "\n" vs x;
    x: (0.5*count first x)<=sum each x;
    prd 2 sv/:(x;not x)
 };


.aoc2021.d3.t2: {
    x: (("J"$/:)') "\n" vs x;
    o: {1<count x 1}{i: x 0; x: x 1; v: count[x]<=2*sum[x]@i; (i+1;x where v=x[;i])}/(0;x);
    s: {1<count x 1}{i: x 0; x: x 1; v: count[x]>2*sum[x]@i; (i+1;x where v=x[;i])}/(0;x);
    prd 2 sv/:(raze')(last')(o;s)
 };


//------------------------------------
//Task 4
.aoc2021.d4.t1: {
    x: "\n\n" vs x;
    n: "J"$"," vs first x;
    x: 1_x;
    x: {(("J"$/:)'){x where not ""~/:x} each" "vs/:"\n" vs x} each x;
    m: (count x)#enlist 5 cut 25#0b;
    result: {5>max {max raze (sum x;sum flip x)} each x 1} {(1_y 0; (y 1)|x=first y 0)}[x]/(n;m);
    n: (neg count result 0) _ n;
    x: x@first where 5={max raze (sum x;sum flip x)} each result 1;
    last[n] * sum (raze x) except n
 };


.aoc2021.d4.t2: {
    x: "\n\n" vs x;
    n: "J"$"," vs first x;
    x: 1_x;
    x: {(("J"$/:)'){x where not ""~/:x} each" "vs/:"\n" vs x} each x;
    m: (count x)#enlist 5 cut 25#0b;
    f: {(1_y[0]; y[1]|x=first y[0]; y[2]+5={(max sum x)|max sum flip x} each y[1]|x=first y[0])}[x];
    result: {any 0=x 2}f/(n;m;count[m]#0);
    n: (neg count result 0) _ n;
    x: x@ first where 1=result 2;
    last[n] * sum (raze x) except n
 };



//------------------------------------
//Task 5
.aoc2021.d5.common: {[x;onlyHV]
    x: "\n" vs x;
    x: "J"${","vs/:x} each " -> " vs/:x;
    if[onlyHV; x: x where {any(=). x} each x];
    x: raze {(,'). x}
        each 2 cut {$[1=count x;first x;x]}
        each {x[0] + (signum x 1) * til 1+abs x[1]}
        each {(x 0;x[1]-x[0])}
        each raze flip each x;
    sum 1<count each group x
 };


.aoc2021.d5.t1: .aoc2021.d5.common[;1b];
.aoc2021.d5.t2: .aoc2021.d5.common[;0b];


//------------------------------------
//Task 6
.aoc2021.d6.common: {
    x: "J"$"," vs x;
    x: count each group x;
    do[y;
        new: 0^x 0;
        x: {sum each x[1] group x 0}({?[x<0;6;x]} -1+key x;value x);
        x[8]: new
    ];
    sum x
 };


.aoc2021.d6.t1: .aoc2021.d6.common[;80];
.aoc2021.d6.t2: .aoc2021.d6.common[;256];



