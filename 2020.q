//------------------------------------
//Task 1
.aoc2020.d1.t1: {prd x where any x in/:(2020-x)};
.aoc2020.d1.t2: {prd x where any x in/:(2020-sum each x cross x)};


//------------------------------------
//Task 2
.aoc2020.d2.t1: {
    sum {
        p: x 1;
        c: " " vs x 0;
        L: first last c;
        pos: "J"$"-" vs first c;
        (sum p=L) within pos
    } each ": " vs/:"\n" vs x
 };


.aoc2020.d2.t2: {
    sum {
        p: x 1;
        c: " " vs x 0;
        L: first last c;
        pos: "J"$"-" vs first c;
        1=count pos inter 1+where p=L
    } each ": " vs/:"\n" vs x
 };


//------------------------------------
//Task 3
.aoc2020.d3.t1: {
    x: "\n" vs x;
    `long$sum"#"=x@'mod[3*til count x;count first x]
 };


.aoc2020.d3.t2: {
    prd {[x;r;d] "j"$sum"#"=x@'(r*til count x: first each d cut x) mod count first x}["\n" vs x]'[1 3 5 7 1;1 1 1 1 2]
 };


//------------------------------------
//Task 4
.aoc2020.d4.t1: {
    x: " " vs/: ssr[;"\n";" "] each "\n\n" vs x;
    "j"$sum {7=count ("byr";"iyr";"eyr";"hgt";"hcl";"ecl";"pid") inter first each ":"vs/:x} each x
 };


.aoc2020.d4.t2: {
    x: " " vs/:ssr[;"\n";" "] each "\n\n" vs x;
    c: ("byr";"iyr";"eyr";"hgt";"hcl";"ecl";"pid");
    x: flip(`$c) ! flip{[x;c] value c#(!) . flip ":" vs/:x}[;c] each x;
    exec count i from x where ("J"$byr) within 1920 2002,
         ("J"$iyr) within 2010 2020,
         ("J"$eyr) within 2020 2030,
         ((hgt like "*cm")&(("J"$-2_'hgt) within 150 193))|((hgt like "*in")&(("J"$-2_'hgt) within 59 76)),
         hcl like (raze"#", 6#enlist"[0-9a-f]"),
         ecl in " " vs "amb blu brn gry grn hzl oth",
         pid like raze 9#enlist"[0-9]"
 };


//------------------------------------
//Task 5
.aoc2020.d5.t1: {
    max {
        bs: {$[y;(ceiling avg x;x 1);(x 0;floor avg x)]};
        sum 8 1 * first each (bs/) each (enlist[0 127], 7#x; enlist[0 7], 7_x)
    } each ("\n" vs x) in "BR"
 };


.aoc2020.d5.t2: {
    x: {
        bs: {$[y;(ceiling avg x;x 1);(x 0;floor avg x)]};
        sum 8 1 * first each (bs/) each (enlist[0 127], 7#x; enlist[0 7], 7_x)
    } each ("\n" vs x) in "BR";
    // Find missing element
    "j"$((1 + count x) * 0.5 * max[x] + min[x]) - sum x
 };


//------------------------------------
//Task 6
.aoc2020.d6.t1: {sum count each distinct each raze each "\n" vs/:"\n\n" vs x};
.aoc2020.d6.t2: {sum count each (inter/) each "\n" vs/:"\n\n" vs x};


//------------------------------------
//Task 7
.aoc2020.d7.t1: {
    x: {(-6_x 0; " " sv/:(" "vs/:"," vs x 1)[;2 3])} each "contain" vs/:"\n" vs x;
    x: ungroup flip `bp`bc!`$flip x;
    -1+count {distinct y, exec bp from x where bc in y}[x] over `$"shiny gold"
 };


// ugly-looking, but fast
.aoc2020.d7.t2: {
    x: "\n" vs x;
    x: x where not x like "*no other bags.";
    x: {(`$-6_x 0; `$" " sv/:(" " vs/:"," vs x 1)[;2 3]; 1^"J"$(" " vs/:"," vs x 1)[;1])} each "contain" vs/:x;
    x: ungroup flip `bp`bc`cc!flip x;
    x: {
        x: update cc: cc*y[1]@/:bp from x;
        x: 0!select sum cc by bc from x where not null cc;
        (y[0] + sum x`cc; (!) . x`bc`cc)
    }[x] over (0;(!) . enlist each (`$"shiny gold";1));
    x 0
 };


// nice-looking, but slow
.aoc2020.d7.t2_v2: {
    x: "\n" vs x;
    x: x where not x like "*no other bags.";
    x: {(`$-6_x 0; raze (1^"J"$(" " vs/:"," vs x 1)[;1])#'`$" " sv/:(" " vs/:"," vs x 1)[;2 3])} each "contain" vs/:x;
    x: (!) . flip x;
    x: ((raze x@)\)`$"shiny gold";
    -1+sum count each x
 };


//------------------------------------
//Task 8
.aoc2020.d8.run: {[x;f]
     f{
         cmd: x@last y 0;
         i: (last y 0) + $[`jmp=cmd 0; cmd 1;1];
         (y[0], i; y[1] + $[`acc=cmd 0;cmd 1;0])
     }[x]/(1#0;0)
 };

.aoc2020.d8.t1: {
    x: {(`$x 0;"J"$x 1)} each " "vs/:"\n" vs x;
    x: .aoc2020.d8.run[x;{count[x 0]=count group x 0}];
    x 1
 };


.aoc2020.d8.t2: {
    x: {(`$x 0;"J"$x 1)} each " "vs/:"\n" vs x;
    run: .aoc2020.d8.run[;{(count[y 0]=count group y 0)&x>last y 0}[count x]];
    res: run each {x[y;0]: `jmp; x}[x] each where x[;0]=`nop;
    res,: run each {x[y;0]: `nop; x}[x] each where x[;0]=`jmp;
    last res@first where count[x]=last each first each res
 };


//------------------------------------
//Task 9
.aoc2020.d9.t1: {[x;N]
    x:"J"$"\n" vs x;
    x: {[x;N]0<count (N#x) inter x[N]-N#x}[;N](1_)/x;
    x@N
 };


.aoc2020.d9.t2: {[x;N]
    i: .aoc2020.d9.t1[x;N];
    x:"J"$"\n" vs x;
    s: sums x;
    high: first (where (s-i) in\:s) except where x=i;
    low: 1+first where s=s[high]-i;
    {max[x]+min[x]}x@low+til 1+high-low
 };


//------------------------------------
//Task 10
.aoc2020.d10.t1: {
    x: "J"$"\n" vs x;
    x: count each group deltas asc x;
    x: x + 1 3!0 1;
    prd value x
 };


.aoc2020.d10.t2: {
    x: asc "J"$"\n" vs x;
    first {
        y: {x: $[y=last x;1#y;x where x within y+1 3]; (x;count[x]#z)}[x]'[key y;value y];
        (+/) (!)./:y
    }[x] over (1#0)!1#1
 };


//Faster implementation
.aoc2020.d10.t2_v2:  {
    x: asc "J"$"\n" vs x;
    first {
        mk: first key y; // first gives min key
        ni: where x within mk+1 3; // next keys indices
        y: y + (x ni)!(count ni)#y mk;
        if[mk < last x;y: (1#mk) _ y];
        y
    }[x] over (1#0)!1#1
 };


//------------------------------------
//Task 11
.aoc2020.d11.t1: {
    x: "\n" vs x;
    x: {
        a: x="#";
        a1: 0b,/:a,\:0b;
        a1: (enlist count[first a1]#0b), a1, (enlist count[first a1]#0b);
        a: (-2_'-2_a1)+(-2_'2_a1)+
            (2_'-2_a1)+(2_'2_a1)+
            (-1_'1_'-2_a1)+(-1_'1_'2_a1)+
            (-1_1_-2_'a1)+(-1_1_2_'a1);
        (count first x) cut {((".#L"!({"."};{$[x>=4;"L";"#"]};{$[x=0;"#";"L"]}))x)y}./:flip (raze x; raze a)
    } over x;
    "j"$sum sum x="#"
 };


//TODO: re-write, use more Q-like style
.aoc2020.d11.t2: {
    x: "\n" vs x;
    x: {
        {[x;j;i]
            S: 0;
            S: S + any "#"= {last x except "."} j#x[i];
            S: S + any "#"= {first x except "."} (j+1)_x[i];
            S: S + any "#"= {last x except "."} i#x[;j];
            S: S + any "#"= {first x except "."} (i + 1)_x[;j];
            S: S + any "#"= {first x except "."} x ./: {all x>0}{x - 1}\(i-1;j-1);
            S: S + any "#"= {first x except "."} x ./: {(x[0]<y)&(x[1]<z)}[;count x;count first x] {x + 1}\(i+1;j+1);
            S: S + any "#"= {first x except "."} x ./: {[x;y;z](x[0]<y)&(x[1]>0)}[;count x;count first x] {x + 1 -1}\(i+1;j-1);
            S: S + any "#"= {first x except "."} x ./: {[x;y;z](x[0]>0)&(x[1]<z)}[;count x;count first x] {x + -1 1}\(i-1;j+1);
            if[x[i;j] ~ "L";:$[S=0;"#";"L"]];
            if[x[i;j] ~ "#";:$[S>=5;"L";"#"]];
            "."
        }[x]'[til count first x]'[til count x]

    } over x;
    "j"$sum sum x="#"
 };


//------------------------------------
//Task 12
.aoc2020.d12.t1: {
    x: "\n" vs x;
    x: {(`$1#x;"J"$1_x)}each x;
    x: {
        p: x 0 1;
        d: x 2;
        cmd: y 0;
        st: y 1;
        if[cmd in `E`W`N`S; :(p + st * (`E`W`N`S!(1 0;-1 0;0 1;0 -1))cmd), d];
        if[cmd in `L`R; :p, `long$(d + $[cmd=`L;1;-1]*st%90) mod 4];
        if[cmd=`F; :(p + st * ((0 1 2 3)!(1 0;0 1;-1 0;0 -1))@d), d];
        } over enlist[0 0 0], x;
    sum abs 2#x
 };


.aoc2020.d12.t2: {
    x: "\n" vs x;
    x: {(`$1#x;"J"$1_x)}each x;
    x: {
        cmd: y 0;
        st: y 1;
        if[cmd in `E`W`N`S; :(x[0];x[1] + st * (`E`W`N`S!(1 0;-1 0;0 1;0 -1))cmd)];
        if[cmd=`F; :(x[0] + st * x[1];x[1])];
        if[cmd=`L; :(x[0]; ("j"$st%90){(neg x 1; x 0)}/x 1)];
        if[cmd=`R; :(x[0]; ("j"$st%90){(x 1; neg x 0)}/x 1)];
    } over enlist[(0 0;10 1)], x;
    sum abs x 0
 };

//------------------------------------
//Task 13
.aoc2020.d13.t1: {
    x: "\n" vs x;
    ID: "J"$ x 0;
    x: ("J"$ "," vs x 1) except 0N;
    t: x - ID mod x;
    min[t] * x first where t=min t
 };


// For reference see http://homepages.math.uic.edu/~leon/mcs425-s08/handouts/chinese_remainder.pdf
.aoc2020.d13.t2: {
    x: last "\n" vs x;
    x: "J"$ "," vs x;
    x: enlist[0N] _ x!til count x;
    invmod: {[n;m] {$[0=(-1+x*z) mod y;z;z+1]}[n mod m;m] over 1};
    N: prd key x;
    Z: N div key x;
    Y: invmod ./:Z,'key x;
    W: Y*Z;
    X: (sum (W*value x) mod N) mod N;
    N-X
 };


//------------------------------------
//Task 14
.aoc2020.d14.t1: {
    x: "\n" vs x;
    x: " = " vs/: x;
    sum first {
        d: x 0;
        m: x 1;
        if[y[0] like "mask"; m: "J"$/:y 1];
        if[y[0] like "mem*";
            v: 2 sv (-36#(36#0), 2 vs "J"$y 1) ^ m;
            mem: "J"$-1 _last "[" vs y 0;
            d[mem]: v;
        ];
        (d;m)
    } over enlist[({x!x}1#0;36#0N)], x
 };


.aoc2020.d14.t2: {
    x: "\n" vs x;
    x: " = " vs/: x;
    sum first {
        d: x 0;
        m: x 1;
        if[y[0] like "mask"; m: y 1];
        if[y[0] like "mem*";
            v: "J"$y 1;
            mem: -36#(36#0), 2 vs "J"$-1 _last "[" vs y 0;
            mem[where m="1"]: 1;
            mem[where m="X"]: 2;
            mem: (cross/) {$[x=2;0 1;x]} each mem;
            mem: 2 sv/:mem;
            d[mem]: v;
        ];
        (d;m)
   } over enlist[({x!x}1#0;36#"X")], x
 };


//------------------------------------
//Task 15
.aoc2020.d15.t1: {[x;n]
    a1: n#0;
    a2: n#0;
    x: "J"$"," vs x;
    L: last x;
    a1[x]: 1+til count x;
    a2[x]: 1+til count x;
    i: 1+count x;
    do[n-count x;
        $[a2[L] = 0;
            [a2[L]: i; a1[L]: i; L: 0];
            [L: a2[L]-a1[L]; a1[L]: $[a2[L]=0; i; a2[L]]; a2[L]: i]
        ];
        i+:1
    ];
    L
 };


.aoc2020.d15.t2: .aoc2020.d15.t1;


//------------------------------------
//Task 16
.aoc2020.d16.t1: {
    x: "\n\n" vs x;
    r: "\n" vs x 0;
    r: ": "vs/:r;
    r: {"J"$"-"vs/:x}each" or " vs/:last each r;
    your: "J"$","vs/:1_"\n" vs x 1;
    near: "J"$","vs/:1_"\n" vs x 2;
    sum raze {[r;n] n@where not any n within/:raze r}[r] each near
 };


.aoc2020.d16.t2: {
    x: "\n\n" vs x;
    N: `$first each ": "vs/: "\n" vs x 0;
    r: ": "vs/:"\n" vs x 0;
    r: {"J"$"-"vs/:x}each" or " vs/:last each r;
    your: "J"$","vs/:1_"\n" vs x 1;
    near: "J"$","vs/:1_"\n" vs x 2;
    near: near@where {[r;n] all any n within/:raze r}[r] each near;
    near,: your;
    r: {[r;n] where {[n;r] all any n within/:r }[n] each r}[r] each flip near;
    r: first each {?[1=count each x;x;x except\:raze x where 1=count each x]} over r;
    prd (first your) where {x like "departure*"}N@r
 };


//------------------------------------
//Task 17
.aoc2020.d17.t1: {
    //find active points
    x: raze {{x[0],\:x 1} each flip(x;til count x)} where each "#"="\n" vs x;
    x: `g#x,\: 0;
    //define neighbourhood
    n: ({x cross x cross x} -1 0 1) except enlist 0 0 0;
    do[6; x: `g#{x where 0<count each x} {[n;x;y]
            s: sum (y+/:n) in x;
            $[s in $[y in x;2 3;3];y;()]
        }[n;x] each distinct raze x +/:\:n  // iterate through possibly active points
    ];
    count x
 };


.aoc2020.d17.t2: {
    //find active points
    x: raze {{x[0],\:x 1} each flip(x;til count x)} where each "#"="\n" vs x;
    x: `g#x,\: 0 0;
    //define neighbourhood
    n: ({x cross x cross x cross x} -1 0 1) except enlist 0 0 0 0;
    do[6; x: `g#{x where 0<count each x} {[n;x;y]
            s: sum (y+/:n) in x;
            $[s in $[y in x;2 3;3];y;()]
        }[n;x] each distinct raze x +/:\:n // iterate through possibly active points
    ];
    count x
 };


//------------------------------------
//Task 18
.aoc2020.d18.t1: {sum {eval parse x^("()"!")(")x: reverse x} each "\n" vs x};


.aoc2020.d18.t2: {
    sum "J"${
        {
            simpleParse: {prd eval each parse each "*" vs x};
            e: x?")";
            b: last where "("=(e#x);
            $[e=count x; string simpleParse x; (b#x), string[simpleParse (b+1)_e#x], (e+1)_x]
        } over x
    } each "\n" vs x
 };
