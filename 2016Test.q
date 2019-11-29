//------------------------------------
//Task 1
if[not 5~.aoc2016.d1.t1"R2, L3"; '"[AssertionException] .aoc2016.d1.t1 case 1"];
if[not 2~.aoc2016.d1.t1"R2, R2, R2"; '"[AssertionException] .aoc2016.d1.t1 case 2"];
if[not 12~.aoc2016.d1.t1"R5, L5, R5, R3"; '"[AssertionException] .aoc2016.d1.t1 case 3"];
if[not 4~.aoc2016.d1.t2"R8, R4, R4, R8"; '"[AssertionException] .aoc2016.d1.t2 case 1"];
0N!".aoc2016.d1 passed";


//------------------------------------
//Task 2
if[not "1985"~.aoc2016.d2.t1"ULL\nRRDDD\nLURDL\nUUUUD"; '"[AssertionException] .aoc2016.d2.t1"];
if[not "5DB3"~.aoc2016.d2.t2"ULL\nRRDDD\nLURDL\nUUUUD"; '"[AssertionException] .aoc2016.d2.t2"];
0N!".aoc2016.d2 passed";


//------------------------------------
//Task 3
.aoc2016.d3.input: "101 301 501
102 302 502
103 303 503
201 401 601
202 402 602
203 403 603";
if[not 3~.aoc2016.d3.t1 .aoc2016.d3.input; '"[AssertionException] .aoc2016.d3.t1"];
if[not 6~.aoc2016.d3.t2 .aoc2016.d3.input; '"[AssertionException] .aoc2016.d3.t2"];
0N!".aoc2016.d3 passed";


//------------------------------------
//Task 4
.aoc2016.d4.input:
"aaaaa-bbb-z-y-x-123[abxyz]
a-b-c-d-e-f-g-h-987[abcde]
not-a-real-room-404[oarel]
totally-real-room-200[decoy]";
if[not 1514~.aoc2016.d4.t1 .aoc2016.d4.input; '"[AssertionException] .aoc2016.d4.t1"];
0N!".aoc2016.d4 passed";


//------------------------------------
//Task 5
if[not "18f47a30"~.aoc2016.d5.t1"abc"; '"[AssertionException] .aoc2016.d5.t1"];
if[not "05ace8e3"~.aoc2016.d5.t2"abc"; '"[AssertionException] .aoc2016.d5.t2"];
0N!".aoc2016.d5 passed";


//------------------------------------
//Task 6
.aoc2016.d6.input:
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
enarar";
if[not "advent"~.aoc2016.d6.t1 .aoc2016.d6.input; '"[AssertionException] .aoc2016.d6.t1"];
if[not "easter"~.aoc2016.d6.t2 .aoc2016.d6.input; '"[AssertionException] .aoc2016.d6.t2"];
0N!".aoc2016.d6 passed";


//------------------------------------
//Task 7
.aoc2016.d7.input1:
"abba[mnop]qrst
abcd[bddb]xyyx
aaaa[qwer]tyui
ioxxoj[asdfgh]zxcvbn";
.aoc2016.d7.input2:
"aba[bab]xyz
xyx[xyx]xyx
aaa[kek]eke
zazbz[bzb]cdb";
if[not 2~.aoc2016.d7.t1 .aoc2016.d7.input1; '"[AssertionException] .aoc2016.d7.t1"];
if[not 3~.aoc2016.d7.t2 .aoc2016.d7.input2; '"[AssertionException] .aoc2016.d7.t2"];
0N!".aoc2016.d7 passed";


//------------------------------------
//Task 8
.aoc2016.d8.input:
"rect 3x2
rotate column x=1 by 1
rotate row y=0 by 4
rotate column x=1 by 1";
if[not 6~.aoc2016.d8.t1 .aoc2016.d8.input; '"[AssertionException] .aoc2016.d8.t1"];
0N!".aoc2016.d8 passed";


//------------------------------------
//Task 9
if[not 7 6 9 6 18 ~ .aoc2016.d9.t1
    each ("A(1x5)BC";"ADVENT";"(3x3)XYZ";"(6x1)(1x3)A";"X(8x2)(3x3)ABCY"); '"[AssertionException] .aoc2016.d9.t1"];
if[not 9 20 241920 445 ~ .aoc2016.d9.t2
    each ("(3x3)XYZ"; "X(8x2)(3x3)ABCY";"(27x12)(20x12)(13x14)(7x10)(1x12)A";"(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN"); '"[AssertionException] .aoc2016.d9.t2"];
0N!".aoc2016.d9 passed";


//------------------------------------
//Task 12
.aoc2016.d12.input:
"cpy 41 a
inc a
inc a
dec a
jnz a 2
dec a";
if[not 42 ~ .aoc2016.d12.t1 .aoc2016.d12.input; '"[AssertionException] .aoc2016.d12.t1"];
0N!".aoc2016.d12 passed";


//------------------------------------
//Task 13
if[not 11 ~ .aoc2016.d13.t1[10;7 4]; '"[AssertionException] .aoc2016.d13.t1"];
if[not 138 ~ .aoc2016.d13.t2[1362;50]; '"[AssertionException] .aoc2016.d13.t2"];
0N!".aoc2016.d13 passed";


//------------------------------------
//Task 14
if[not 25427 ~ .aoc2016.d14.t1"yjdafjpo"; '"[AssertionException] .aoc2016.d14.t1"];
if[not 22045 ~ .aoc2016.d14.t2"yjdafjpo"; '"[AssertionException] .aoc2016.d14.t2"];
0N!".aoc2016.d14 passed";


//------------------------------------
//Task 15
.aoc2016.d15.input:"Disc #1 has 5 positions; at time=0, it is at position 4.\nDisc #2 has 2 positions; at time=0, it is at position 1.";
if[not 5 ~ .aoc2016.d15.t1 .aoc2016.d15.input; '"[AssertionException] .aoc2016.d15.t1"];
if[not 15 ~ .aoc2016.d15.t2 .aoc2016.d15.input; '"[AssertionException] .aoc2016.d15.t2"];
0N!".aoc2016.d15 passed";


//------------------------------------
//Task 16
if[not 10101001010100001b~.aoc2016.d16.t1[10001001100000001b;272]; '"[AssertionException] .aoc2016.d16.t1"];
if[not 10100001110101001b~.aoc2016.d16.t2[10001001100000001b;35651584]; '"[AssertionException] .aoc2016.d16.t2"];
0N!".aoc2016.d16 passed";


//------------------------------------
//Task 17
if[not "RLRDRDUDDR"~.aoc2016.d17.t1"rrrbmfta"; '"[AssertionException] .aoc2016.d17.t1"];
if[not 420~.aoc2016.d17.t2"rrrbmfta"; '"[AssertionException] .aoc2016.d17.t2"];
0N!".aoc2016.d17 passed";


//------------------------------------
//Task 18
if[not 2013~.aoc2016.d18.t1[".^^^.^.^^^.^.......^^.^^^^.^^^^..^^^^^.^.^^^..^^.^.^^..^.^..^^...^.^^.^^^...^^.^.^^^..^^^^.....^....";40]
    ; '"[AssertionException] .aoc2016.d18.t1"];
if[not 20006289~.aoc2016.d18.t2[".^^^.^.^^^.^.......^^.^^^^.^^^^..^^^^^.^.^^^..^^.^.^^..^.^..^^...^.^^.^^^...^^.^.^^^..^^^^.....^....";400000]
    ; '"[AssertionException] .aoc2016.d18.t2"];
0N!".aoc2016.d18 passed";


//------------------------------------
//Task 19
if[not 3 ~ .aoc2016.d19.t1 5; '"[AssertionException] .aoc2016.d19.t1 case 1"];
if[not 1842613 ~ .aoc2016.d19.t1 3018458; '"[AssertionException] .aoc2016.d19.t1 case 2"];
if[not 2 ~ .aoc2016.d19.t2 5; '"[AssertionException] .aoc2016.d19.t2 case 1"];
if[not 1424135 ~ .aoc2016.d19.t2 3018458; '"[AssertionException] .aoc2016.d19.t2 case 2"];
0N!".aoc2016.d19 passed";


//------------------------------------
//Task 20
.aoc2016.d20.input:
"5-8
0-2
4-7";
if[not 3 ~ .aoc2016.d20.t1 .aoc2016.d20.input; '"[AssertionException] .aoc2016.d20.t1"];
if[not 4294967288 ~ .aoc2016.d20.t2 .aoc2016.d20.input; '"[AssertionException] .aoc2016.d20.t2"];
0N!".aoc2016.d20 passed";


//------------------------------------
//Task 21
.aoc2016.d21.operations: ("swap position 4 with position 0"
    ;"swap letter d with letter b"
    ;"reverse positions 0 through 4"
    ;"rotate left 1 step"
    ;"move position 1 to position 4"
    ;"move position 3 to position 0"
    ;"rotate based on position of letter b"
    ;"rotate based on position of letter d");
if[not "decab"~.aoc2016.d21.t1["abcde";.aoc2016.d21.operations] ; '"[AssertionException] .aoc2016.d21.t1"];
if[not "abcde"~.aoc2016.d21.t2["decab";.aoc2016.d21.operations] ; '"[AssertionException] .aoc2016.d21.t2"];
0N!".aoc2016.d21 passed";

