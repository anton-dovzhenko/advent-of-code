//------------------------------------
//Task 1
.aoc2015.d1.t1: {sum("()"!1 -1)x};
.aoc2015.d1.t2: {1+(sums("()"!1 -1)x)?-1};


//------------------------------------
//Task 2
.aoc2015.d2.t1: {
    x: "\n" vs x;
    x: flip asc each "J"$"x" vs/:x;
    `long$2 * sum (1.5*x[0]*x[1]) + (x[1]*x[2]) + (x[2]*x[0])
 };


.aoc2015.d2.t2: {
    x: "\n" vs x;
    x: flip asc each "J"$"x" vs/:x;
    (sum prd x) + 2*sum x[0]+x[1]
 };


//------------------------------------
//Task 3
.aoc2015.d3.t1: {
    count distinct sums enlist[0 0],("^>v<"!(0 1;1 0;0 -1; -1 0))x
 };


.aoc2015.d3.t2: {
    count distinct raze {sums enlist[0 0],("^>v<"!(0 1;1 0;0 -1; -1 0))x} each flip 2 cut x
 };


//------------------------------------
//Task 4
.aoc2015.d4.t1: {
    first where "00000"~/:5#'raze each string md5 each x,/:string til 1000000
 };


.aoc2015.d4.t2: {
    first where "000000"~/:6#'raze each string md5 each x,/:string 9000000+til 1000000
 };


//------------------------------------
//Task 5
.aoc2015.d5.t1: {
    [x]
    vowels: count x ss "[aeiou]";
    repeating: count where not differ x;
    substrs: count @' ss[x] @' ("ab";"cd";"pq";"xy");
    cntsubs: count substrs except 0;
    0 < (vowels >= 3) & repeating & not cntsubs
 }


.aoc2015.d5.t2: {
    [x]
    dupe: count ({[x;y] (3 < (count x) - count ssr[x;y;""]) & ((count x ss y) > 1) & count y = 2}[x] @' (2 cut x), (2 cut next x)) except 0;
    between: count ({[x] (x[0] = x[2]) & 3 = count x} @' (3 cut next next x), (3 cut next x), (3 cut x)) except 0;
    0 < dupe & between
 };
 

//------------------------------------
//Task 6
.aoc2015.d6.t1: {
    x: "\n" vs x;
    x: flip {raze (first where x like/:("turn off*";"turn on*";"toggle*")), "J"$","vs/:(reverse " "vs x)2 0} each x;
    `long$sum {
        {$[y=2; not x;`boolean$y]} over 0b, y[0]@where ((x div 1000) within y 1 3)&(x mod 1000) within y 2 4
    }[;x] each til 1000000
 };


.aoc2015.d6.t2: {
    x: "\n" vs x;
    x: flip {raze ((-1 1 2)@first where x like/:("turn off*";"turn on*";"toggle*")), "J"$","vs/:(reverse " "vs x)2 0} each x;
    `long$sum {
        {0|x+y} over 0, y[0]@where ((x div 1000) within y 1 3)&(x mod 1000) within y 2 4
    }[;x] each til 1000000
 };


//------------------------------------
//Task 7
.aoc2015.d7.bitwise: {x: 2 vs x; y: 2 vs y; cnt: max count each (x;y); 2 sv z[((cnt-count x)#0), x; ((cnt-count y)#0), y]};
.aoc2015.d7.band: .aoc2015.d7.bitwise[;;&];
.aoc2015.d7.bor: .aoc2015.d7.bitwise[;;|];
.aoc2015.d7.lshift: {2 sv (2 vs x),y#0};
.aoc2015.d7.rshift: {2 sv neg[y] _ 2 vs x};
.aoc2015.d7.bnot: {2 sv not ((16-count x)#0), x:2 vs x};

.aoc2015.d7.t1: {[data;x]
    .aoc2015.d7.data: "\n" vs data;
    .aoc2015.d7.data: {(`$x 1)!x 0} flip " -> " vs/:.aoc2015.d7.data;
    .aoc2015.d7.cache: enlist[`]!enlist`long$();
    res: {
        expr: .aoc2015.d7.data x;

        if[x in key .aoc2015.d7.cache; :.aoc2015.d7.cache x];
        if[not x in key .aoc2015.d7.data; :"J"$string x];
        res: "J"$expr;
        if[not null res; .aoc2015.d7.cache[x]: res; :res];

        subexpr: " "vs expr;
        if[expr like "* AND *"; .aoc2015.d7.cache[x]: .aoc2015.d7.band . .z.s each `$subexpr 0 2];
        if[expr like "* OR *"; .aoc2015.d7.cache[x]: .aoc2015.d7.bor . .z.s each `$subexpr 0 2];
        if[expr like "* LSHIFT *"; .aoc2015.d7.cache[x]: .aoc2015.d7.lshift . (.z.s `$subexpr 0;"J"$subexpr 2)];
        if[expr like "* RSHIFT *"; .aoc2015.d7.cache[x]: .aoc2015.d7.rshift . (.z.s `$subexpr 0;"J"$subexpr 2)];
        if[expr like "NOT *"; .aoc2015.d7.cache[x]: .aoc2015.d7.bnot .z.s `$subexpr 1];
        if[not x in key .aoc2015.d7.cache; .aoc2015.d7.cache[x]: .z.s `$expr];
        .aoc2015.d7.cache x
    } x;
    delete data, cache from `.aoc2015.d7;
    res
 };

.aoc2015.d7.t2: .aoc2015.d7.t1;


//------------------------------------
//Task 8
.aoc2015.d8.t1: {
    sum[count each x] -
    sum {
        cnt: 0;
        bs: 0b;
        while[0<count x;
            c: first x;
            x: 1 _ x;
            $[bs;
                [bs: 0b; if[c~"x"; x: 2_ x]];
                [cnt +: 1; bs: c~"\\"]
            ]
        ];
        cnt - 2
    } each x
 };


.aoc2015.d8.t2: {sum[{2+count[x]+sum x in ("\\";"\"")} each x] - sum count each x};


//Task 9.1
input: read0 hsym`$"2015_t9_p1.in";
input: {x, (reverse each key x)!value x} {x[0]!x 1}flip{x:" to " vs x; c0: `$x 0; x: " = " vs x 1; (c0,`$x 0;"J"$x 1)} each input;
cities: distinct raze key input;
permutations: {raze {[y;x] i:til 1+count x; ((i#\:x),'y),'i _\:x}[y]each x} over enlist[(cities 0 1;cities 1 0)],2_cities;
min{sum x@/: y,'next y}[input]each permutations
//Task 9.2
//same but take max in the end
max {sum x@/: y,'next y}[input]each permutations



//Task 10.1
encode: {
  d:where 0<>deltas x:"J"$/:x;
  "" sv string raze (1_deltas d,count x),'x@d
};
count {[x;y]encode x}over enlist["1113122113"], til 40
//Task 10.2 is same to //Task 10.1
encode0: {d:where 0<>deltas x; raze (1_deltas d,count x),'x@d};
count {[x;y]encode0 x}over enlist["J"$/:"1113122113"], til 50


//------------------------------------
//Task 11
.aoc2015.d11.t1: {
    alphabet: {x!til count x}.Q.a;
    alphabet2: value[alphabet]!key alphabet;
    nextPassword: {x: reverse 1 _ {$[26=x;y+1;y]} scan (26, reverse x); x[where x=26]: 0; x};
    check1: {any(1 1)~/:(deltas -1 _ x),'(deltas[1 _ x])};
    check2: {not any x in y}[alphabet"iol"];
    check3: {1<count distinct x where (-1_x)=1_x};

    password: alphabet x;
    checked: 0b;
    while[not checked;
        password: nextPassword password;
        checked: check1 password;
        if[checked; checked: check2 password];
        if[checked; checked: check3 password];
    ];

    (value[alphabet]!key alphabet) password
 };


.aoc2015.d11.t2: {.aoc2015.d11.t1 .aoc2015.d11.t1 x};


//Task 12.1
6 3 0 0~{sum"J"$" "vs?[x in "\":,{}[]";" ";x]}each("{\"a\":2,\"b\":4}";"{\"a\":{\"b\":4},\"c\":-1}";"{\"a\":[-1,1]}";"[-1,{\"a\":1}]")
//Task 12.2 not efficient at all. Complexity must be O(n)
{sum"J"$" "vs?[x in "\":,{}[]";" ";x]}
{
  red: x ss ":\"red\"";
  if[0=count red;:x;];
  brackets: sums 0^("{}"!1 -1)x;
  excluded: distinct asc raze {[b;r]
    b: where b=-1+b@r;
    s: last b where r>b;
    e: first b where r<b;
    s+1+til e-s
  }[brackets]each red;
  x@(til count x)except  excluded
}


//Task 13.1
input: read0 hsym `$"C:/adovzhenko/kdb_scripts/aoc/2015_t13_p1.txt";
input: (!). flip{
    x:(" "vs x) 0 2 3 10;
    (`$(x 0;-1_x 3); $["gain"~x 1;1;-1]*"J"$x 2)
}each input;
attenders: distinct raze key input;

permutations: {raze {[y;x] i:til 1+count x; ((i#\:x),'y),'i _\:x}[y]each x} over enlist[(attenders 0 1;attenders 1 0)],2_attenders;
max{sum x@/: (reverse each y),y:(y,'(1_y),y 0)}[input]each permutations
//Task 13.2
input: read0 hsym `$"C:/adovzhenko/kdb_scripts/aoc/2015_t13_p2.txt";
input: (!). flip{
    x:(" "vs x) 0 2 3 10;
    (`$(x 0;-1_x 3); $["gain"~x 1;1;-1]*"J"$x 2)
}each input;
attenders: (distinct raze key input),`me;
permutations: {raze {[y;x] i:til 1+count x; ((i#\:x),'y),'i _\:x}[y]each x} over enlist[(attenders 0 1;attenders 1 0)],2_attenders;
max{sum x@/: (reverse each y),y:(y,'(1_y),y 0)}[input]each permutations


//------------------------------------
//Task 14
.aoc2015.d14.t1: {[x;time]
    x: "\n" vs x;
    x: {x: " " vs x; ("J"$x 3;"J"$x 6;"J"$x 13) } each x;
    max{[time;reideer]
        speed: reideer 0;
        fly: reideer 1;
        rest: reideer 2;
        cycles: floor time%fly+rest;
        travelled: cycles * fly;
        travelled+: fly&mod[time;fly+rest];
        travelled*: speed;
        travelled
    }[time]'[x]
 };


.aoc2015.d14.t2: {[x;time]
    x: "\n" vs x;
    x: flip `speed`fly`rest!flip {x: " " vs x; ("J"$x 3;"J"$x 6;"J"$x 13) } each x;
    x: update mode: 1b, timeLeft: fly, distance: 0, score: 0 from x;
    do[time; x: {
        //switch mode if neccessary
        x: update switch: 1b from x where timeLeft=0;
        x: update mode: not mode from x where switch;
        x: update timeLeft: ?[mode;fly;rest] from x where switch;
        x: delete switch from x;

        //update distance and scores
        x: update distance: distance+speed from x where mode;
        x[`timeLeft]-: 1;
        x: update score: score+1 from x where distance=max distance;
        x
    }x];
    max x`score
 };

//Faster functional form
.aoc2015.d14.t2: {[x;time]
    x: "\n" vs x;
    x: flip `speed`fly`rest!flip {x: " " vs x; ("J"$x 3;"J"$x 6;"J"$x 13) } each x;
    x: update mode: 1b, timeLeft: fly, distance: 0, score: 0 from x;
    do[time; x: {
        //switch mode if neccessary
        switch: 0=x`timeLeft;
        x[`mode]: ?[switch;not x`mode;x`mode];
        x[`timeLeft]: ?[switch;?[x`mode;x`fly;x`rest];x`timeLeft];

        //update distance and scores
        x[`distance]+: x[`mode]*x`speed;
        x[`timeLeft]-: 1;
        x[`score]+: x[`distance]=max x[`distance];
        x
    }x];
    max x`score
 };


//------------------------------------
//Task 15
// Brute-force
.aoc2015.d15.t1: {
    x: flip "J"${last each" " vs/:x}each "," vs/: "\n" vs x;
    x: -1 _ x;
    .tmp.max: 0;
    {[x;a;b;c;d] .tmp.max|: $[100=a+b+c+d;prd 0|sum each x*\:(a;b;c;d);0]}
        [x]'[til 101]'[til 101]'[til 101]'[til 101];
    .tmp.max
 };


.aoc2015.d15.t2: {
    x: flip "J"${last each" " vs/:x}each "," vs/: "\n" vs x;
    calories: last x;
    x: -1 _ x;
    .tmp.max: 0;
    {[x;cal;a;b;c;d] .tmp.max|: $[(100=a+b+c+d)&500=sum cal*(a;b;c;d);prd 0|sum each x*\:(a;b;c;d);0]}
        [x;calories]'[til 101]'[til 101]'[til 101]'[til 101];
    .tmp.max
 };


//------------------------------------
//Task 16
.aoc2015.d16.parse: {
    x: "\n" vs x;
    update sue: i+1 from (uj/) {
        ci: first x?":";
        x: (ci+1) _ x;
        x: {flip(`$x 0)!enlist each "J"$x 1}flip ": " vs/: ", " vs x;
        x
    }each x
 };


.aoc2015.d16.t1: {
    x: .aoc2015.d16.parse x;
    exec sue from x where
        ((children=3)|null children)
        &((cats=7)|null cats)
        &((samoyeds=2)|null samoyeds)
        &((pomeranians=3)|null pomeranians)
        &((akitas=0)|null akitas)
        &((vizslas=0)|null vizslas)
        &((goldfish=5)|null goldfish)
        &((trees=3)|null trees)
        &((cars=2)|null cars)
        &((perfumes=1)|null perfumes)
 };

.aoc2015.d16.t2: {
    x: .aoc2015.d16.parse x;
    exec sue from x where
        ((children=3)|null children)
        &((cats>7)|null cats)
        &((samoyeds=2)|null samoyeds)
        &((pomeranians<3)|null pomeranians)
        &((akitas=0)|null akitas)
        &((vizslas=0)|null vizslas)
        &((goldfish<5)|null goldfish)
        &((trees>3)|null trees)
        &((cars=2)|null cars)
        &((perfumes=1)|null perfumes)
 };


//------------------------------------
//Task 17
.aoc2015.d17.t1: {
    c: "J"$"\n" vs x;
    sum {[x;c]
        if[x = 0; :1];
        if[(x < 0)|count[c]=0; :0];
        x1: x - last c;
        c: -1 _ c;
        .z.s[x1;c], .z.s[x;c]
    }[150;c]
 };


.aoc2015.d17.t2: {
    c: "J"$"\n" vs x;
    c: {[x;c;n]
        if[x = 0; :n];
        if[(x < 0)|count[c]=0; :0W];
        x1: x - last c;
        c: -1 _ c;
        .z.s[x1;c;n+1], .z.s[x;c;n]
    }[150;c;0];
    sum c=min c
 };


//------------------------------------
//Task 18
.aoc2015.d18.t1: {
    x: (".#"!01b)"\n" vs x;
    neighbours: (-1 0 1 cross -1 0 1) except enlist 0 0;
    do[100;
        x: flip {[neighbours;x;i;j]
            s: sum x ./:(i;j)+/:neighbours;
            $[x[i;j]=1;s in 2 3; s=3]
        }[neighbours;x]'[til count x]'[til count first x]
    ];
    sum sum x
 };


.aoc2015.d18.t2: {
    x: (".#"!01b)"\n" vs x;
    neighbours: (-1 0 1 cross -1 0 1) except enlist 0 0;
    x[0;0]: 1b;
    x[0;99]: 1b;
    x[99;0]: 1b;
    x[99;99]: 1b;
    do[100;
        x: flip {[neighbours;x;i;j]
             if[(i;j) in 0 99 cross 0 99; :1b];
            s: sum x ./:(i;j)+/:neighbours;
            $[x[i;j]=1;s in 2 3; s=3]
        }[neighbours;x]'[til count x]'[til count first x]
    ];
    sum sum x
 };


//------------------------------------
//Task 19
// @m - molecule
// @r - replacements in "x => y\n..." format
.aoc2015.d19.t1: {[m;r]
    r: " => " vs/:"\n" vs r;
    count distinct raze {[m;r]
        i: m ss r 0;
        (i #\: m),'r[1],/:(i + count r 0)_\: m
    }[m] each r
 };


//------------------------------------
//Task 20
.aoc2015.d20.t1: {
    p: 0;
    h: 0;
    while[p < x
        ; 0N!(h;p)
        ; h+: 1
        ; p: {
            divisors: divisors@where 0 = x mod divisors: 1+til floor sqrt x;
            10*sum distinct `long$divisors, x%divisors
        } h
    ];
    h
 };

.aoc2015.d20.t2: {
    p: 0;
    h: 0;
    while[p < x
        ; 0N!(h;p)
        ; h+: 1
        ; p: {
            divisors: divisors@where 0 = x mod divisors: 1+til floor sqrt x;
            divisors: distinct `long$divisors, x%divisors;
            divisors: divisors where 50>=x%divisors;
            11*sum divisors
        } h
    ];
 };


//------------------------------------
//Task 21

.aoc2015.d21.t1: {
    w: flip (8 10 25 40 74; 4 5 6 7 8; 0 0 0 0 0);
    a: flip (0 13 31 53 75 102; 0 0 0 0 0 0; 0 1 2 3 4 5);
    r: flip (0 25 50 100 20 40 80; 0 1 2 3 0 0 0; 0 0 0 0 1 2 3);
    min {[me;boss;bossDamage;bossArmor;player]
        w: player 0 1 2;
        a: player 3 4 5;
        r1: player 6 7 8;
        r2: player 9 10 11;
        if[(r1~r2)&not r1~0 0 0;:0W];
        damage: w[1]+r1[1]+r2[1];
        armor: a[2]+r1[2]+r2[2];
        attackerMe: 1b; //1b - me, 0b - boss;
        while[(me>0)&boss>0
            ; $[attackerMe
                ; boss: boss-1|damage-bossArmor
                ; me: me - 1|bossDamage-armor
            ]
            ; attackerMe: not attackerMe
        ];
        $[0<me
            ; w[0]+a[0]+r1[0]+r2[0]
            ; 0W
        ]
    }[100;104;8;1] each w cross a cross r cross r
 };


.aoc2015.d21.t2: {
    w: flip (8 10 25 40 74; 4 5 6 7 8; 0 0 0 0 0);
    a: flip (0 13 31 53 75 102; 0 0 0 0 0 0; 0 1 2 3 4 5);
    r: flip (0 25 50 100 20 40 80; 0 1 2 3 0 0 0; 0 0 0 0 1 2 3);
    max {[me;boss;bossDamage;bossArmor;player]
        w: player 0 1 2;
        a: player 3 4 5;
        r1: player 6 7 8;
        r2: player 9 10 11;
        if[(r1~r2)&not r1~0 0 0;:-0W];
        damage: w[1]+r1[1]+r2[1];
        armor: a[2]+r1[2]+r2[2];
        attackerMe: 1b; //1b - me, 0b - boss;
        while[(me>0)&boss>0
            ; $[attackerMe
                ; boss: boss-1|damage-bossArmor
                ; me: me-1|bossDamage-armor
            ]
            ; attackerMe: not attackerMe
        ];
        $[0<me
            ; -0W
            ; w[0]+a[0]+r1[0]+r2[0]
        ]
    }[100;104;8;1] each w cross a cross r cross r

 };


//------------------------------------
//Task 22
.aoc2015.d22.t0: {[ploss;phit;pmana;bhit;bdamage]
    .cache.setup: flip `name`cost`damage`armor`heal`mana`turns!(
        `$("Magic Missile"; "Drain"; "Shield"; "Poison"; "Recharge");
        53 73 113 173 229;
        4 2 0 3 0;
        0 0 7 0 0;
        0 2 0 0 0;
        0 0 0 0 101;
        1 1 6 6 5);
    .cache.min: 0W;

    minMana: {[pTurn;phit;ploss;pmana;bhit;bdamage;spent;active]

        phit: phit-ploss;
        if[(spent>.cache.min) | phit<1; :0W];

        bhit: bhit - sum active`damage;
        if[bhit<1; .cache.min: .cache.min&spent; :spent];

        pheal: sum active`heal;
        parmor: sum active`armor;
        pmana: pmana+sum active`mana;

        if[not pTurn; phit: (phit+pheal)-(1|bdamage-parmor)];
        if[phit<1; :0W];

        active: update turns - 1 from active;
        active: delete from active where turns<1;

        if[not pTurn; :.z.s[not pTurn;phit;ploss;pmana;bhit;bdamage;spent;active]];

        toTry: select from .cache.setup where not name in active`name, cost<=pmana;
        if[0=count toTry; :0W];
        min .z.s[not pTurn;phit;ploss;;bhit;bdamage]'[pmana-toTry`cost;spent+toTry`cost;active,/:toTry]

    }[1b;phit;ploss;pmana;bhit;bdamage;0;0#.cache.setup];

    delete from `.cache;

    minMana
 };

.aoc2015.d22.t1: .aoc2015.d22.t0[0];
.aoc2015.d22.t2: .aoc2015.d22.t0[1];


//------------------------------------
//Task 23
.aoc2015.d23.t0: {[r;x]
    x: "\n"vs x;
    x: " " vs/:x;
    i: 0;
    while[i within (0;-1+count x)
        ; instruction: x@i
        ; cmd: (
            ("hlf";"tpl";"inc";"jmp";"jie";"jio")!(
                {[r;ri] ri: `int$ri like "b*"; r[ri]: floor 0.5*r[ri]; (r; 1)}
                ; {[r;ri] ri: `int$ri like "b*"; r[ri]: 3*r[ri]; (r; 1)}
                ; {[r;ri] ri: `int$ri like "b*"; r[ri]: r[ri]+1; (r; 1)}
                ; {[r;offset] (r; "J"$offset)}
                ; {[r;ri;offset] ri: `int$ri like "b*"; (r; $[0=r[ri] mod 2;"J"$offset;1])}
                ; {[r;ri;offset] ri: `int$ri like "b*"; (r; $[1=r[ri];"J"$offset;1])}
            )
        ) instruction 0
        ; result: cmd . enlist[r], 1 _ instruction
        ; r: result 0
        ; i: i + result 1
    ];
    last r
 };

.aoc2015.d23.t1: .aoc2015.d23.t0[0 0];
.aoc2015.d23.t2: .aoc2015.d23.t0[1 0];


//------------------------------------
//Task 24
.aoc2015.d24.t0: {[data;N]
    s: sum data;
    t: `int$s%N;

    data: desc data;
    buckets: enlist 0;

    res: {[t;buckets;data]
        buckets: buckets,/:data;
        SS: sum each buckets;
        if[any t=SS; :buckets where t=SS];
        indices: where t>SS;
        raze .z.s[t]'[buckets @ indices; (indices+1) _ \:data]

    }[t;buckets;data];

    res: 1_'res;
    min prd each res where (count each res)=min count each res
 };

.aoc2015.d24.t1: .aoc2015.d24.t0[;3];
.aoc2015.d24.t2: .aoc2015.d24.t0[;4];


//------------------------------------
//Task 25
.aoc2015.d25.t1: {[r;c]
    d: c + r - 1;
    N: (sum sums (d-1)#1) + c;
    code: 20151125;
    do[N-1; code: (code*252533) mod 33554393];
    code
 };
