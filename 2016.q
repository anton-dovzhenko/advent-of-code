//------------------------------------
//Task 1
.aoc.d1.t1: {
    endBlock: {[x;y]
        dir: x 1;
        turn: `$y 0;
        dir: $[turn=`R;(`N`E`S`W!`E`S`W`N)dir;(`N`W`S`E!`W`S`E`N)dir];
        s: "J"$1_y;
        (x[0]+s * (`N`E`S`W!(1 0;0 1;-1 0;0 -1))dir; dir)
    }over enlist[(0 0;`N)],", "vs x;
    sum abs endBlock[0]
 };

.aoc.d1.t2: {
    dots: {[x;y]
        dir: x 1;
        turn: `$y 0;
        dir: $[turn=`R;(`N`E`S`W!`E`S`W`N)dir;(`N`W`S`E!`W`S`E`N)dir];
        s: "J"$1_y;
        (x[0]+s * (`N`E`S`W!(1 0;0 1;-1 0;0 -1))dir; dir)

    } scan enlist[(0 0;`N)],", "vs x;
    dots: dots[;0];
    lines: raze {1_{x cross y} . x+signum[y-x]*til each 1+abs y-x}'[-1 _ dots; 1 _ dots];
    lines: group lines;
    sum abs key[lines]@first where 1<count each value lines
 };


//------------------------------------
//Task 2
.aoc.d2.t1: {
    x,: "\n";
    x: {[x;y]
        point: x 0;
        if[y~"\n";:(point; x[1], enlist point);];
        nextPoint: point + ("RLUD"!(0 1;0 -1;-1 0;1 0))y;
        $[all nextPoint within 0 2
            ; (nextPoint;x 1)
            ; (point; x 1)
        ]
    } over enlist[(1 1;())], x;
    raze string sum each (0 1) +/: x[1] * \: (3 1)
 };


.aoc.d2.t2: {
    x,: "\n";
    x: {[x;y]
        point: x 0;
        if[y~"\n";:(point; x[1], enlist point);];
        nextPoint: point + ("RLUD"!(0 1;0 -1;-1 0;1 0))y;
        $[nextPoint in (0 2; 1 1; 1 2; 1 3; 2 0; 2 1; 2 2; 2 3; 2 4; 3 1; 3 2; 3 3; 4 2)
            ; (nextPoint;x 1)
            ; (point; x 1)
        ]
    } over enlist[(2 0;())], x;
    ((0 2; 1 1; 1 2; 1 3; 2 0; 2 1; 2 2; 2 3; 2 4; 3 1; 3 2; 3 3; 4 2)!"123456789ABCD")x 1
 };


//------------------------------------
//Task 3
.aoc.d3.parseInput: {
 -1_{x where not null x} each "J"$"  " vs/: "\n" vs x
 };


.aoc.d3.t1: {
    x: .aoc.d3.parseInput x;
    sum {x: asc x; x[2]<x[0]+x[1]} each x
 };


.aoc.d3.t2: {
    x: .aoc.d3.parseInput x;
    sum {x: asc x; x[2]<x[0]+x[1]} each raze flip each 3 cut x
 };

//------------------------------------
//Task 4
.aoc.d4.t1: {
    x: "\n" vs x;
    sum {
        x: "-" vs x;
        w: raze -1 _ x;
        ID: "J"$first "[" vs last x;
        checksum: -1_last "[" vs last x;
        w: {desc (key x)!((neg `long$key[x])+1000*count each value x)}group w;
        real: checksum~5#key w;
        real*ID
    } each x
 };


.aoc.d4.t2: {
    x: "\n" vs x;
    words: flip `w`ID ! flip {
        x: "-" vs x;
        w: raze -1 _ x;
        ID: "J"$first "[" vs last x;
        checksum: -1_last "[" vs last x;
        w: {desc (key x)!((neg `long$key[x])+1000*count each value x)}group w;
        real: checksum~5#key w;
        $[real
        ;[
            x: " " sv -1 _ x;
            x: {$[x=" ";x;`char$97+((-97+`long$x)+y) mod 26]}[;ID] each x;
            (x;ID)]
        ;("";0N)]
    } each x;
    select from words where not null ID, w like "northpole object storage"
 };


//------------------------------------
//Task 5
.aoc.d5.t1: {
    password: "";
    i: 0;
    while[8>count password;
        if[(md: raze string md5 phrase,string i) like "00000*"; password,: md 5];
        i+:1
    ];
    password
 };


.aoc.d5.t2: {
    password: 8#" ";
    i: 0;
    while[0<sum password=" ";
        if[(md: raze string md5 x,string i) like "00000*";
            if[md[5] in "01234567";
                if[" "=password@"J"$md[5]; password["J"$md 5]: md 6]]];
        i+:1
        ];
    password
 };


//------------------------------------
//Task 6
.aoc.d6.t1: {
    raze {key[x] where min[i]=i:count each value x}each group each flip"\n" vs x
 };

.aoc.d6.t2: {
    raze {key[x] where max[i]=i:count each value x}each group each flip"\n" vs x
 };


//------------------------------------
//Task 7
.aoc.d7.t1: {
    x: "\n" vs x;
    sum {
        x: raze"]" vs/:"[" vs x;
        x: where {any {(x[y]=x[y+3])&(x[y+1]=x[y+2])&(x[y]<>x[y+1])}[x] each til 0|-3+count x} each x;
        (any mod[x;2]=0)& not any mod[x;2]=1
    } each x
 };


.aoc.d7.t2: {
    x: "\n" vs x;
    sum {
        x: raze"]" vs/:"[" vs x;
        x1: x@2*til `long$0.5*count x;
        x2: x@1+2*til `long$0.5*count x;
        aba: {where ((-2_x)=2_x)&(-2_x)<>1_-1_x};
        x1: raze {[aba;x] i:aba x; (x@i),'x@i+1}[aba]each x1;
        x2: raze {[aba;x] i:aba x; (x@i+1),'x@i}[aba]each x2;
        0<count x1 inter x2
    } each x
 };


//------------------------------------
//Task 8
.aoc.d8.t1: {
   x: "\n" vs x;
   actions:  {
        if[x like "rect*"; :({x[til z;til y]: not x[til z;til y]; x};"J"$"x" vs (count"rect ")_x)];
        if[x like "rotate row*"; :({x[y]: neg[z] rotate x[y]; x};"J"$"by" vs (count"rotate row y=")_x)];
        if[x like "rotate column*"; :({x[;y]: neg[z] rotate x[;y]; x};"J"$"by" vs (count"rotate column x=")_x)];
        '"[IllegalArgumentException]"
    } each x;
    m: 50 cut (6 * 50)#0b;
    sum sum each {y[0] . (enlist[x],y[1])}over(enlist[m], actions)
 };


.aoc.d8.t2: {
   x: "\n" vs x;
   actions:  {
        if[x like "rect*"; :({x[til z;til y]: not x[til z;til y]; x};"J"$"x" vs (count"rect ")_x)];
        if[x like "rotate row*"; :({x[y]: neg[z] rotate x[y]; x};"J"$"by" vs (count"rotate row y=")_x)];
        if[x like "rotate column*"; :({x[;y]: neg[z] rotate x[;y]; x};"J"$"by" vs (count"rotate column x=")_x)];
        '"[IllegalArgumentException]"
    } each x;
    m: 50 cut (6 * 50)#0b;
    "\n"sv (01b!"~#") {y[0] . (enlist[x],y[1])}over(enlist[m], actions)
 };


//------------------------------------
//Task 10
//bots are marked with same number: key 1 corresponds to bot 1
//bins are marked with (-1 - number): key -1 corresponds to bin 0, key -2 to bin 1 etc.
.aoc.d10.parse: {[data]
    parsed: {
        $["bot"~x 0;
            (`r; "J"$x 1; {i: "J"$x 6 11; isBot: "bot"~/:x 5 10; ?[isBot;i; -1+neg i]}x);
            (`b;"J"$x 5;"J"$x 1)
        ]
    } each " " vs/:"\n" vs data;
    rules: (!) . flip 1_'parsed where parsed[;0]=`r;
    bots: {g: group x 0; key[g]! (x 1)@/:value g}flip 1_'parsed where parsed[;0]=`b;
    bins: (::) _ enlist[]!enlist(::);
    (rules;bots;bins)
 };


//Example: .aoc.d15.t1[data;17 61]
.aoc.d10.t1: {[data;target]
    state: .aoc.d10.parse data;
    rules: state 0;
    bots: state 1;
    bins: state 2;
    target: asc target;

    while[
        (not null b:(key bots)@first where 2=count each value bots)&not target in asc each value bots;
        r: rules@b;
        $[-1 < r 0;
            [if[not r[0] in key bots; bots[r 0]: ()]; bots[r 0]: bots[r 0], min bots b];
            [if[not r[0] in key bins; bins[r 0]: ()]; bins[r 0]: bins[r 0], min bots b]
        ];
        $[-1 < r 1;
            [if[not r[1] in key bots; bots[r 1]: ()]; bots[r 1]: bots[r 1], max bots b];
            [if[not r[1] in key bins; bins[r 1]: ()]; bins[r 1]: bins[r 1], max bots b]
        ];
        bots[b]: ();
    ];
    (key bots)@first where target~/:asc each value bots
 };


//Example: .aoc.d10.t2[data;0 1 2]
.aoc.d10.t2: {[data;outputPrd]
    state: .aoc.d10.parse data;
    rules: state 0;
    bots: state 1;
    bins: state 2;

    while[
        not null b:(key bots)@first where 2=count each value bots;
        r: rules@b;
        $[-1 < r 0;
            [if[not r[0] in key bots; bots[r 0]: ()]; bots[r 0]: bots[r 0], min bots b];
            [if[not r[0] in key bins; bins[r 0]: ()]; bins[r 0]: bins[r 0], min bots b]
        ];
        $[-1 < r 1;
            [if[not r[1] in key bots; bots[r 1]: ()]; bots[r 1]: bots[r 1], max bots b];
            [if[not r[1] in key bins; bins[r 1]: ()]; bins[r 1]: bins[r 1], max bots b]
        ];
        bots[b]: ();
    ];
    prd first each bins@-1+neg outputPrd
 };


//------------------------------------
//Task 12
.aoc.d12.common: {[data;r]
    data: "\n" vs data;
    i: 0;

    while[
        i<count data;
        cmd: " " vs data@i;
        if["inc"~cmd 0;r[first cmd 1]:r[first cmd 1] + 1];
        if["dec"~cmd 0;r[first cmd 1]:r[first cmd 1] - 1];
        if["cpy"~cmd 0;r[first cmd 2]: $[(first cmd 1) in key r;r[first cmd 1];"J"$cmd 1]];
        $["jnz"~cmd 0; i: i + $[(r[first cmd 1]=0)|0="J"$first cmd 1;1;"J"$cmd 2]; i:i+1];
        //0N!(i;r;cmd);
    ];

    r"a"
 };

.aoc.d12.t1: .aoc.d12.common[;"abcd"!4#0];
.aoc.d12.t2: .aoc.d12.common[;"abcd"!0 0 1 0];


//------------------------------------
//Task 13
.aoc.d13.isOpen: {[x;y] 0=mod[sum 2 vs y+(x[0]*x[0])+(3*x[0])+(2*x[0]*x[1])+x[1]+x[1]*x[1];2]};
.aoc.d13.nextPositions: {[x;number;paths]
    orig: x;
    x: x+/:(0 1; 1 0; 0 -1; -1 0);
    x: x where .aoc.d13.isOpen[;number] each x;
    x: x where not x in key paths;
    x: x where all each x>=0;
    x!(count x)#first 1+paths orig
 };

.aoc.d13.t1: {[number;target]
    paths: enlist[1 1]!enlist 0;
    positions: enlist 1 1;
    while[not target in key paths;
        result: raze .aoc.d13.nextPositions[;number;paths] each positions;
        paths: paths, result;
        positions: key result;
    ];
    paths target
 };


.aoc.d13.t2: {[number;stepCount]
    paths: enlist[1 1]!enlist 0;
    positions: enlist 1 1;
    do[stepCount;
        result: raze .aoc.d13.nextPositions[;number;paths] each positions;
        paths: paths, result;
        positions: key result;
    ];
    count paths
 };


//------------------------------------
//Task 19
.aoc.d19.t1: {
    first {
        i: til count x;
        odd: mod[count x;2] = 1;
        x: x where mod[i;2] = 0;
        $[odd;last[x],-1_x;x]
    } over 1+til x
 };


// Idea is to always keep available elements split in 2.
// Where first half starting from active element goes to first queue, and rest to second.
.aoc.d19.t2: {
    x: 1 + til x;
    l: ceiling 0.5*count x;
    x1: l#x;
    x2: l _ x;
    s1: 0;
    s2: 0;
    while[1<count[x1]-s1;
        $[(count[x1]-s1)>count[x2]-s2;
            [
                x1[-1+count x1]: x2[s2];
                x2 ,: x1[s1];
                s1 +: 1;
                s2 +: 1;

            ];
            [
                s2 +: 1;
                x1 ,: x2[s2];
                s2 +: 1;
                x2 ,: x1[s1];
                s1 +: 1
            ];
        ]
    ];
    last x1
 };


//------------------------------------
//Task 20
.aoc.d20.getBlackList: {
   x: "J"$"-"vs/:"\n" vs x;
   1_{
       l: last x;
       $[y[0] <= l[1]+1
           ; x[-1+count x;1]: y[1] | l[1]
           ; x,: enlist y
       ];
       x
   } over (enlist enlist -0W -0W),asc x
 };



.aoc.d20.t1: {
    bl: .aoc.d20.getBlackList x;
    bl[0;1]+1
 };


.aoc.d20.t2: {
    bl: .aoc.d20.getBlackList x;
    4294967296 - (last deltas sum bl)+count bl
 };

