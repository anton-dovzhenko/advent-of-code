//------------------------------------
//----- common
.aoc.common.range: {x[0]+til 1+x[1]-x[0]};

//------------------------------------
//Task 1.1
sum"J"$read0 hsym`$input.dir,"2018_1.input"
//Task 1.2
{
    x: x, last[x]+y;
    g: group x;
    i: (key g)@where 2<=count each value g;
    r: i#g;
    $[0=count i; .z.s[x;y]; (key r)@where value r[;1]=min r[;1]]
}[0;sums "J"$read0 hsym`$input.dir,"2018_1.input"]


//------------------------------------
//Task 2.1
{prd sum {2 3 in count each group x}each x}("abcdef";"bababc";"abbcde";"abcccd";"aabcdd";"abcdee";"ababab")
//Task 2.2 (brute force, should be Trie)
{first raze{
  d:0=last deltas`int$x 0 1;
  $[1=sum not d; enlist(x 0)@where d;()]
}each{x cross x}enlist each x}("abcde";"fghij";"klmno";"pqrst";"fguij";"axcye";"wvxyz")


//------------------------------------
//Task 3.1, 3.2
.aoc.parse:{x:-2#" " vs x;"J"$(","vs -1_x 0), "x" vs x 1};
.aoc.size: {max{(x[0]+x[2];x[1]+x[3])} each x};
data: .aoc.parse each data;
size: .aoc.size data;
count where 1<count each group raze {{(x[0]*size 0)+x 1}each (x 0 1) +/: til[x 2] cross til[x 3]}each data
(til count data) except {distinct raze exec id from select from x where 1<count each id}select id by data from ungroup update id: i from ([]{{(x[0]*size 0)+x 1}each (x 0 1) +/: til[x 2] cross til[x 3]}each data)


//------------------------------------
//Task 4
.aoc.d4.prepare: {
  x: `time xasc update time: {"P"$(string 400+"J"$x[0 1 2 3]),".",x[5 6],".",x[8 9],"D",x[11 12 13 14 15]} each 1_'17#'payload from ([]payload: x);
  x: update ID: "J"$first each" " vs/:26_'payload from x where payload like "*Guard*";
  x: update fills ID from x;
  x: update sleep: payload like "*asleep*"from x;
  x: update period: next[time]-time from x;
  x
};

.aoc.d4.addMm: {[time;period]
  ((`hh$time)+`int$`minute$time)+til each `long$0^(`long$1e-9*period)%60
 };

.aoc.d4.getStrategy1: {
  sleepyID: exec first ID from`period xdesc select sum period by ID from x where sleep;
  x: select from data where ID=sleepyID, sleep;
  x: update mm: .aoc.d4.addMm[time;period] from x;
  sleepyID*{key[x]@first where max[c]=c:count each value x}group raze x`mm
 };

.aoc.d4.getStrategy2: {
  x: select mm: {c:count each value x;m:max c;(key[x]@first where c=m;m)}group raze .aoc.d4.addMm[time;period] by ID from data where sleep;
  exec first ID*mm[;0]from x where mm[;1]=max mm[;1]
 };

.aoc.d4.getStrategy1 .aoc.d4.prepare read0 hsym`$input.dir,"2018_5.input";
.aoc.d4.getStrategy2 .aoc.d4.prepare read0 hsym`$input.dir,"2018_5.input";


//------------------------------------
//Task 5.1
0 0 4 6 10 ~
  {-1+count{$[32=abs y-last x;-1_x;x,y]} over 0N,`int$x}
  each ("aA";"abBA";"abAB";"aabAAB";"dabAcCaCBAcCcaDA");
//Task 5.2
0 0 0 0 4 ~
  {min {-1+count{$[32=abs y-last x;-1_x;x,y]} over 0N,`int$x} each {x except y, upper y}[x]each distinct lower distinct x}
  each ("aA";"abBA";"abAB";"aabAAB";"dabAcCaCBAcCcaDA");


//------------------------------------
//Task 6.1
.aoc.d6.t1: {
  x: "J"$", "vs/:x;
  range: flip (min x;max x);
  p: {x cross y} . .aoc.common.range each range;
  areas: raze {x: sum each abs x -\:y; x: where x=min x; $[1=count x;first x;()]}[x]'[p];
  max {key[x]!count each value x}group areas
 };

.aoc.d6.t2: {[x;y]
  x: "J"$", "vs/:x;
  range: flip (min x;max x);
  p: {x cross y} . .aoc.common.range each range;
  sum{z>sum sum abs x -\:y}[x;;y]'[p]
 };


//------------------------------------
//Task 7.1 (Topololical sort)
.aoc.topSort: {
  last{
    L: x@1;
    G: x@0;
    n: first asc distinct (first each G) except last each G;
    filtered: G where not G like n,"*";
    L,:n;
    if[0=count filtered; L,:asc distinct raze G[;1]];
    (filtered;L)
  }/[(x;())]
 };

.aoc.d7.parse: {{(last x@0;first x@1)}each " must be finished before step "vs/:x};

.aoc.d7.t1: {.aoc.topSort .aoc.d7.parse x};

//Task 7.2
.aoc.d7.t2: {
  data: .aoc.d7.parse x;
  sorted: .aoc.topSort data;
  .tmp.workers: y#0;
  .tmp.completed: sorted!count[sorted]#0;
  {
    c: .tmp.completed y;
    w: .tmp.workers?first w where w=max w:.tmp.workers where .tmp.workers<c;
    if[w=count .tmp.workers; w: .tmp.workers?first w where w=min w:.tmp.workers where .tmp.workers>=c];
    t: (.tmp.workers[w]|.tmp.completed y)+61+(`int$y)-`int$"A";
    .tmp.workers[w]: t;
    deps: distinct raze last each x where x like y,"*";
    .tmp.completed[deps]: .tmp.completed[deps]|t;
  }[data]each sorted;
  time: max .tmp.workers;
  delete workers from `.tmp;
  delete completed from `.tmp;
  time
};


//------------------------------------
//Task 8.1
.aoc.d8.t1: {
  x: "J"$" " vs x;
  first{
    s: x 0;
    tree: x 1;
    n: last tree;
    data: x 2;
    if[0=count data;:x];
    if[0<n 0; :(s;tree,enlist 2#data;2_data)];
    $[0=n 1
      ;(s;[tree: -1_tree; tree[-1+count tree]: last[tree] + (-1 0); tree];data)
      ;(s+sum(n 1)#data;[tree[-1+count tree]: 0 0; tree];(n 1)_data)
    ]
  }/[(0;enlist 2#x;2_x)]
};

.aoc.d8.t2: {
  x: "J"$" " vs x;
  {
    //0 - children, 1 - metadata, 2 - children processed, 3 - sum
    if[0>type x;:x];
    tree: x 0;
    n: last tree;
    data: x 1;

    s: $[0=n 0;sum(n 1)#data;$[0=n 2;sum(n 3)@-1+(n 1)#data;0N]];
    $[any 0= n 0 2
      ; [tree: -1_tree
        ; if[0=count tree; :s]
        ; tree[-1+count tree;3],: s
        ; tree[-1+count tree;2]-: 1
        ; (tree;(n 1)_data)
      ]
      ; (tree, enlist (data 0 1 0), enlist 0#0N;2_data)
    ]
  }/[(enlist(x 0;x 1;x 0; 0#0N);2_x)]
};


//------------------------------------
//Task 9.1
// Sub tasks 1 and 2 are same
// Absense of linked-list makes solution very slow
.aoc.d9.t1: {[players;lastMarble]
    .tmp.m: 0 2 1;
    .tmp.p: players#0;
    {
        //x@0 - active marble index
        //x@1 - next marble
        a: y 0;
        n: y 1;
        //logging progress
        if[0=n mod 10000;0N!n];

        if[n=x+1;:y];
        c: count .tmp.m;
        if[0=n mod 23
            ; del: (a-7) mod c
            ; .tmp.p[n mod count .tmp.p]+: .tmp.m[del]+n
            ; .tmp.m: (del#.tmp.m), (del+1)_.tmp.m
            ; a: del mod -1+c
            ; :(a;n+1)
        ];

        $[a=c-2
            ; [.tmp.m,:n; a: c]
            ; $[a=c-1
                ;[.tmp.m: .tmp.m[0],n,1_.tmp.m; a:1]
                ;[.tmp.m: ((a+2)#.tmp.m),n,(a+2)_.tmp.m; a: a+2]
            ]
        ];
        (a;n+1)

    }[lastMarble]/[(1;3)];
    high: max .tmp.p;
    delete m from `.tmp;
    delete p from `.tmp;
    high
 };


//Task 9.2 Same task implemented with circle-like structure
.aoc.d9.t2: {[players;lastMarble]
    .tmp.left: (1+lastMarble)#0N;
    .tmp.right: (1+lastMarble)#0N;
    .tmp.left[0 1 2]: 1 2 0;
    .tmp.right[0 1 2]: 2 0 1;
    .tmp.p: players#0;
    .tmp.til7: til 7;
    {
        //y@0 - current marble
        //y@1 - next marble
        if[0=y[1]mod 100000; 0N!y[1]%100000];
        if[(x+1)=y 1;:y];

        if[0=y[1] mod 23
            ; rem: {[x;y].tmp.left x}over y[0],.tmp.til7
            ; .tmp.p[y[1] mod count .tmp.p]+: y[1]+rem
            ; .tmp.right[.tmp.left rem]: .tmp.right rem
            ; .tmp.left[.tmp.right rem]: .tmp.left rem
            ; :(.tmp.right rem;1+y 1)
        ];

        right: .tmp.right y 0;
        rightNext: .tmp.right right;

        .tmp.left[y 1]: right;
        .tmp.right[y 1]: rightNext;

        .tmp.right[right]: y 1;
        .tmp.left[rightNext]: y 1;

        (y 1;1+y 1)
    }[lastMarble]/[(2;3)];
    high: max .tmp.p;
    delete left from `.tmp;
    delete right from `.tmp;
    delete p from `.tmp;
    delete til7 from `.tmp;
    high
 };

//------------------------------------
//Task 10.1
data: read0 hsym`$input.dir,"2018_10.input";
positions: {"J"$ ", "vs(x?">")#x:(1+x?"<")_x}each data;
velocities: {"J"$ ", "vs(x?">")#x:(1+x?"<")_x}each last each"velocity"vs/:data;

.aoc.d10.t2: {
  first {
    s: x 0; //second
    p: x 1; //current positions
    v: x 2; //velocities
    a: x 3; //rectangle area
    p: p+v;
    b:(min p;max p); //boundaries;
    area: prd last deltas b;
    $[area>a;x;(s+1;p;v;area)]
  }/[(0;x;y;0W)]
 };

.aoc.d10.sec: .aoc.d8.t2[positions;velocities];
.aoc.d10.t1: {
  b:(min x;max x);
  w: 1+b[1;0]-b[0;0];
  h: 1+b[1;1]-b[0;1];
  c: (h*w)#"_";
  pos:{y[0]+x*y[1]}[w]'[x-\:b 0];
  c[pos]: "a";
  c: w cut c;
  ("\n","\n" sv c),"\n"
 };
.aoc.d10.message: .aoc.d10.t1 positions+'.aoc.d10.sec*velocities;


//------------------------------------
//Task 11
.aoc.d11.prepare: {[size;serial]
  matrix: (1+til size) cross 1+til size;
  levels: size cut {
    ID: y[0]+10;
    lvl: ID*y[1];
    lvl: lvl+x;
    lvl: ID*lvl;
    lvl: floor mod[lvl;1000]%100;
    lvl-5
  }[serial]each matrix;
  sums levels
 };

.aoc.d11.t1: {[size;serial;squareSize]
  levelSums: .aoc.d11.prepare[size;serial];
  1#`energy xdesc flip`energy`x`y`size ! flip raze
    {[x;y;i;j](sum x[i+y-1;j+til y]-0^x[i-1;j+til y];i+1;j+1;y)}
      [levelSums;squareSize]'[til size+1-squareSize]'[til size+1-squareSize]
 };

.aoc.d11.t2: {[size;serial]
  levelSums: .aoc.d11.prepare[size;serial];
  1#`energy xdesc raze {[levelSums;size;squareSize]
    0N!"processing size ",string squareSize;
    1#`energy xdesc flip`energy`x`y`size ! flip raze
      {[x;y;i;j](sum x[i+y-1;j+til y]-0^x[i-1;j+til y];i+1;j+1;y)}
        [levelSums;squareSize]'[til size+1-squareSize]'[til size+1-squareSize]
  }[levelSums;size] each 1+til size
 };


//------------------------------------
//Task 12
.aoc.d12.parse: {
    data: read0 hsym`$x;
    state: 15_data 0;
    patterns: 2_data;
    patterns: patterns where patterns like "*#";
    state: "#"=state;
    patterns: "#"=5#'patterns;
    patterns: 2 sv/:"J"$string patterns;
    `state`patterns!(state;patterns)
 };

.aoc.d12.nextGen: {[patterns;maxGen;x]
    //x@0 - next generation number
    //x@1 - offset
    //x@2 - generation state
    i: x 0;
    if[i~maxGen+1;:x];
    o: x 1;
    ng: x 2;
    ng: 0000b,ng,0000b;
    ng: ng (til -2+count ng)+\:til 5;
    ng: (2 sv/:"J"$string ng) in patterns;
    p: where ng;
    ng: (1+last[p]-first p)#first[p] _ng;
    if[ng~x 2;:x];
    (i+1;-2+o+first p;ng)
 };

.aoc.d12.t1: {[file;gen]
    data: .aoc.d12.parse file;
    rs: .aoc.d12.nextGen[data`patterns;gen]/[(1;0;data`state)];
    sum rs[1] + where rs 2
 };


//------------------------------------
//Task 13

//(left;straight;right)
.aoc.d13.static.options: (">v<^"!"^>v<";">v<^"!">v<^";">v<^"!"v<^>");
.aoc.d13.static.move: ">v<^"!(0 1;1 0; 0 -1;-1 0);
.aoc.d13.static.rounds: ("v\\";"v\/";"^\/";"^\\";">\\";">\/";"<\\";"<\/")!"><><v^^v";

.aoc.d13.parse: {
    data: read0 hsym`$x;
    map: {x^("<>^v"!"--||")x}each data;
    carts: where each data in "^v><";
    carts: (carts;til count carts);
    carts: carts@\:where not 0=count each carts 0;
    carts: flip carts;
    carts: raze{x[1],'x 0}each carts;
    cartDirections: {x[y 0;y 1]}[data] each carts;
    `map`carts`cartDirections!(map;carts;cartDirections)
 };

.aoc.d13.t1: {
    data: .aoc.d13.parse x;
    result: {[x;y]
        //y 0 - cart options count
        //y 1 - cart directions
        //y 2 - cart positions
        if[(count y 2)>count distinct y 2;:y];
        y: {
            o: y 0;
            d: y 1;
            p: y 2;
            map: first x[p 0;p 1];
            $[map="+"
                ; [d: (.aoc.d13.static.options@o mod 3)d; o:o+1]
                ; $[map in "\\\/"
                    ; d: .aoc.d13.static.rounds@d,map
                    ;
                ]
            ];
            p+:.aoc.d13.static.move d;
            (o;d;p)
       } [x] each flip y;
       flip y
    }[data`map]/[((count data`carts)#0;data`cartDirections;data`carts)];
    collides:  {x where 1<count each x}value group result 2;
    {x[1],",",x 0}string result[2] first raze collides
 };

.aoc.d13.t2: {
    data: .aoc.d13.parse x;
    result: {[x;y]
        //y 0 - cart options count
        //y 1 - cart directions
        //y 2 - cart positions
        collides: raze collides where 1<count each collides:value group y 2;
        if[0<count collides
            ; leftIndex: til[count y 2] except collides
            ; y[0]: y[0]@leftIndex
            ; y[1]: y[1]@leftIndex
            ; y[2]: y[2]@leftIndex];
        if[1=count y 2;:y];
        y: {
            o: y 0;
            d: y 1;
            p: y 2;
            map: first x[p 0;p 1];
            $[map="+"
                ; [d: (.aoc.d13.static.options@o mod 3)d; o:o+1]
                ; $[map in "\\\/"
                    ; d: .aoc.d13.static.rounds@d,map
                    ;
                ]
            ];
            p+:.aoc.d13.static.move d;
            (o;d;p)
       } [x] each flip y;
       flip y
    }[data`map]/[((count data`carts)#0;data`cartDirections;data`carts)];
    result
 };


//------------------------------------
//Task 14
.aoc.d14.t1: {[recipes;current;recipeOffset;recipeLimit]
    raze string recipeLimit#recipeOffset _ last
    {
        //y@0 - current recipes (active)
        //y@1 - recipe scores

        //log progress
        if[mod[count y 1;10000]=0;0N!count y 1];

        if[x<=count y 1;:y];
        c: y[1]@y[0];
        y[1],: "J"$/:string sum c;
        y[0]: (y[0]+c+1) mod count y[1];
        y
    }[recipeOffset+recipeLimit]/[(current;recipes)]
 };

.aoc.d14.t2: {[recipes;sequence]
    //global list is used to avoid unnecessary copying when running `over` function.
    .tmp.recipes: recipes;
    {[x;y]
        //y@0 - current recipes (active)
        //y@1 - current iteration (helps to avoid convergence until sequence is found)
        //y@2 - recipes tail to be inspected for sequence
        if[0<count (raze string (neg y[2]+count x)#.tmp.recipes) ss x;:y];
        c: .tmp.recipes@y[0];
        appx: "J"$/:string sum c;
        .tmp.recipes,: appx;
        ((y[0]+c+1) mod count .tmp.recipes;1+y 1;count appx)
    }[sequence]/[(0 1;0;0)];
    offset: first (raze string .tmp.recipes) ss sequence;
    delete recipes from `.tmp;
    offset
 };


//------------------------------------
//Task 16
.aoc.d16.init: {
    .bitwise.op: {[op;x;y]
        x: $[x~0;0b;`boolean$2 vs x];
        y: $[y~0;0b;`boolean$2 vs y];
        xc: count x;
        yc: count y;
        $[xc<yc; x: ((yc-xc)#0b),x; y: ((yc-xc)#0b),y];
        2 sv op . (x;y)
     };
    .bitwise.and: .bitwise.op[&];
    .bitwise.or: .bitwise.op[|];

    .opcode.addr: {register[z]: register[x]+register[y]};
    .opcode.addi: {register[z]: register[x]+y};
    .opcode.mulr: {register[z]: register[x]*register[y]};
    .opcode.muli: {register[z]: register[x]*y};
    .opcode.banr: {register[z]: .bitwise.and[register x;register y]};
    .opcode.bani: {register[z]: .bitwise.and[register x;y]};
    .opcode.borr: {register[z]: .bitwise.or[register x;register y]};
    .opcode.bori: {register[z]: .bitwise.or[register x;y]};
    .opcode.setr: {register[z]: register x};
    .opcode.seti: {register[z]: x};
    .opcode.gtir: {register[z]: `int$x>register y};
    .opcode.gtri: {register[z]: `int$register[x]>y};
    .opcode.gtrr: {register[z]: `int$register[x]>register y};
    .opcode.eqir: {register[z]: `int$x~register y};
    .opcode.eqri: {register[z]: `int$register[x]~y};
    .opcode.eqrr: {register[z]: `int$register[x]~ register y};

    .tmp.functions: `$".opcode.",/:string {x where not null x}(key `.opcode);

 };

.aoc.d16.destroy: {
    delete from `.opcode;
    delete from `.bitwise;
    delete from `.tmp;
    delete register from `.
 };

.aoc.d16.t1: {[data]
    .aoc.d16.init`;
    samples: {("J"$", "vs -1_9_ x 0;"J"$" "vs x 1;"J"$", "vs -1_9_ x 2)}each 4 cut data;
    sampleMatches: {[sample]
        raze {[x;y]
            register:: x 0;
            (get y) . 1_x 1;
            $[register~x 2;y;()]
        }[sample]each .tmp.functions
     } each samples;
     .aoc.d16.destroy`;
     count where 3<=count each sampleMatches
 };

.aoc.d16.t2: {[samples;programme]
    .aoc.d16.init`;
    samples: {("J"$", "vs -1_9_ x 0;"J"$" "vs x 1;"J"$", "vs -1_9_ x 2)}each 4 cut samples;
    programme: "J"$" "vs/:programme;
    sampleMatches: {[sample]
        (sample[1;0];raze {[x;y]
            register:: x 0;
            (get y) . 1_x 1;
            $[register~x 2;y;()]
        }[sample]each .tmp.functions)
     } each samples;
    sampleMatches: flip`code`func!flip sampleMatches;

    oppcodeTable: first {
        if[0=count x[1];:x];
        nextCode: distinct select code, raze func from x[1] where 1=count each func;
        matchesLeft: delete from x[1] where code in nextCode`code;
        matchesLeft: update func: func except\:raze nextCode`func from matchesLeft;
        (x[0] uj nextCode;matchesLeft)
    }/[(([]code: `long$();func: `$()); sampleMatches)];

    register:: 4#0;
    {f: x@y 0; f . 1_y;}[(!). oppcodeTable`code`func]each programme;

    fr: first register;
    .aoc.d16.destroy`;
    fr
 };


//------------------------------------
//Task 18
// 0 is ground, 1 is lumberyard, 10 is tree
.aoc.d16.nextAcr: {
    a: x[y;z];
    s: sum x[y+1;z+ -1 0 1];
    s+: sum x[y;z + -1 1];
    s+: sum x[y-1;z+ -1 0 1];
    $[a=0
        ; $[s>=30;10;0]
        ; $[a=10
            ; $[3<=s mod 10;1;10]
            //when a=1
            ; $[(s>10)&0<s mod 10;1;0]]
    ]
 };

.aoc.d16.t1: {[data;minutes]
    data: (".#|"!0 1 10) data;
    .tmp.data: data;
    {
        if[x=y;:y];
        .tmp.data: .aoc.d16.nextAcr[.tmp.data;;]'[;til count .tmp.data 0]'[til count .tmp.data];
        y+1
    }[minutes]/[0];
    product: prd {sum count each where each .tmp.data=x}each 1 10;
    delete data from `.tmp;
    product
 };


//Task 2: use above code to find repeatable pattern
.aoc.d16.t2: {[data;minutes]
    data: (".#|"!0 1 10) data;
    .tmp.data: data;

    //process first 1000 entries and memorize the last one
    {
        if[x=y;:y];
        .tmp.data: .aoc.d16.nextAcr[.tmp.data;;]'[;til count .tmp.data 0]'[til count .tmp.data];
        y+1
    }[1000]/[0];
    .tmp.data1000: .tmp.data;

    //search for next entry same to 1000th and return period back
    period: {
        if[x=y;:y];
        .tmp.data: .aoc.d16.nextAcr[.tmp.data;;]'[;til count .tmp.data 0]'[til count .tmp.data];
        if[.tmp.data1000~.tmp.data;:y];
        y+1
    }[minutes-1000]/[0];

    //check next entry which corresponds to given minute with period
    minutes: (minutes-1000) mod period;
    {
        if[x=y;:y];
        .tmp.data: .aoc.d16.nextAcr[.tmp.data;;]'[;til count .tmp.data 0]'[til count .tmp.data];
        y+1
    }[minutes]/[0];

    product: prd {sum count each where each .tmp.data=x}each 1 10;
    delete data, data1000 from `.tmp;
    product
 };


//------------------------------------
//Task 22
.aoc.d22.t1: {[r;c;depth]
    .tmp.gi: r#enlist c#0N;
    .tmp.gi[0]: (depth+16807*til c) mod 20183;
    .tmp.gi[;0]: (depth+48271*til r) mod 20183;
    {[x;y;c;r;d] .tmp.gi[y;x]: $[(y=r-1)&(x=c-1);d;d+.tmp.gi[y-1;x]*.tmp.gi[y;x-1]] mod 20183}[;;c;r;depth]'[1+til c-1]'[1+til r-1];
    risk: sum sum .tmp.gi mod 3;
    delete gi from `.tmp;
    risk
 };

.graph.wg: {
   x: flip x;
   g: group x 0;
   `v`e`w!(`u#key g;x[1]@/:value g;x[2]@/:value g)
 };

.graph.dijkstra: {[G;start;end]
    S: enlist[start]!enlist 0;
    while[not end in key S
        ; S,: {[G;S]
            v: key S;
            i: G[`v]?v;
            nextE: raze G[`e]i;
            nextW: raze (G[`w]i) + (count each G[`e]i)#'(value S);
            filter: where not nextE in v;
            nextE: nextE@filter;
            nextW: nextW@filter;
            minW: min nextW;
            nextV: nextE@first where nextW=minW;
            enlist[nextV]!enlist min minW
        }[G;S];
    ];
    S@end
 };

// rocky - 0; wet - 1; narrow - 2;
// none - 0; gear - 1; torch - 2;
.aoc.d22.regTool: 0 1 2! (1 2; 0 1; 0 2);


.aoc.d22.t2: {[r;c;r1;c1;depth]
    .tmp.gi: r#enlist c#0N;
    .tmp.gi[0]: (depth+16807*til c) mod 20183;
    .tmp.gi[;0]: (depth+48271*til r) mod 20183;
    {[x;y;c1;r1;d] .tmp.gi[y;x]: $[(y=r1)&(x=c1);d;d+.tmp.gi[y-1;x]*.tmp.gi[y;x-1]] mod 20183}[;;c1;r1;depth]'[1+til c-1]'[1+til r-1];
    .tmp.gi: .tmp.gi mod 3;

    G: raze raze {[c;r;x;y]
        adj: (x;y)+/:(-1 0;1 0;0 -1;0 1);
        adj: adj where (adj[;0] within (0;c))&adj[;1] within (0;r);
         raze{[v;a]
            tv: .aoc.d22.regTool .tmp.gi . reverse v;
            ta: .aoc.d22.regTool .tmp.gi . reverse a;
            iv: (v[0]+v[1]*c)+tv*c*r;
            av: (a[0]+a[1]*c)+ta*c*r;
            w: {$[x[0]=x[1];1;8]}each tv cross ta;
            (iv cross av),'w
        }[(x;y)]'[adj]
    }[c;r]'[til c]'[til r];
    G: .graph.wg G;
    distance: .graph.dijkstra[G;2*c*r;(2*c*r)+c1+r1*c];
    delete gi from `.tmp;
    distance
 };


//------------------------------------
//Task 25
.aoc.d25.t1: {
    x: "J"$","vs/:x;
    c: enlist x 0;
    x: 1_x;
    cc: 0;
    while[0<count x;
        n: any{3>=sum each abs x-\:y}[x]each c; //neighbours
        wn: where n;
        c,:x wn;
        x: x where not n;
        if[0=count wn; c: enlist x 0; x: 1_x; cc+:1]
    ];
    cc+1
 };
