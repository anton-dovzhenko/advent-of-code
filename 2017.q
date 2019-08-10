//------------------------------------
//Task 1
.aoc.d1.t1: {sum x where 0=deltas x: "J"$/:x,x 0};
.aoc.d1.t2: {sum"J"$/:x where x=(`int$.5*count x)rotate x};

//------------------------------------
//Task 2
.aoc.d2.t1: {sum {max[x]-min x} each x};
.aoc.d2.t2: {sum {$[null i:first where 0=mod[(1_x)%x 0;1]; .z.s 1_x; x[i+1]%x 0] } each asc each x};


//------------------------------------
//Task 3
.aoc.d3.t1: {
    c: 0.5*-1+{$[0=x mod 2;x-1;x]}floor sqrt x-1;
    c1:c1*c1:(1+2*c);
    c2:c2*c2:(1+2*c+1);
    side: 0.25*c2-c1;
    r: (x-c1+1) mod side;
    `long$0^c+1+abs r-(-1+0.5*side)

 };


.aoc.d3.getNextKeys: {
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


.aoc.d3.resolveValues: {.tmp.dict[x]: sum .tmp.dict x+/:(0 1; -1 1; -1 0; -1 -1; 0 -1; 1 -1; 1 0; 1 1)};


.aoc.d3.t2: {[x]
    .tmp.dict: enlist[0 0]!enlist 1;
    size: 2;
    while[x>max value .tmp.dict;
        .aoc.d3.resolveValues each .aoc.d3.getNextKeys[key .tmp.dict;size];
        size+: 2
    ];
    result: {i:x binr y; x@$[y=x@i;i+1;i]}[value .tmp.dict;x];
    delete dict from `.tmp;
    result
 };


//------------------------------------
//Task 4
.aoc.d4.t1: {sum {all 1>=count each group " " vs x} each x};
.aoc.d4.t2: {sum {all 1>=count each group asc each " " vs x} each x};


//------------------------------------
//Task 5
.aoc.d5.t1: {[offsets]
    offsets: "J"$offsets;
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


.aoc.d5.t2: {[offsets]
    offsets: "J"$offsets;
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
.aoc.d6.t1: {
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


.aoc.d6.t2: {
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
.aoc.d7.t1: {
    x: (!) . flip{x: " -> " vs x; (`$first " " vs x 0;$[1<count x;`$", "vs x 1;0#`])} each x;
    first key {
        if[1=count x;:x];
        del: key[x]@where 0=count each value x;
        x: del _ x;
        x: key[x]! {y except x}[del] each value x;
        x
    }/[x]
 };


.aoc.d7.t2: {

    graph: (!) . flip{x: " -> " vs x; (`$first " " vs x 0;$[1<count x;`$", "vs x 1;0#`])} each x;
    weights: {(`$x 0)!"J"$x 1}flip{ " (" vs first ")" vs x}each x;

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
.aoc.d8.t1: {
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
    } each x;
    m: max .tmp.dict;
    delete dict from `.tmp;
    m
 };


.aoc.d8.t2: {
    .tmp.dict: (0#`)!0#0N;
    .tmp.maxVal: 0;
    {
        x: " "vs x;
        v: `$x 0;
        inc: $["inc"~x 1;1;-1]*"J"$x 2;
        clause: (first((`$("<";">";">=";"<=";"==";"!="))!({x<y};{x>y};{x>=y};{x<=y};{x=y};{not x=y})) `$x 5) . (0^.tmp.dict`$x 4;"J"$x 6);
        if[clause;.tmp.dict[v]+: inc; .tmp.maxVal: .tmp.maxVal|.tmp.dict[v]];
    } each x;
    m: .tmp.maxVal;
    delete dict, maxVal from `.tmp;
    m
 };


//------------------------------------
//Task 9
.aoc.d9.t1: {
    x: x where 0=1_{$[x=1;2;$[y="!";1;0]]} scan (0,x);
    x: x where 0=1_{$[x=1;$[y=">";2;1];$[y="<";1;0]]} scan (0,x);
    last {
        if[y="{";x[0]+:1];
        if[(y="}")&x[0]>0;x[1]+:x[0];x[0]-:1];
        x
    }over enlist[(0;0)], x
 };


.aoc.d9.t2: {
    x: x where 0=1_{$[x=1;2;$[y="!";1;0]]} scan (0,x);
    x: 1_{$[x=1;$[y=">";2;1];$[y="<";1;0]]} scan (0,x);
    (sum x>0)-2*sum x=2
 };