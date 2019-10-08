//------------------------------------
//Task 1
if[not 5=.aoc.d1.t1"R2, L3"; '"[AssertionException] .aoc.d1.t1 case 1"];
if[not 2=.aoc.d1.t1"R2, R2, R2"; '"[AssertionException] .aoc.d1.t1 case 2"];
if[not 12=.aoc.d1.t1"R5, L5, R5, R3"; '"[AssertionException] .aoc.d1.t1 case 3"];
if[not 4=.aoc.d1.t2"R8, R4, R4, R8"; '"[AssertionException] .aoc.d1.t2 case 1"];


//------------------------------------
//Task 2
if[not "1985"~.aoc.d2.t1"ULL\nRRDDD\nLURDL\nUUUUD" '"[AssertionException] .aoc.d2.t1 case 1"];
if["5DB3"~.aoc.d2.t2"ULL\nRRDDD\nLURDL\nUUUUD"; '"[AssertionException] .aoc.d2.t2 case 1"];


//------------------------------------
//Task 3
if[not 862=.aoc.d3.t1 read0 hsym`$input.dir,"2016_3.input"; '"[AssertionException] .aoc.d3.t1 case 1"];
if[not 1577=.aoc.d3.t2 read0 hsym`$input.dir,"2016_3.input"; '"[AssertionException] .aoc.d3.t2 case 1"];

//------------------------------------
//Task 5
if[not "18f47a30"~.aoc.d5.t1"abc"; '"[AssertionException] .aoc.d5.t1 case 1"];
if[not "05ace8e3"~.aoc.d5.t2"abc"; '"[AssertionException] .aoc.d5.t2 case 1"];

//------------------------------------
//Task 6
if[not "advent"~.aoc.d6.t1
"eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar"; '"[AssertionException] .aoc.d6.t1 case 1"];
if[not "easter"~.aoc.d6.t2
"eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar"; '"[AssertionException] .aoc.d6.t1 case 2"];


//------------------------------------
//Task 12
if[not 42 ~ .aoc.d12.t1
"cpy 41 a
inc a
inc a
dec a
jnz a 2
dec a"
    ; '"[AssertionException] .aoc.d12.t1 case 1"];


//------------------------------------
//Task 13
if[not 11 ~ .aoc.d13.t1[10;7 4]; '"[AssertionException] .aoc.d13.t1 case 1"];
if[not 138 ~ .aoc.d13.t2[1362;50]; '"[AssertionException] .aoc.d13.t2 case 1"];


//------------------------------------
//Task 14
if[not 25427 ~ .aoc.d14.t1"yjdafjpo"; '"[AssertionException] .aoc.d14.t1 case 1"];
if[not 22045 ~ .aoc.d14.t2"yjdafjpo"; '"[AssertionException] .aoc.d14.t2 case 1"];


//------------------------------------
//Task 19
if[not 3 ~ .aoc.d19.t1 5; '"[AssertionException] .aoc.d19.t1 case 1"];
if[not 1842613 ~ .aoc.d19.t1 3018458; '"[AssertionException] .aoc.d19.t1 case 2"];
if[not 2 ~ .aoc.d19.t2 5; '"[AssertionException] .aoc.d19.t2 case 1"];
if[not 1424135 ~ .aoc.d19.t2 3018458; '"[AssertionException] .aoc.d19.t2 case 2"];