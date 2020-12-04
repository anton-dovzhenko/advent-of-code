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
    x: "\n" vs x;
    treeCnt: {[x;s;w] `long$sum"#"=x@'mod[s*til count x;w]}[;;count first x];
    prd (treeCnt[x] each 1 3 5 7), treeCnt[x@where 0=til[count x] mod 2;1]
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