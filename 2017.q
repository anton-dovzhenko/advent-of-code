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
.aoc2017.d10.t1: {[size;steps]

    list: first(count steps){
        L: x 0; // list
        sk: x 1; // skip
        st: first x 2; //steps
        L:(reverse st#L), st _ L;
        st: (sk+st) mod count L;
        L: (st _ L), st#L;
        (L;sk+1;1 _ x 2)

    }/(til size;0;steps);

    i: ((sum steps + til count steps) mod count list);
    prd 2#(neg i)#list

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


