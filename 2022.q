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
    tree: f each x;
    tree*: reverse each f each reverse each x;
    tree*: flip f each flip x;
    tree*: flip reverse each f each reverse each flip x;
    `long$(max/)tree
 };


