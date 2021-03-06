//------------------------------------
//Common
.aoc2019.computer: {[x;y;i]
    C: {x: ((5-count x)#"0"),x:string x; (reverse "0"=3#x), "J"$-2#x} x@i;
    i1:$[C 0; x@i+1; i+1];
    i2:$[C 1; x@i+2; i+2];
    i3:$[C 2; x@i+3; i+3];
    C: C 3;
    if[C=1; :(i3;x[i1]+x[i2];i+4;0N;y)];
    if[C=2; :(i3;x[i1]*x[i2];i+4;0N;y)];
    if[C=3; :(i1; first y; i+2; 0N;1 _ y)];
    if[C=4; :(0N;0N;i+2;x@i1;y)];
    if[C=5; :(0N;0N;$[0<>x@i1; x@i2; i+3];0N;y)];
    if[C=6; :(0N;0N;$[0=x@i1; x@i2; i+3];0N;y)];
    if[C=7; :(x@i+3;`int$x[i1]<x@i2;i+4;0N;y)];
    if[C=8; :(x@i+3;`int$x[i1]=x@i2;i+4;0N;y)];
    '"[Error] Illegal Command", string x@i
 };

//------------------------------------
//Task 1
.aoc2019.d1.t1: {{sum -2+ floor x%3}"J"$"\n" vs x};
.aoc2019.d1.t2: {sum {x: -2+ floor x%3; $[x<=0;0;x+.z.s x]} each "J"$"\n" vs x};


//------------------------------------
//Task 2
// @x - string of comma delimited integers
// @y - initial replacement. E.g. if x[1] should be set to 12 and x[2] to 2, then y is 1 2!12 2
.aoc2019.d2.t1: {
    x: "J"$"," vs x;
    x[key y]: value y;
    i: 0;
    while[i<count x;
        ; A: x[i];
        ; if[A=1; x[x[i+3]]: x[x[i+2]]+x[x[i+1]]; i +: 4]
        ; if[A=2; x[x[i+3]]: x[x[i+2]]*x[x[i+1]]; i +: 4]
        ; if[A=99; i: 0W]
    ];
    first x
};


//------------------------------------
//Task 3
.aoc2019.d3.t1: {[x;y]
    getPath: {[x;y]
        d: ("ULDR"!(0 1;-1 0;0 -1;1 0))y 0;
        l: "J"$1_y;
        x, last[x]+/:d*/:1+til l
    };
    p0: getPath/[(enlist enlist 0 0),"," vs x];
    p1: getPath/[(enlist enlist 0 0),"," vs y];
    min sum each abs (1_p0) inter 1_p1
 };

.aoc2019.d3.t2: {[x;y]
    getPath: {[x;y]
        d: ("ULDR"!(0 1;-1 0;0 -1;1 0))y 0;
        l: "J"$1_y;
        x, last[x]+/:d*/:1+til l
    };
    p0: getPath/[(enlist enlist 0 0),"," vs x];
    p1: getPath/[(enlist enlist 0 0),"," vs y];
    k: (1_p0) inter 1_p1;
    min (min each (group p0)k)+(min each (group p1)k)
 };


//------------------------------------
//Task 4
// @x - range start
// @y - range end
.aoc2019.d4.t1: {
    n: flip string x+til 1+y-x;
    `long$sum((&/)(-1_n)<=1_n) & (|/)(-1_n)=1_n
 };


//------------------------------------
//Task 5
.aoc2019.d5.t1: {
    x: "J"$"," vs x;
    i: 0;
    dc: 0N;
    while[i<count x;
        $[x[i]=99
            ; i: 0W
            ; [
                cmd: {x: ((5-count x)#"0"),x:string x; (reverse "0"=3#x), "J"$-2#x} x@i;
                C: cmd 3;
                i1:$[cmd 0; x@i+1; i+1];
                i2:$[cmd 1; x@i+2; i+2];
                i3:$[cmd 2; x@i+3; i+3];
                if[C=1; x[i3]: x[i1]+x[i2]; i+: 4];
                if[C=2; x[i3]: x[i1]*x[i2]; i+: 4];
                if[C=3; x[i1]: y; i+: 2];
                if[C=4; dc: x @i1; i+: 2];
            ]
        ];

    ];
    dc
 };


.aoc2019.d5.t2: {
    x: "J"$"," vs x;
    i: 0;
    dc: 0N;
    //N.B. Anonymous function is used, because code amount limitation in while loop
    while[i<count x;
        $[x[i]=99
            ; i: 0W
            ; [
                res: {[x;y;i]
                    C: {x: ((5-count x)#"0"),x:string x; (reverse "0"=3#x), "J"$-2#x} x@i;
                    i1:$[C 0; x@i+1; i+1];
                    i2:$[C 1; x@i+2; i+2];
                    i3:$[C 2; x@i+3; i+3];
                    C: C 3;
                    if[C=1; :(i3;x[i1]+x[i2];i+4;0N)];
                    if[C=2; :(i3;x[i1]*x[i2];i+4;0N)];
                    if[C=3; :(i1; y; i+2; 0N)];
                    if[C=4; :(0N;0N;i+2;x@i1)];
                    if[C=5; :(0N;0N;$[0<>x@i1; x@i2; i+3];0N)];
                    if[C=6; :(0N;0N;$[0=x@i1; x@i2; i+3];0N)];
                    if[C=7; :(x@i+3;`int$x[i1]<x@i2;i+4;0N)];
                    if[C=8; :(x@i+3;`int$x[i1]=x@i2;i+4;0N)];
                }[x;y;i];
                if[not null res 0; x[res 0]: res 1];
                i: res 2;
                dc: dc^res 3;
            ]
        ];

    ];
    dc
 };


//------------------------------------
//Task 6
.aoc2019.d6.t1: {
    x: "\n" vs x;
    x:`$")" vs/:x;
    x: update c: 0 from flip`k`v!flip x;
    x: {
        d: x 0;
        n: x 1;
        d[`c]: d[`c]+0^1+n@/:d`k;
        (d;(d[`v] where d[`k] in key n)!d[`c] where d[`k] in key n)
    }/[(x;(1#`COM)!1#0)];
    sum(x 0)`c
 };


.aoc2019.d6.t2: {
    x: "\n" vs x;
    x: (!). reverse flip`$")" vs/:x;
    p1: -1_{x y}[x]scan `SAN;
    p2: -1_{x y}[x]scan `YOU;
    pi: p1 inter p2;
    -2+min ((p1!til count p1)pi) + (p2!til count p2)pi
 };


//------------------------------------
//Task 7
.aoc2019.d7.t1: {
    x: "J"$"," vs x;
    perm: {(x-1){raze y,/:'x except/:y}[til x]/til x};
    max {
        input: 0;
        pi: 0;
        do[5;
            input: {
                i: 0;
                dc: 0N;
                //N.B. Anonymous function is used, because code amount limitation in while loop
                while[i<count x;
                    $[x[i]=99; i: 0W;
                        [
                            res: .aoc2019.computer[x;y;i];
                            if[not null res 0; x[res 0]: res 1];
                            i: res 2; dc: dc^res 3; y: res 4;
                        ]
                    ];

                ];
                dc
            }[x; y[pi], input];
            pi+:1
        ];
        input
    }[x] each perm 5
 };


//------------------------------------
//Task 8
.aoc2019.d8.t1: {[x;w;h]
    x: (w*h) cut x;
    l: {first where x=min x}sum each "0"=x;
    `long$(sum"1"=x@l)*(sum"2"=x@l)
 };


.aoc2019.d8.t2: {[x;w;h]
    "\n" sv w cut ("01"!" #") x@'first each where each not "2"=x: flip (w*h) cut x
 };


//------------------------------------
//Task 10
.aoc2019.d10.t1: {
    x: where each "#"=/:"\n" vs x;
    x: reverse each raze {x,'y}'[til count x;x];
    max -1+{x: x-/:y; count distinct 1e-6*`long$1e6* x%sqrt sum each x*x}[;x] each x
 };


//@x - asteroid map
//@y - laser position
//@z - bet asteroid index
.aoc2019.d10.t2: {
    x: where each "#"=/:"\n" vs x;
    x: reverse each raze {x,'y}'[til count x;x];
    x: x except enlist y; //remove laser position
    // p -point, v - vector, d - distance, q - quarter, t - tangent
    space: flip`p`v! (x; x-\:y);
    space: update d: {sqrt sum x*x}each v from space;
    space: update q: ?[(v[;0]>=0)&v[;1]<=0;0
            ;?[(v[;0]>=0)&v[;1]>=0;1
                ;?[(v[;0]<=0)&v[;1]>=0;2;3]]] from space;
    space: update t: v[;1]%v[;0] from space;
    Q: 0;
    Points: ();

    while[0<count space
        ; vaporized: (`t xasc select from space where q=Q, d=(min;d) fby t)`p
        ; Points: Points, vaporized;
        ; space: delete from space where p in `g#vaporized;
        ; Q: (Q+1) mod 4
    ];

    {y+100*x} . Points@z-1

 };



//------------------------------------
//Task 12
.aoc2019.d12.t1: {
    x: {"J"$2_'", " vs x} each 1_'-1_'"\n" vs x;
    v: 3 cut 12#0;
    do[y; v: v+{sum signum x-\:y}[x] each x; x: x +v];
    sum (sum each abs x)*(sum each abs v)
 };



//------------------------------------
//Task 14
.aoc2019.d14.parse: {
    x: "\n" vs x;
    x: flip`cntOut`Out`cntIn`In! raze flip each flip{({("J"$x 0;`$x 1)}" " vs x 0;{("J"$x 0;`$x 1)}flip" " vs/:", "vs x 1)}each {reverse " => " vs x}each x;
    x,: flip`cntOut`Out`cntIn`In! enlist each (1;`ORE;enlist 1;enlist `ORE);
    x
 };


.aoc2019.d14.getMinOre: {
    res: {[x;y;z]
        if[all`ORE=key x;:x;];
        bal: y;
        bal: {(where x>0)#x}bal - x;
        x: {(where x>0)#x} x - y;
        y: bal;

        res: select cntOut*ceiling({x y}[x] each Out)%cntOut, cntIn*ceiling({x y}[x] each Out)%cntOut, In, Out from z where Out in key x;
        res: update bal: cntOut-({x y}[x] each Out)from res;
        y: y+(!) . res`Out`bal;
        y: {(where x>0)#x} y;
        res: (+/)(!)./:flip res`In`cntIn;
        .z.s[res;y;z]

    }[enlist[`FUEL]!1#y;enlist[`]!1#0N;x];
    res`ORE
 };


.aoc2019.d14.t1: {
    x: .aoc2019.d14.parse x;
    .aoc2019.d14.getMinOre[x;y]
 };