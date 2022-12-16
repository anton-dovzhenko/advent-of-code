//------------------------------------
//Task 1
.aoc2022.d1.t1: {max sum each "J"$"\n" vs/: "\n\n" vs x};
.aoc2022.d1.t2: {sum 3#desc sum each "J"$"\n" vs/: "\n\n" vs x};


//------------------------------------
//Task 2
.aoc2022.d2.t1: {
    x: `$" " vs/:"\n" vs x;
    x: x^(`X`Y`Z!`A`B`C)x;
    score: (`A`B`C cross `A`B`C)!3 6 0 0 3 6 6 0 3;
    sum (score x)+(`A`B`C!1 2 3) x[;1]
 };


.aoc2022.d2.t2: {
    x: `$" " vs/:"\n" vs x;
    score: (`A`B`C cross `X`Y`Z)!3 1 2 1 2 3 2 3 1;
    sum (score x)+(`X`Y`Z!0 3 6) x[;1]
 };


//------------------------------------
//Task 3
.aoc2022.d3.t1: {
    sum ((.Q.a,.Q.A)!1+til 52) raze {distinct (inter) . (count[x] div 2) cut x} each "\n" vs x
 };


.aoc2022.d3.t2: {
    a: .Q.a,.Q.A;
    sum (a!1+til 52) raze {[a;x] a where 3=sum a in/:x}[a] each 3 cut "\n" vs x
 };


//------------------------------------
//Task 4
.aoc2022.d4.t1: {
    x: "J"$"-"(vs/:)'","vs/:"\n" vs x;
    contains: (all')(within)./:;
    `long$sum (contains x)|(contains reverse each x)
 };


.aoc2022.d4.t2: {
    x: "J"$"-"(vs/:)'","vs/:"\n" vs x;
    overlaps: (any')(within)./:;
    `long$sum (overlaps x)|(overlaps reverse each x)
 };


//------------------------------------
//Task 5
.aoc2022.d5.parse: {
    x: "\n" vs/:"\n\n" vs x;
    s: x 0;
    m: x 1;
    s: flip  (-1_s)@\:where not " "=last s;
    s: reverse each s except\: " ";
    m:  ("J"$" "vs/:m)@\:1 3 5;
    (enlist s), m
 };


.aoc2022.d5.t1: {
    x: {[s;m]
        len: m 0; i1: -1+m 1; i2: -1+m 2;
        s[i2],: reverse (neg len)#s@i1;
        s[i1]: (neg len)_s@i1;
        s
    } over .aoc2022.d5.parse x;
    raze last each x
 };


.aoc2022.d5.t2: {
    x: {[s;m]
        len: m 0; i1: -1+m 1; i2: -1+m 2;
        s[i2],: (neg len)#s@i1;
        s[i1]: (neg len)_s@i1;
        s
    } over .aoc2022.d5.parse x;
    raze last each x
 };


//------------------------------------
//Task 6
.aoc2022.d6.common: {y+count[x]-count {$[y=count distinct y#x;x;1_x]}[;y] over x};
.aoc2022.d6.t1: .aoc2022.d6.common[;4];
.aoc2022.d6.t2: .aoc2022.d6.common[;14];


//------------------------------------
//Task 7
.aoc2022.d7.getDirSize: {
    x: "\n" vs x;
    d: {[x;y] $[y like "$ cd ..";-1_x;$[y like "$ cd*";x, `$last" " vs y;x]]} scan `, x;
    s: "J"$first each " "vs/:x;
    {[d;s;D] sum s where D~/:count[D]#'d}[d;s] each distinct d
 };


.aoc2022.d7.t1: {
    x: .aoc2022.d7.getDirSize x;
    sum x where x<=100000
 };


.aoc2022.d7.t2: {
    x: .aoc2022.d7.getDirSize x;
    min x where 30000000<=(70000000-max[x])+x
 };


//------------------------------------
//Task 8
.aoc2022.d8.t1: {
    x: ("J"$'')"\n" vs x;
    f: {(x>-1,-1_maxs x)|reverse(rx>-1,-1_maxs rx: reverse x)};
    `long$(sum/)(f each x)| flip f each flip x
 };


.aoc2022.d8.t2: {
    x: ("J"$'')"\n" vs x;
    f: {(reverse til count x)^first each 1_'where each (til count x)_'x<=\:x};
    f: f';
    rev: reverse';
    tree: f x;
    tree*: rev f rev x;
    tree*: flip f flip x;
    tree*: flip rev f rev flip x;
    `long$(max/)tree
 };


//------------------------------------
//Task 9
.aoc2022.d9.common: {[x;len]
    x: flip " "vs/:"\n" vs x;
    x: flip ("J"$last x;("RULD"!(1 0;0 1;-1 0;0 -1))raze first x);
    x: raze x[;0]#'enlist each x[;1];
    x: {x,' {$[1<max abs x-y; y+signum x-y;y]} scan (enlist y + -2#x[0]), -2#'1_x} over (enlist 2 cut (2*len)#0), x;
    count distinct 2 cut last x
 };


.aoc2022.d9.t1: .aoc2022.d9.common[;2];
.aoc2022.d9.t2: .aoc2022.d9.common[;10];


//------------------------------------
//Task 10
.aoc2022.d10.getRegisters: {
    x: 0^"J"$last each " "vs/:"\n" vs x;
    .tmp.first: 1b;
    x: -1_1_{[x;y]
        r: last x;
        x, $[y=0;r;$[.tmp.first;[.tmp.first: 0b;(2#r),r+y]; (1#r),r+y]]
        } over 1, x;
    x
 };

.aoc2022.d10.t1: {{sum y*x@-1+y}[.aoc2022.d10.getRegisters x;20 60 100 140 180 220]};
.aoc2022.d10.t2: {(10b!"#.") {((1+til count x)-x) within 0 2} each 40 cut .aoc2022.d10.getRegisters x};


//------------------------------------
//Task 11
.aoc2022.d11.parseInput: {
    x: {("J"$", " vs last ": " vs x 1;
            parse "{",ssr[last " = " vs x 2;"old";"x"],"}";
            x[3]: "J"$last " "vs x 3;
            ("J"$last " "vs x 4;"J"$last " "vs x 5))
     } each "\n"vs/:"\n\n" vs x;
    update done: 0, m: til count x from flip`items`oper`divisible`nextM!flip x
 };


.aoc2022.d11.t1: {
    x: .aoc2022.d11.parseInput x;
    x: (20*count x){
        M: first x;
        Items: ((M`oper) M`items) div 3;
        nextM: (10b!M`nextM)0=Items mod M`divisible;
        x: update items: enlist `long$(), done: done+count Items from x where m in M`m;
        x: {[x;y] update items: (items,'y[0])from x where m=y[1]} over enlist[x], Items,'nextM;
        x: (1_x), 1#x;
        x
     }/x;
    prd 2#desc x`done
 };


.aoc2022.d11.t2: {
    x: .aoc2022.d11.parseInput x;
    x: (10000*count x){
        M: first x;
        Items: ((M`oper) M`items) mod prd x`divisible;
        nextM: (10b!M`nextM)0=Items mod M`divisible;
        x: update items: enlist `long$(), done: done+count Items from x where m in M`m;
        x: {[x;y] update items: (items,'y[0])from x where m=y[1]} over enlist[x], Items,'nextM;
        x: (1_x), 1#x;
        x
     }/x;
    prd 2#desc x`done
 };


//------------------------------------
//Task 12
.aoc2022.d12.findMinSteps: {
    x: {
        start: select from x where steps<0W;
        x: delete from x where h<>1+`int$"z", p in start`p;
        start: start cross ([]move: (0 1;1 0;0 -1;-1 0));
        start: select h1: h, steps1: 1+steps, p: p+move from start;
        nextx: ej[`p;x;start];
        nextx: select from nextx where h1>=h-1, steps1<steps;
        x: x lj select steps: min steps1 by p from nextx;
        x
     } over x;
    exec first steps from x where h=1+`int$"z"
 };


.aoc2022.d12.t1: {
    x: `int$/:"\n" vs x;
    x: update steps: 0W from ([] h: raze x; p: (til count x) cross til count first x);
    x: update steps: 0 from x where h=`int$"S";
    x: update h: -1+`int$"a" from x where h in `int$"S";
    x: update h: 1+`int$"z" from x where h=`int$"E";
    .aoc2022.d12.findMinSteps x
 };


.aoc2022.d12.t2: {
    x: `int$/:"\n" vs x;
    x: update steps: 0W from ([] h: raze x; p: (til count x) cross til count first x);
    x: update h: `int$"a" from x where h in `int$"S";
    x: update steps: 0 from x where h=`int$"a";
    x: update h: 1+`int$"z" from x where h=`int$"E";
    .aoc2022.d12.findMinSteps x
 };


//------------------------------------
//Task 15
.aoc2022.d15.parse: {
    x: " "vs/:"\n" vs ssr[;":";""] ssr[;",";""] x;
    x: x[;2 3 8 9];
    "J"${last each "="vs/:x} each x
 };


.aoc2022.d15.t1: {[x;row]
    x: .aoc2022.d15.parse x;
    b: -2#'x;
    x: asc distinct raze last each {[x;y]
        d: (sum/) 1_abs deltas 2 cut x;
        axis: abs x[1]-y;
        (x;$[axis>d;();(x[0]+(til 1+d-axis),neg til 1+d-axis)])
     }[;row] each x;
    count x except distinct first each b where b[;1]=row
 };


.aoc2022.d15.t2: {[x;maxLen]
    x: .aoc2022.d15.parse x;
    x: (2#'x),'(abs x[;0]-x[;2])+ abs x[;1]-x[;3];
    x: {
        x: x[;0],'x[;2]-(abs x[;1]-z);
        x: x where x[;1]>-1;
        x: (0|x[;0]-x[;1]),'y&x[;0]+x[;1];
        {$[last[x]>=-1+first[y]; (-1_x), max(last x;last y); x,y]} over asc x
     }[x;maxLen] each til maxLen+1;
    Y: first where 2<count each x;
    X: avg (x Y) 1 2;
    `long$Y+X*4e6
 };

