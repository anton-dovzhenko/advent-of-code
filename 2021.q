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


