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


//------------------------------------
//Task 7
.aoc2021.d7.t1: {
    x: "J"$"," vs x;
    `long$min {sum (x-y)|y-x}[x] each min[x] + til 1+max[x]-min[x]
 };


.aoc2021.d7.t2: {
    x: "J"$"," vs x;
    `long$min {sum {x*0.5*x+1} (x-y)|y-x}[x] each min[x] + til 1+max[x]-min[x]
 };


//------------------------------------
//Task 8
.aoc2021.d8.t1: {
    x: "\n" vs x;
    `long$sum (count each raze " " vs/: last each " | " vs/:x) in 2 3 4 7
 };


.aoc2021.d8.t2: {
    sum {
        x: " "vs/:" | " vs x;
        n: x 0;
        res: x 1;

        d:1 4 7 8!n (count each n)?2 4 3 7;
        n6: n where 6 = count each n;
        n5: n where 5 = count each n;

        d[6]: n6 first where 1=count each n6 inter\:d 1;
        d[9]: n6 first where 4=count each n6 inter\:d 4;
        d[0]: first n6 except value d;

        d[3]: n5 first where 2=count each n5 inter\:d 1;
        n5: n5 except value d;
        d[5]: n5 first where 3=count each n5 inter\: d 4;
        d[2]: first  n5 except value d;

        d: (asc each value d)!key d;
        "J"$raze string d asc each res
    } each "\n" vs x

 };


//------------------------------------
//Task 9
.aoc2021.d9.t1: {
    x: (("J"$/:)')"\n" vs x;
    fmin: {x=(reverse 3 mmin reverse x)&3 mmin x};
    mask: fmin[x]&flip fmin flip x;
    (sum/) mask+x*mask
 };


.aoc2021.d9.t2: {
    x: {"J"$/:x}each"\n" vs x;
    x: raze {x,'y}'[til count x;where each not x=9];
    bs: ();

    while[0 < count x;
        b: enlist first[x];
        i: 1#0N;
        while[0<count i;
            x: `u#x except b;
            i: (raze b +/:\:(0 1;1 0;0 -1;-1 0)) inter x;
            b: distinct b, i
        ];
        bs,: count b;
    ];
    prd 3#desc bs
 };


//------------------------------------
//Task 10
.aoc2021.d10.t1: {
    x: "\n" vs x;
    x: {
        {
            d: ")}>]"!"({<[";
            c: first x 1;
            if[0=count x 1;:x];
            if[c in "([<{"; :(x[0],c; 1_x[1])];
            $[(last x 0)~d c; (-1_x[0]; 1_x[1]); ("";c)]
        } over ("";x)
    } each x;
    sum (")]}>"!3 57 1197 25137) raze x[;1]
 };


.aoc2021.d10.t2: {
    x: "\n" vs x;
    x: {
        {
            d: ")}>]"!"({<[";
            c: first x 1;
            if[0=count x 1;:x;];
            if[c in "([<{"; :(x[0],c;1_x[1])];
            $[(last x 0)~d c; (-1_x[0]; 1_x[1]); ("";c)]
        } over ("";x)
    } each x;
    `long$med {{y+5*x}over 0, x} each (reverse') ("([{<"!1 2 3 4) {x where not x~\:""} x[;0]
 };


//------------------------------------
//Task 11
.aoc2021.d11.t1: {
    x: {"J"$/:x} each "\n" vs x;
    x: (til[10] cross til 10)!raze x;
    first 100{
        cnt: x 0;
        x: 1+x 1;
        x: {
            f: (key x) where (value x)>9;
            x: f _ x;
            inc: raze f+/:\:(-1 -1;0 -1;1 -1;-1 0;1 0;-1 1; 0 1; 1 1);
            (key x)#x + count each group inc
        } over x;
        (cnt+100-count x;x+(til[10] cross til 10)!100#0)
    }/(0;x)
 };


.aoc2021.d11.t2: {
    x: {"J"$/:x} each "\n" vs x;
    x: (til[10] cross til 10)!raze x;
    first {not all all 0=x 1}{
        i: x 0;
        x: 1+x 1;
        x: {
            f: (key x) where (value x)>9;
            x: f _ x;
            inc: raze f+/:\:(-1 -1;0 -1;1 -1;-1 0;1 0;-1 1; 0 1; 1 1);
            (key x)#x + count each group inc
        } over x;
        (i+1;x+(til[10] cross til 10)!100#0)
    }/(0;x)
 };


//------------------------------------
//Task 12
.aoc2021.d12.t1: {
    x: `$"-"vs/:"\n" vs x;
    x: x, reverse each x;
    x: x where not (x[;0]=`end)|x[;1]=`start;
    count {[x;y]
        raze {
            if[`end=last y; :enlist y;];
            noend: y where {x~lower[x]}each string y;
            x: x where (x[;0]=last y)&not x[;1] in noend;
            y,/:x[;1]
        }[x] each y
    }[x] over (x where x[;0]=`start)
 };


.aoc2021.d12.t2: {
    x: `$"-"vs/:"\n" vs x;
    x: x, reverse each x;
    x: x where not (x[;0]=`end)|x[;1]=`start;
    count {[x;y]
        raze {
            if[`end=last y; :enlist y;];
            noend: {
                x: x where {x~lower[x]}each string x;
                $[2=max count each group x;distinct x;`$()]
            }y;
            x: x where (x[;0]=last y)&not x[;1] in noend;
            y,/:x[;1]
        }[x] each y
    }[x] over (x where x[;0]=`start)
 };


//------------------------------------
//Task 13
.aoc2021.d13.t1: {
    x: "\n\n" vs x;
    d: x 0;
    f: x 1;
    d: "J"$","vs/:"\n" vs d;
    f: last each " "vs/:"\n" vs f;
    f: flip {(`$x 0;"J"$x 1)} flip "="vs/:f;
    count {
        $[y[0]=`x;
            {distinct (x where x[;0]<y), (1 -1*/:(2*y;0)-/:x where x[;0]>y)}[x;y 1];
            {distinct (x where x[;1]<y), (-1 1*/:(0;2*y)-/:x where x[;1]>y)}[x;y 1]]
    } over enlist[d], enlist first f
 };


.aoc2021.d13.t2: {
    x: "\n\n" vs x;
    d: x 0;
    f: x 1;
    d: "J"$","vs/:"\n" vs d;
    f: last each " "vs/:"\n" vs f;
    f: flip {(`$x 0;"J"$x 1)} flip "="vs/:f;
    d: {
        $[y[0]=`x;
            {distinct (x where x[;0]<y), (1 -1 */:(2*y;0)-/:x where x[;0]>y)}[x;y 1];
            {distinct (x where x[;1]<y), ( -1 1*/:(0;2*y)-/:x where x[;1]>y)}[x;y 1]]
    } over enlist[d], f;
    size: 1+max d;
    h: size 0;
    w: size 1;
    "\n" sv flip (01b!" #") w cut (til[h] cross til w) in d
 };


//------------------------------------
//Task 14
.aoc2021.d14.common: {[x;s]
    x: "\n\n" vs x;
    m: ((!) . flip " -> " vs/:"\n" vs x 1); //map
    p: count each group (-1_x 0),'(1_x 0); //pairs
    p: s{[m;p] {sum each y group x} . flip raze {ins: first x@y;((y[0],ins;z);(ins,y 1;z))}[m]'[key p;value p] }[m]/p;
    {max[x]-min[x]} ceiling 0.5*{sum each y group x} . (raze key p;raze 2#'value p)
 };


.aoc2021.d14.t1: .aoc2021.d14.common[;10];
.aoc2021.d14.t2: .aoc2021.d14.common[;40];


//------------------------------------
//Task 15
//FIXME: improve, current implementation is slow
.aoc2021.d15.common: {
    N: count x;
    d: `u#(til N) cross til N;
    md: d!raze flip sums flip sums x;
    d: d!raze x;
    stack: (0 1;1 0);
    while[0<count stack;
        ns: stack+/:\:(0 1;0 -1;1 0;-1 0);
        ns: {(key[x] where not null value x)#x}(&/)(ns)!'md[stack]+d ns;
        ns: (where ns <= (key ns)#md)#ns;
        md,: ns;
        stack: key ns
    ];
   last last md
 };


.aoc2021.d15.t1: {
    x: "\n" vs x;
    x: {"J"$/:x}each x;
    x[0;0]: 0;
    .aoc2021.d15.common x
 };


.aoc2021.d15.t2: {
    x: "\n" vs x;
    x: {"J"$/:x}each x;
    f: {1|mod[x+1;10]};
    x: 8 f\x;
    x: x (til 5)+\:til 5;
    x: (,/){((,')/)x} each x;
    x[0;0]: 0;
    .aoc2021.d15.common x
 };


//------------------------------------
//Task 16
.aoc2021.d16.getMap: {
{"B"$/:x} each (!) . flip " = " vs/:"\n" vs
"0 = 0000
1 = 0001
2 = 0010
3 = 0011
4 = 0100
5 = 0101
6 = 0110
7 = 0111
8 = 1000
9 = 1001
A = 1010
B = 1011
C = 1100
D = 1101
E = 1110
F = 1111"
 };


.aoc2021.d16.t1: {
    x: raze (.aoc2021.d16.getMap`)@/:x;
    sum first {0<sum x[2]}{
        cache: x 0;
        state: x 1;
        x: x 2;
        if[state=`V; cache,: 2 sv 3#x; :(cache;`T;3_x)];
        if[state=`T; id: 2 sv 3#x; :(cache;$[id=4;`N;`I];3_x)];
        if[state=`N; :(cache;$[x 0;`N;`V];5_x)];
        if[state=`I; :(cache;$[x 0;`L1;`L0];1_x)];
        if[state=`L0; :(cache;`V;15_x)];
        if[state=`L1; :(cache;`V;11_x)];
        '"[IllegalStateException] unreachable point";
    }/(();`V;x)
 };


.aoc2021.d16.t2: {
    // parse into (stack;bitlen;oplen)
    x: {
        x: raze (.aoc2021.d16.getMap`)@/:x;
        x: {0<sum x[2]}{
            c: x 0;
            state: x 1;
            x: x 2;
            if[state=`V; c[2],: count x;:(c;`T;3_x)];
            if[state=`T; id: 2 sv 3#x; :((c[0], $[id=4;();`$string id]; c 1;c 2;c 3);$[id=4;`N;`I];3_x)];
            if[state=`N;
                :($[x 0;(c 0;c[1], x 1+til 4;c 2;c 3);(c[0], 2 sv raze c[1], x 1+til 4;();c 2;c[3], 0)];$[x 0;`N;`V];5_x)];
            if[state=`I; :(c;$[x 0;`L1;`L0];1_x)];
            if[state=`L0; c[3],: 2 sv 15#x; :(c;`V;15_x)];
            if[state=`L1; c[3],: neg 2 sv 11#x; :(c;`V;11_x)];
            '"[IllegalStateException] unreachable point";
        }/((();();`long$();`long$());`V;x);

        adj: count last x;
        x: first x;
        x[2]: reverse deltas reverse x 2;
        x[2]: (-1_x[2]), last[x 2]-adj;

        x 0 2 3
    } x;

    {[x;OP]
        stack: x 0;
        bitlen: x 1;
        oplen: x 2;
        while[1<count stack;
            i: last where -11=type each stack;
            b: oplen i;
            sbCnt: $[b<0;abs b;1+first where b=sums (i+1)_bitlen];
            sb: stack@i+1+til sbCnt;
            num: (OP stack i) sb;
            stack: (i#stack), num, (1+i+count sb)_stack;
            bitlen: (i#bitlen), sum[bitlen i+til 1+count sb], (1+i+count sb)_bitlen;
            oplen: (i#oplen), 0, (1+i+count sb)_oplen;
        ];
        `long$first stack
    }[x;`0`1`2`3`5`6`7!(sum;prd;min;max;((>).);((<).);((=).))]

 };

//------------------------------------
//Task 17
.aoc2021.d17.t1: {
    max raze {
        stop: {(y[2]<=x[1])&y[3]>=x[2]}[x];
        {$[any (y[;2] within 2#x) and (y[;3] within -2#x);max y[;3];0N]}[x]
        stop{(x[0]-signum x 0;-1+x 1;sum x 0 2;sum x 1 3)}\(y,z,0,0)
    }[x]'[til 1+x 1]'[(0&x 2) + til 1+(x[1]|x[2])-(0&x 2)]
 };


.aoc2021.d17.t2: {
    (sum/) {
        stop: {(y[2]<=x[1])&y[3]>=x[2]}[x];
        {any (y[;2] within 2#x) and (y[;3] within -2#x)}[x]
        stop{(x[0]-signum x 0;-1+x 1;sum x 0 2;sum x 1 3)}\(y,z,0,0)
    }[x]'[til 1+x 1]'[(0&x 2) + til (x[1]|x[2])-(0&x 2)]
 };


//------------------------------------
//Task 18
.aoc2021.d18.explode: {
    levels: x 0;
    nums: x 1;
    i: first where 4=levels;
    if[null i; :x];
    N: count nums;
    if[i>0; nums[i-1]+:nums@i];
    if[i<N-2; nums[i+2]+:nums@i+1];
    nums: (i#nums),0,(i+2)_nums;
    levels: (i#levels),3,(i+2)_levels;
    (levels;nums)
 };


.aoc2021.d18.split: {
    levels: x 0;
    nums: x 1;
    i: first where nums>9;
    if[null i;:x];
    n1: floor 0.5*nums i;
    n2: nums[i]-n1;
    nums: (i#nums),n1,n2,(i+1)_nums;
    levels: (i#levels),(2#1+levels@i),(i+1)_levels;
    (levels;nums)
 };


.aoc2021.d18.process: {{.aoc2021.d18.split .aoc2021.d18.explode over x} over x};


.aoc2021.d18.parseLine: {
    -2#{0<count x 0}{
        line: x 0;
        level: x 1;
        levels: x 2;
        nums: x 3;
        c: first line;
        if[c="[";level+:1];
        if[c="]";level-:1];
        if[not c in "][,";levels,:level;nums,:"J"$c];
        (1_line;level;levels;nums)
    }/(x;-1;`long$();`long$())
 };


.aoc2021.d18.magnitude: {
    first last {1<count first x}{
    l: x 0;
    n: x 1;
    i: first where 0=1_deltas l;
    n: (i#n),(sum (n@i+0 1)*3 2),(i+2)_n;
    l: (i#l),(-1+l@i),(i+2)_l;
    (l;n)}/x
 };


.aoc2021.d18.t1: {.aoc2021.d18.magnitude {.aoc2021.d18.process 1 0+x,'y} over .aoc2021.d18.parseLine each "\n" vs x};
.aoc2021.d18.t2: {
    x: .aoc2021.d18.parseLine each "\n" vs x;
    x: 2 cut'x cross x;
    x: x where not x[;0]~'x[;1];
    max .aoc2021.d18.magnitude each {.aoc2021.d18.process 1 0+x[0],'x[1]} each x
 };


//------------------------------------
//Task 20
.aoc2021.d20.common: {[x;T]
    x: "\n\n" vs x;
    a: `u#where "#"=first x;
    p: where each "#"="\n" vs last x;
    S: max (count p;max last each p);
    p: `u#raze til[count p] cross' p;
    g: {x cross x} (neg 4*T)+til S + 1+8*T;
    do[T; p: `u#g where ({2 sv (y+/:(-1 -1;-1 0;-1 1;0 -1;0 0;0 1;1 -1;1 0; 1 1)) in x}[p] each g) in a];
    sum all each p within (-2*T;S+2*T)
 };


.aoc2021.d20.t1: .aoc2021.d20.common[;2];
.aoc2021.d20.t2: .aoc2021.d20.common[;50];


//------------------------------------
//Task 22
.aoc2021.d22.common: {[x;region]
    x: "\n" vs x;
    x: {x: " " vs x; (x[0] like "on"; "J"$".." vs/: last each "="vs/:"," vs x 1)} each x;
    x: x where all each all each x[;1] within region;

    gubeDifference: {
        if[(any y[;0]>x[;1])|any y[;1]<x[;0]; :enlist x];
        x1: x 0;
        y1: x 1;
        z1: x 2;
        if[(not y[0][0]=x[0][0])&y[0][0] within x 0; x1,: y[0][0]-1 0];
        if[(not y[0][1]=x[0][1])&y[0][1] within x 0; x1,: y[0][1]+0 1];
        x1: asc x1 where x1 within x 0;
        if[(not y[1][0]=x[1][0])&y[1][0] within x 1; y1,: y[1][0]-1 0];
        if[(not y[1][1]=x[1][1])&y[1][1] within x 1; y1,: y[1][1]+0 1];
        y1: asc y1 where y1 within x 1;
        if[(not y[2][0]=x[2][0])&y[2][0] within x 2; z1,: y[2][0]-1 0];
        if[(not y[2][1]=x[2][1])&y[2][1] within x 2; z1,: y[2][1]+0 1];
        z1: asc z1 where z1 within x 2;
        x: 2 cut/: (cross/) 2 cut/:(x1;y1;z1);
        x: x where not {all all x within' y}[;y] each x;
        x
    };

    qubes: ();
    while[0<count x;
        qube: first x;
        on: qube 0;
        qube: qube 1;
        qubes: raze gubeDifference[;qube] each qubes;
        if[on; qubes,:enlist qube];
        x: 1_x
    ];

    sum {prd 1+last each deltas each x} each qubes

 };


.aoc2021.d22.t1: .aoc2021.d22.common[;-50 50];
.aoc2021.d22.t2: .aoc2021.d22.common[;-0W 0W];