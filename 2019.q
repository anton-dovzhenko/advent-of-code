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