//------------------------------------
//Task 1
.aoc2017.d1.t1: {sum x where 0=deltas x: "J"$/:x,x 0};
//N.B. 0 is prepended to list to avoid issues with empty lists
.aoc2017.d1.t2: {sum 0,"J"$/:x where x=(`int$.5*count x)rotate x};

//------------------------------------
//Task 2
.aoc2017.d2.t1: {sum {max[x]-min x} each "J"$"\t" vs/:"\n" vs x};
.aoc2017.d2.t2: {`long$sum raze{x where {(x=`int$x)&x<>1}x:raze x%/:x} each x:"J"$"\t" vs/:"\n" vs x};


//------------------------------------
//Task 3
.aoc2017.d3.t1: {
    c: 0.5*-1+{$[0=x mod 2;x-1;x]}floor sqrt x-1;
    c1:c1*c1:(1+2*c);
    c2:c2*c2:(1+2*c+1);
    side: 0.25*c2-c1;
    r: (x-c1+1) mod side;
    `long$0^c+1+abs r-(-1+0.5*side)

 };


.aoc2017.d3.getNextKeys: {
    l: last x;
    n:(l[0]-til y),\:l[1]+1;
    l: last n;
    n,: l[0],/:l[1]-1+til y;
    l: last n;
    n,: (l[0]+1+til y),\:l[1];
    l: last n;
    n,: l[0],/:l[1]+1+til y;
    n
 };


.aoc2017.d3.resolveValues: {.tmp.dict[x]: sum .tmp.dict x+/:(0 1; -1 1; -1 0; -1 -1; 0 -1; 1 -1; 1 0; 1 1)};


.aoc2017.d3.t2: {[x]
    .tmp.dict: enlist[0 0]!enlist 1;
    size: 2;
    while[x>max value .tmp.dict;
        .aoc2017.d3.resolveValues each .aoc2017.d3.getNextKeys[key .tmp.dict;size];
        size+: 2
    ];
    result: {i:x binr y; x@$[y=x@i;i+1;i]}[value .tmp.dict;x];
    delete dict from `.tmp;
    result
 };


//------------------------------------
//Task 4
.aoc2017.d4.t1: {`long$sum (count each distinct each x)=count each x:" " vs/:"\n" vs x};
.aoc2017.d4.t2: {`long$sum {all 1>=count each group asc each " " vs x} each "\n" vs x};


//------------------------------------
//Task 5
.aoc2017.d5.t1: {[offsets]
    offsets: "J"$"\n" vs offsets;
    p: 0; //pointer
    steps: 0;
    while[p within (0;-1+count offsets);
        np: p+offsets p; //nextPointer
        offsets[p]+: 1;
        p: np;
        steps+: 1;
    ];
    steps
 };


.aoc2017.d5.t2: {[offsets]
    offsets: "J"$"\n" vs offsets;
    p: 0; //pointer
    steps: 0;
    while[p within (0;-1+count offsets);
        offset: offsets p;
        np: p+offset; //nextPointer
        offsets[p]+: $[offset>=3;-1;1];
        p: np;
        steps+: 1;
    ];
    steps
 };


//------------------------------------
//Task 6
.aoc2017.d6.t1: {
    L: count x;
    mult: `long$reverse 10 xexp til L;
    conf: sum x * mult;
    cache: `u#0#0N;
    while[not conf in cache;
        cache,: conf;
        i: first where x=max x;
        v: x@i;
        x[i]: 0;
        x: x + floor v%L;
        x[(1+i+til mod[v;L]) mod L]+: 1;
        conf: sum x * mult;
    ];
    count cache
 };


.aoc2017.d6.t2: {
    L: count x;
    mult: `long$reverse 10 xexp til L;
    conf: sum x * mult;
    cache: `u#0#0N;
    seen: 0N;
    while[not conf=seen;
        if[(null seen)&conf in cache; seen: conf; seenIter: count cache];
        cache,: conf;
        i: first where x=max x;
        v: x@i;
        x[i]: 0;
        x: x + floor v%L;
        x[(1+i+til mod[v;L]) mod L]+: 1;
        conf: sum x * mult;
    ];
    count[cache]-seenIter
 };


//------------------------------------
//Task 7
.aoc2017.d7.t1: {
    x: (!) . flip{x: " -> " vs x; (`$first " " vs x 0;$[1<count x;`$", "vs x 1;0#`])} each "\n" vs x;
    first key {
        if[1=count x;:x];
        del: key[x]@where 0=count each value x;
        x: del _ x;
        x: key[x]! {y except x}[del] each value x;
        x
    }/[x]
 };


.aoc2017.d7.t2: {

    graph: (!) . flip{x: " -> " vs x; (`$first " " vs x 0;$[1<count x;`$", "vs x 1;0#`])} each "\n" vs x;
    weights: {(`$x 0)!"J"$x 1}flip{ " (" vs first ")" vs x}each  "\n" vs x;

    // get root and cummulated weights
    tuple: {
        g: x 0;
        w: x 1;
        if[1=count g;:(g;w)];
        del: key[g]@where 0=count each value g;
        g: del _ g;
        w[key g]+:sum each (del#w)@/:(value g);
        g: key[g]! {y except x}[del] each value g;
        (g;w)

    }/[(graph;weights)];

    root: first key tuple 0;
    weightCum: tuple 1;

    // get node to balance and un-balanced weight
    tuple: {[g;w;r;d]
        children: g@r;
        cw: w@children;
        if[1=count distinct cw;:(r;d)];
        r: children first(value cw)@first where 1 =count each value cw: group cw;
        d: (w@first children except r)-w@r;
        .z.s[g;w;r;d]
    }[graph;weightCum;root;0];

     weights[tuple 0]+tuple 1

 };


//------------------------------------
//Task 8
.aoc2017.d8.t1: {
    .tmp.dict: (0#`)!0#0N;
    {
        x: " "vs x;
        v: `$x 0;
        mult: $["inc"~x 1;1;-1];
        i: "J"$x 2;
        //Other way to evaluate if clause
        //if[comp~"==";comp: "="];
        //if[comp~"!=";comp: "<>"];
        //clause: eval parse string[0^.tmp.dict`$x 4], comp, x 6;
        clause: (first((`$("<";">";">=";"<=";"==";"!="))!({x<y};{x>y};{x>=y};{x<=y};{x=y};{not x=y})) `$x 5) . (0^.tmp.dict`$x 4;"J"$x 6);
        if[clause;.tmp.dict[v]+:mult*i];
    } each "\n" vs x;
    m: max .tmp.dict;
    delete dict from `.tmp;
    m
 };


.aoc2017.d8.t2: {
    .tmp.dict: (0#`)!0#0N;
    .tmp.maxVal: 0;
    {
        x: " "vs x;
        v: `$x 0;
        inc: $["inc"~x 1;1;-1]*"J"$x 2;
        clause: (first((`$("<";">";">=";"<=";"==";"!="))!({x<y};{x>y};{x>=y};{x<=y};{x=y};{not x=y})) `$x 5) . (0^.tmp.dict`$x 4;"J"$x 6);
        if[clause;.tmp.dict[v]+: inc; .tmp.maxVal: .tmp.maxVal|.tmp.dict[v]];
    } each "\n" vs x;
    m: .tmp.maxVal;
    delete dict, maxVal from `.tmp;
    m
 };


//------------------------------------
//Task 9
.aoc2017.d9.t1: {
    x: x where 0=1_{$[x=1;2;$[y="!";1;0]]} scan (0,x);
    x: x where 0=1_{$[x=1;$[y=">";2;1];$[y="<";1;0]]} scan (0,x);
    last {
        if[y="{";x[0]+:1];
        if[(y="}")&x[0]>0;x[1]+:x[0];x[0]-:1];
        x
    }over enlist[(0;0)], x
 };


.aoc2017.d9.t2: {
    x: x where 0=1_{$[x=1;2;$[y="!";1;0]]} scan (0,x);
    x: 1_{$[x=1;$[y=">";2;1];$[y="<";1;0]]} scan (0,x);
    (sum x>0)-2*sum x=2
 };


//------------------------------------
//Task 10
.aoc2017.d10.getList: {[size;steps]
    x: til size;
    skip: 0;
    i: 0;
    while[0<count steps;
        s: first steps;
        indices: (i + til s) mod size;
        x[indices]: x reverse indices;
        i: i + s + skip;
        skip+: 1;
        steps: 1 _ steps;
    ];
    x
 };


.aoc2017.d10.t1: {[size;steps]
    prd 2#.aoc2017.d10.getList[size;"J"$","vs steps]
 };


.aoc2017.d10.t2: {[size;steps]
    x: .aoc2017.d10.getList[size;raze 64#enlist(`long$steps), 17 31 73 47 23];
    x: 16 cut x;
    x: {2 sv {x mod 2} sum {((8-count x)#0),x} each 2 vs/:x} each x;
    x: raze(raze(string til 10), 6#.Q.a) -2#'0,/:16 vs/:x;
    x
 };


//------------------------------------
//Task 11
.aoc2017.d11.t1: {
    x: `$"," vs x;
    d: `n`ne`se`s`sw`nw!(0 -1 1;1 -1 0;1 0 -1;0 1 -1;-1 1 0;-1 0 1);
    max abs sum d@x
 };


.aoc2017.d11.t2: {
    x: `$"," vs x;
    d: `n`ne`se`s`sw`nw!(0 -1 1;1 -1 0;1 0 -1;0 1 -1;-1 1 0;-1 0 1);
    max max each abs flip sums each flip d@x
 };


//------------------------------------
//Task 12
.aoc2017.d12.t1: {
    x: (!). flip{x:"J"$", " vs/:" <-> " vs x; (first x 0; x 1)}each "\n" vs x;
    count[x] - count first {(x[1] _ x[0];raze x[0] x[1])}/[(x;0)]
 };


.aoc2017.d12.t2: {
    x: (!). flip{x:"J"$", " vs/:" <-> " vs x; (first x 0; x 1)}each "\n" vs x;
    groupCnt: 0;
    while[0<count x; x: first {(x[1] _ x[0];raze x[0] x[1])}/[(x;enlist first key x)];groupCnt+:1];
    groupCnt
 };


//------------------------------------
//Task 13
.aoc2017.d13.t1: {
    x: "J"$": " vs/:"\n" vs x;
    sum prd each x where {{x=`int$x}x[0]%2*x[1]-1} each x
 };


.aoc2017.d13.t2: {
    x: flip "J"$": " vs/:"\n" vs x;
    delay: -1;
    s: 1;
    while[s<>0;
        delay+:1;
        s: sum{{x=`int$x}(x[0]+y)%2*x[1]-1}[x;delay];
    ];
    delay
 };


//------------------------------------
//Task 14
.aoc2017.d14.common: {{raze -4#'(3#0),/:2 vs/:("0123456789abcdef"!til 16).aoc2017.d10.t2[256;x,"-",y]}[x] each string til 128};


.aoc2017.d14.t1: {
    sum sum .aoc2017.d14.common x
 };


.aoc2017.d14.t2: {
    x: .aoc2017.d14.common x;
    x: raze (til count x)(,/:)'where each x;
    last {0<count x 0}{
        if[0=count x 1; :(-1 _ x 0;enlist last x 0;1+x 2)];
        n:  distinct raze (x 1)+/:\:(0 1;1 0;0 -1;-1 0); //neighbourhood
        n: (x 0) inter n;
    ((x 0) except n;n;x 2)
    }/(x;();0)
 };



//------------------------------------
//Task 15
.aoc2017.d15.t1: {[v1;v2;p1;p2]
    matched: 0;
    do[40000000;
        v1: mod[v1 * p1; 2147483647];
        v2: mod[v2 * p2; 2147483647];
        matched+: mod[v1;65536] = mod[v2;65536]
    ];
    matched
 };


.aoc2017.d15.t2: {[v1;v2;p1;p2]
    matched: 0;
    do[5000000;
        v1: mod[p1 * v1;2147483647];
        v2: mod[p2 * v2;2147483647];
        while[0<>v1 mod 4; v1: mod[p1 * v1;2147483647]];
        while[0<>v2 mod 8; v2: mod[p2 * v2;2147483647]];
        matched+: mod[v1;65536] = mod[v2;65536]
    ];
    matched
 };


//------------------------------------
//Task 16
.aoc2017.d16.nextOrder: {[p;cmd]
    swap: {tmp: x y 0; x[y 0]: x y 1; x[y 1]: tmp; x};

    if["s"=cmd 0; :{(count[x]-y) rotate x}[p;"I"$1_cmd]];
    if["x"=cmd 0; :swap[p;"J"$"/" vs 1_cmd]];
    if["p"=cmd 0; :swap[p;p?"/" vs 1_cmd]];
    '"[Illegal Command] ", cmd
 };

//@x - original order
//@y - comma delimited commands
.aoc2017.d16.t1: {.aoc2017.d16.nextOrder over enlist[x], "," vs y};


//@x - original order
//@y - comma delimited commands
.aoc2017.d16.t2: {
    cmds: "," vs y;
    //check how many cycles are required to return to initial order
    danceCycle: 0;
    initOrder: x;
    order: initOrder;
    flag: 1b;
    while[flag;
        order: .aoc2017.d16.nextOrder over enlist[order], cmds;
        danceCycle +: 1;
        flag: not order~initOrder;
    ];
    //dance remainder after last cycle
    toDance: 1000000000 mod danceCycle;
    do[toDance;
        initOrder: .aoc2017.d16.nextOrder over enlist[initOrder], cmds
    ];
    initOrder
 };


//------------------------------------
//Task 17
.aoc2017.d17.t1: {
    n: 0;
    d: (`g#til 2018)!2018#0;
    do[2017;
        c: x(d@)/n;
        d[n+1]: d[c];
        d[c]: n+1;
        n+:1
    ];
    d 2017
 };


.aoc2017.d17.t2: {[n] last where 1=first flip 50000000{[x;n] (1+(x[0]+n) mod x 1;1+x 1)}[;n]\(0;1)};


//------------------------------------
//Task 18
.aoc2017.d18.t1: {
    x: " "vs/:"\n"vs x;
    r: {x!(count x)#0}distinct x[;1];
    o: ("snd";"set";"add";"mul";"mod";"rcv";"jgz")!(
        {[r;i;s;p] (r;i+1;r@first p)};
        {[r;i;s;p] r[first p]: r[last p]^"I"$last p; (r;i+1;s)};
        {[r;i;s;p] r[first p]+: r[last p]^"I"$last p; (r;i+1;s)};
        {[r;i;s;p] r[first p]*: r[last p]^"I"$last p; (r;i+1;s)};
        {[r;i;s;p] r[first p]: r[first p] mod r[last p]^"I"$last p; (r;i+1;s)};
        {[r;i;s;p] s};
        {[r;i;s;p] (r;i+$[0<r first p;r[last p]^"I"$last p;1];s)}
    );
    {1<count x}{[o;x;y]
        r: y 0;
        i: y 1;
        s: y 2;
        cmd: o@x[i;0];
        p: 1 _ x[i];
        cmd . (r;i;s;p)
        }[o;x]/(r;0;0)

 };


.aoc2017.d18.t2: {
    x: " "vs/:"\n"vs x;
    r0: "123456789-"_{x!(count x)#0}raze distinct x[;1];
    r1: r0;
    r0["p"]: 0;
    r1["p"]: 1;
    o: ("snd";"set";"add";"mul";"mod";"rcv";"jgz")!(
        {[r;i;s;q;p] (r;i+1;r[first last p]^"I"$last p;q)};
        {[r;i;s;q;p] r[first p]: r[first last p]^"I"$last p; (r;i+1;0N;q)};
        {[r;i;s;q;p] r[first p]+: r[first last p]^"I"$last p; (r;i+1;0N;q)};
        {[r;i;s;q;p] r[first p]*: r[first last p]^"I"$last p; (r;i+1;0N;q)};
        {[r;i;s;q;p] r[first p]: r[first first p] mod r[first last p]^"I"$last p; (r;i+1;0N;q)};
        {[r;i;s;q;p] $[0=count q;(r;i;0N;q); [r[first first p]: first q; (r;i+1;0N;1 _ q)] ]};
        {[r;i;s;q;p] (r;i+$[0<r[first first p]^"I"$first p;r[first last p]^"I"$last p;1];0N;q)}
    );

    pr0: ();
    pr1: ();
    res0: (r0;0;0N;`long$());
    res1: (r1;0;0N;`long$());
    cnt: 0;

    while[not (pr0~res0)&(pr1~res1);
        pr0: res0;
        pr1: res1;
        res0: (o@x[res0 1;0]) . res0, enlist 1 _ x[res0 1];
        res1: (o@x[res1 1;0]) . res1, enlist 1 _ x[res1 1];
        if[not null res1 2; cnt+:1];
        if[not null res0 2; res1[3]: res1[3], res0 2];
        if[not null res1 2; res0[3]: res0[3], res1 2];
    ];
    cnt
};


//------------------------------------
//Task 19
.aoc2017.d19.common: {
    x: "\n" vs x;
    p: (0;first where "|"=first x); //position
    d: 1 0; //direction
    x: {[x;y]
        p: y 0;
        d: y 1;
        word: y 2;
        s: y 3;
        np: p + d;
        c: x@/np;
        if[c in .Q.A; word,: c];
        if[null c;:y];
        if["+"=c;
            pts: np+/:(0 1;0 -1;1 0;-1 0) except enlist neg d;
            pts: pts@first where not ({x@/y}[x] each pts)=" ";
            :(np;pts-np;word;s+1)];
        (np;d;word;s+1)
    }[x] over (p;d;"";1);
    x
 };


.aoc2017.d19.t1: {(.aoc2017.d19.common x)@2};
.aoc2017.d19.t2: {(.aoc2017.d19.common x)@3};


//------------------------------------
//Task 20
//FIXME: implement robust algorithm
//20th day solutions may fail depending on input.
.aoc2017.d20.t1: {
    x: "\n"vs x;
    x: "J"${","vs/:first each ">"vs/:last each "<"vs/:", " vs x}each x;
    first where {x=min x}sum each abs {[x;N] x[0] + (N*x[1])+(N*(1+N)%2)*x[2]}[;100000] each x
 };


.aoc2017.d20.t2: {
    x: "\n"vs x;
    x: "J"${","vs/:first each ">"vs/:last each "<"vs/:", " vs x}each x;
    x: x,'til count x;
    do[100000;
        x: {
            x[;1]+:x[;2];
            x[;0]+:x[;1];
            x: x where x[;0] in {{key[x] where  value x}1=count each group x}x[;0];
            x
        }x
    ];
    count x
 };


//------------------------------------
//Task 21
.aoc2017.d21.common: {[x;r;i]
    r: " => " vs/:"\n" vs r;
    r: flip {"/"vs/:x} each r;
    r[0]: {(x; reverse x; reverse each x; reverse reverse each x;
        flip x; flip reverse x; flip reverse each x; reverse each flip reverse each x)} each r 0;
    r: (!) . flip raze {(enlist each x 0),\: enlist x 1 } each flip r;
    x: "\n"vs x;
    `long$sum sum "#"=i{[x;r]
        c: $[0=(count x) mod 2;2;3];
        N: `long$(count x)%c;
        slices: raze flip each c cut c cut/:x;
        slices: r@slices;
        raze each raze (flip') N cut slices
     }[;r]/x
 };


.aoc2017.d21.t1: .aoc2017.d21.common[;;5];
.aoc2017.d21.t2: .aoc2017.d21.common[;;18];


//------------------------------------
//Task 22
.aoc2017.d22.t1: {[x;bursts]
    x: "#"="\n"vs x;
    s: {2#x}floor (count x)%2;
    x: raze {y,\:x}'[reverse til count x;where each x];
    dir: 0 1;
    L: (0 1;0 -1;1 0; -1 0)!(-1 0;1 0;0 1;0 -1);
    R: (0 1;0 -1;1 0; -1 0)!(1 0;-1 0;0 -1;0 1);
    last bursts {[L;R;X]
        s: X 0;
        d: X 1;
        x: X 2;
        n: X 3;
        infected: s in x;
        d: $[infected;R;L]@d;
        $[infected;x: x except enlist s;x,:enlist s];
        s+: d;
        (s;d;x;n+not infected)

     }[L;R]/(s;dir;x;0)
 };


.aoc2017.d22.t2: {[x;bursts]
    x: "#"="\n"vs x;
    s: {2#x}floor (count x)%2;
    x: raze {y,\:x}'[reverse til count x;where each x];
    .tmp.x: (`u#x)!(count x)#`I;
    dir: 0 1;
    L: (0 1;0 -1;1 0; -1 0)!(-1 0;1 0;0 1;0 -1);
    R: (0 1;0 -1;1 0; -1 0)!(1 0;-1 0;0 -1;0 1);
    result: last bursts {[L;R;X]
        s: X 0;
        d: X 1;
        n: X 2;
        status: .tmp.x@s;
        if[status=`I; d: R@d; .tmp.x[s]: `F];
        if[status in ``C; d: L@d; .tmp.x[s]: `W];
        if[status=`F; d: neg d; .tmp.x[s]: `C];
        if[status=`W; .tmp.x[s]: `I; n+:1];
        (s+d;d;n)
     }[L;R]/(s;dir;0);
    delete x from `.tmp;
    result
 };


//------------------------------------
//Task 23
.aoc2017.d23.t1: {
    x: " "vs/:"\n" vs x;
    r: (8#.Q.a)!8#0;
    i: 0;
    f: ("set";"sub";"mul";"jnz")!(
        {[r;p] r[first p 0]: ("J"$p 1)^r first p 1; (r;1)};
        {[r;p] r[first p 0]-: ("J"$p 1)^r first p 1; (r;1)};
        {[r;p] r[first p 0]*: ("J"$p 1)^r first p 1; (r;1)};
        {[r;p] x: ("J"$p 0)^r first p 0; (r; $[not x=0;("J"$p 1)^r first p 1;1]) }
    );
    cnt: 0;
    while[i < count x;
        cmd: x i;
        cnt+: "mul"~cmd 0;
        res: (f cmd 0)[r;raze each 1_cmd];
        r: res 0;
        i+: res 1;
    ];
    cnt
 };