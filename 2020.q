//------------------------------------
//Task 1
.aoc2020.d1.t1: {prd x where any x in/:(2020-x)};
.aoc2020.d1.t2: {prd x where any x in/:(2020-sum each x cross x)};


//------------------------------------
//Task 2
.aoc2020.d2.t1: {
    sum {
        p: x 1;
        c: " " vs x 0;
        L: first last c;
        pos: "J"$"-" vs first c;
        (sum p=L) within pos
    } each ": " vs/:"\n" vs x
 };


.aoc2020.d2.t2: {
    sum {
        p: x 1;
        c: " " vs x 0;
        L: first last c;
        pos: "J"$"-" vs first c;
        1=count pos inter 1+where p=L
    } each ": " vs/:"\n" vs x
 };


//------------------------------------
//Task 3
.aoc2020.d3.t1: {
    x: "\n" vs x;
    `long$sum"#"=x@'mod[3*til count x;count first x]
 };


.aoc2020.d3.t2: {
    prd {[x;r;d] "j"$sum"#"=x@'(r*til count x: first each d cut x) mod count first x}["\n" vs x]'[1 3 5 7 1;1 1 1 1 2]
 };


//------------------------------------
//Task 4
.aoc2020.d4.t1: {
    x: " " vs/: ssr[;"\n";" "] each "\n\n" vs x;
    "j"$sum {7=count ("byr";"iyr";"eyr";"hgt";"hcl";"ecl";"pid") inter first each ":"vs/:x} each x
 };


.aoc2020.d4.t2: {
    x: " " vs/:ssr[;"\n";" "] each "\n\n" vs x;
    c: ("byr";"iyr";"eyr";"hgt";"hcl";"ecl";"pid");
    x: flip(`$c) ! flip{[x;c] value c#(!) . flip ":" vs/:x}[;c] each x;
    exec count i from x where ("J"$byr) within 1920 2002,
         ("J"$iyr) within 2010 2020,
         ("J"$eyr) within 2020 2030,
         ((hgt like "*cm")&(("J"$-2_'hgt) within 150 193))|((hgt like "*in")&(("J"$-2_'hgt) within 59 76)),
         hcl like (raze"#", 6#enlist"[0-9a-f]"),
         ecl in " " vs "amb blu brn gry grn hzl oth",
         pid like raze 9#enlist"[0-9]"
 };


//------------------------------------
//Task 5
.aoc2020.d5.t1: {
    max {
        bs: {$[y;(ceiling avg x;x 1);(x 0;floor avg x)]};
        sum 8 1 * first each (bs/) each (enlist[0 127], 7#x; enlist[0 7], 7_x)
    } each ("\n" vs x) in "BR"
 };


.aoc2020.d5.t2: {
    x: {
        bs: {$[y;(ceiling avg x;x 1);(x 0;floor avg x)]};
        sum 8 1 * first each (bs/) each (enlist[0 127], 7#x; enlist[0 7], 7_x)
    } each ("\n" vs x) in "BR";
    // Find missing element
    "j"$((1 + count x) * 0.5 * max[x] + min[x]) - sum x
 };


//------------------------------------
//Task 6
.aoc2020.d6.t1: {sum count each distinct each raze each "\n" vs/:"\n\n" vs x};
.aoc2020.d6.t2: {sum count each (inter/) each "\n" vs/:"\n\n" vs x};


//------------------------------------
//Task 7
.aoc2020.d7.t1: {
    x: {(-6_x 0; " " sv/:(" "vs/:"," vs x 1)[;2 3])} each "contain" vs/:"\n" vs x;
    x: ungroup flip `bp`bc!`$flip x;
    -1+count {distinct y, exec bp from x where bc in y}[x] over `$"shiny gold"
 };


// ugly-looking, but fast
.aoc2020.d7.t2: {
    x: "\n" vs x;
    x: x where not x like "*no other bags.";
    x: {(`$-6_x 0; `$" " sv/:(" " vs/:"," vs x 1)[;2 3]; 1^"J"$(" " vs/:"," vs x 1)[;1])} each "contain" vs/:x;
    x: ungroup flip `bp`bc`cc!flip x;
    x: {
        x: update cc: cc*y[1]@/:bp from x;
        x: 0!select sum cc by bc from x where not null cc;
        (y[0] + sum x`cc; (!) . x`bc`cc)
    }[x] over (0;(!) . enlist each (`$"shiny gold";1));
    x 0
 };


// nice-looking, but slow
.aoc2020.d7.t2_v2: {
    x: "\n" vs x;
    x: x where not x like "*no other bags.";
    x: {(`$-6_x 0; raze (1^"J"$(" " vs/:"," vs x 1)[;1])#'`$" " sv/:(" " vs/:"," vs x 1)[;2 3])} each "contain" vs/:x;
    x: (!) . flip x;
    x: ((raze x@)\)`$"shiny gold";
    -1+sum count each x
 };


//------------------------------------
//Task 8
.aoc2020.d8.run: {[x;f]
     f{
         cmd: x@last y 0;
         i: (last y 0) + $[`jmp=cmd 0; cmd 1;1];
         (y[0], i; y[1] + $[`acc=cmd 0;cmd 1;0])
     }[x]/(1#0;0)
 };

.aoc2020.d8.t1: {
    x: {(`$x 0;"J"$x 1)} each " "vs/:"\n" vs x;
    x: .aoc2020.d8.run[x;{count[x 0]=count group x 0}];
    x 1
 };


.aoc2020.d8.t2: {
    x: {(`$x 0;"J"$x 1)} each " "vs/:"\n" vs x;
    run: .aoc2020.d8.run[;{(count[y 0]=count group y 0)&x>last y 0}[count x]];
    res: run each {x[y;0]: `jmp; x}[x] each where x[;0]=`nop;
    res,: run each {x[y;0]: `nop; x}[x] each where x[;0]=`jmp;
    last res@first where count[x]=last each first each res
 };