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


.aoc2020.d7.t2: {
    x: {(`$-6_x 0; `$" " sv/:(" " vs/:"," vs x 1)[;2 3]; 1^"J"$(" " vs/:"," vs x 1)[;1])} each "contain" vs/:"\n" vs x;
    x: ungroup flip `bp`bc`cc!flip x;
    x: delete from x where bc like "other bags.";
    x: {
        x: update cc: cc*y[1]@/:bp from x;
        x: 0!select sum cc by bc from x where not null cc;
        if[0=count x;:y];
        (y[0] + sum x`cc; (!) . x`bc`cc)
    }[x] over (0;(!) . enlist each (`$"shiny gold";1));
    x 0
 };


.aoc2020.d7.t2_v2: {
    x: {(`$-6_x 0; raze (1^"J"$(" " vs/:"," vs x 1)[;1])#'`$" " sv/:(" " vs/:"," vs x 1)[;2 3])} each "contain" vs/:"\n" vs x;
    x: (!) . flip x;
    x: x except\:`$"other bags.";
    x: {raze x@y}[x] scan `$"shiny gold";
    -1 + sum count each x
 };