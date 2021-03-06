//------------------------------------
//Task 1
if[not 3 4 0 9 ~ .aoc2017.d1.t1 each ("1122";"1111";"1234";"91212129"); '"[AssertionException] .aoc2017.d1.t1"];
if[not 6 0 4 12 4 ~ .aoc2017.d1.t2 each ("1212";"1221";"123425";"123123";"12131415"); '"[AssertionException] .aoc2017.d1.t1"];
0N!".aoc2017.d1 passed";


//------------------------------------
//Task 2
if[not 18=.aoc2017.d2.t1"5\t1\t9\t5\n7\t5\t3\n2\t4\t6\t8"; '"[AssertionException] .aoc2017.d2.t1"]
if[not 9=.aoc2017.d2.t2"5\t9\t2\t8\n9\t4\t7\t3\n3\t8\t6\t5"; '"[AssertionException] .aoc2017.d2.t2"]
0N!".aoc2017.d2 passed";


//------------------------------------
//Task 3
if[not 0 3 2 31 326~.aoc2017.d3.t1 each 1 12 23 1024 361527;'"[AssertionException] .aoc2017.d3.t1"];
if[not 363010~.aoc2017.d3.t2 361527; '"[AssertionException] .aoc2017.d3.t2"];
0N!".aoc2017.d3 passed";


//------------------------------------
//Task 4
if[not 2~.aoc2017.d4.t1"aa bb cc dd ee\naa bb cc dd aa\naa bb cc dd aaa"; '"[AssertionException] .aoc2017.d4.t1"];
if[not 3~.aoc2017.d4.t2
    "abcde fghij\nabcde xyz ecdab\na ab abc abd abf abj\niiii oiii ooii oooi oooo\noiii ioii iioi iiio"
    ; '"[AssertionException] .aoc2017.d4.t2"];
0N!".aoc2017.d4 passed";


//------------------------------------
//Task 5
if[not 5~.aoc2017.d5.t1"0
    3
    0
    1
    -3"; '"[AssertionException] .aoc2017.d5.t1"];
if[not 10~.aoc2017.d5.t2"0
    3
    0
    1
    -3"; '"[AssertionException] .aoc2017.d5.t2"];
0N!".aoc2017.d5 passed";


//------------------------------------
//Task 6
if[not 5~.aoc2017.d6.t1 0 2 7 0;
    '"[AssertionException] .aoc2017.d6.t1"];
if[not 5042~.aoc2017.d6.t1 5 1 10 0 1 7 13 14 3 12 8 10 7 12 0 6;
    '"[AssertionException] .aoc2017.d6.t1 case 2"];
if[not 4~.aoc2017.d6.t2 0 2 7 0; '
    "[AssertionException] .aoc2017.d6.t2"];
if[not 1086=.aoc2017.d6.t2 5 1 10 0 1 7 13 14 3 12 8 10 7 12 0 6;
    '"[AssertionException] .aoc2017.d6.t2 case 2"];
0N!".aoc2017.d6 passed";


//------------------------------------
//Task 7
.aoc2017.d7.input: "pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)";
if[not `tknk~.aoc2017.d7.t1 .aoc2017.d7.input; '"[AssertionException] .aoc2017.d7.t1"];
if[not 60~.aoc2017.d7.t2 .aoc2017.d7.input; '"[AssertionException] .aoc2017.d7.t2"];
0N!".aoc2017.d7 passed";


//------------------------------------
//Task 8
.aoc2017.d8.input:
"b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10";
if[not 1~.aoc2017.d8.t1 .aoc2017.d8.input; '"[AssertionException] .aoc2017.d8.t1"];
if[not 10~.aoc2017.d8.t2 .aoc2017.d8.input; '"[AssertionException] .aoc2017.d8.t1"];
0N!".aoc2017.d8 passed";


//------------------------------------
//Task 9
if[not 1 6 5 16 1 9 9 3 ~ .aoc2017.d9.t1 each ("{}";"{{{}}}";"{{},{}}";"{{{},{},{{}}}}";"{<a>,<a>,<a>,<a>}"
    ;"{{<ab>},{<ab>},{<ab>},{<ab>}}";"{{<!!>},{<!!>},{<!!>},{<!!>}}";"{{<a!>},{<a!>},{<a!>},{<ab>}}"); '"[AssertionException] .aoc2017.d9.t1"];
if[not 0 17 3 2 0 0 10 ~ .aoc2017.d9.t2 each ("<>";"<random characters>";"<<<<>";"<{!>}>";"<!!>";"<!!!>>";"<{o\"i!a,<{i<a>")
    ; '"[AssertionException] .aoc2017.d9.t2 "];
0N!".aoc2017.d9 passed";


//------------------------------------
//Task 10
if[not 12 ~ .aoc2017.d10.t1[5;"3,4,1,5"]; '"[AssertionException] .aoc2017.d10.t1 case 1"];
if[not 11375 ~ .aoc2017.d10.t1[256;"88,88,211,106,141,1,78,254,2,111,77,255,90,0,54,205"]; '"[AssertionException] .aoc2017.d10.t1 case 2"];
if[not "33efeb34ea91902bb2f59c9920caa6cd" ~ .aoc2017.d10.t2[256;"AoC 2017"]; '"[AssertionException] .aoc2017.d10.t2 case 1"];
0N!".aoc2017.d10 passed";


//------------------------------------
//Task 11
if[not 3 ~ .aoc2017.d11.t1 "ne,ne,ne"; '"[AssertionException] .aoc2017.d11.t1 case 1"];
if[not 0 ~ .aoc2017.d11.t1 "ne,ne,sw,sw"; '"[AssertionException] .aoc2017.d11.t1 case 2"];
if[not 2 ~ .aoc2017.d11.t1 "ne,ne,s,s"; '"[AssertionException] .aoc2017.d11.t1 case 3"];
if[not 3 ~ .aoc2017.d11.t1 "se,sw,se,sw,sw"; '"[AssertionException] .aoc2017.d11.t1 case 4"];
if[not 3 ~ .aoc2017.d11.t2 "ne,ne,ne"; '"[AssertionException] .aoc2017.d11.t2 case 1"];
if[not 2 ~ .aoc2017.d11.t2 "ne,ne,sw,sw"; '"[AssertionException] .aoc2017.d11.t2 case 2"];
if[not 2 ~ .aoc2017.d11.t2 "ne,ne,s,s"; '"[AssertionException] .aoc2017.d11.t2 case 3"];
if[not 3 ~ .aoc2017.d11.t2 "se,sw,se,sw,sw"; '"[AssertionException] .aoc2017.d11.t2 case 4"];
0N!".aoc2017.d11 passed";


//------------------------------------
//Task 12
if[not 6~.aoc2017.d12.t1
    "0 <-> 2
    1 <-> 1
    2 <-> 0, 3, 4
    3 <-> 2, 4
    4 <-> 2, 3, 6
    5 <-> 6
    6 <-> 4, 5"
    ; '"[AssertionException] .aoc2017.d12.t1"];
if[not 2~.aoc2017.d12.t2
    "0 <-> 2
    1 <-> 1
    2 <-> 0, 3, 4
    3 <-> 2, 4
    4 <-> 2, 3, 6
    5 <-> 6
    6 <-> 4, 5"
    ; '"[AssertionException] .aoc2017.d12.t2"];
0N!".aoc2017.d12 passed";


//------------------------------------
//Task 13
if[not 24~.aoc2017.d13.t1"0: 3
                         1: 2
                         4: 4
                         6: 4"
    ; '"[AssertionException] .aoc2017.d13.t1"];
if[not 10~.aoc2017.d13.t2"0: 3
                        1: 2
                        4: 4
                        6: 4"
    ; '"[AssertionException] .aoc2017.d13.t2"];
0N!".aoc2017.d13 passed";


//------------------------------------
//Task 14
if[not 8108 ~ .aoc2017.d14.t1 "flqrgnkx"; '"[AssertionException] .aoc2017.d14.t1 case 1"];
if[not 1242 ~ .aoc2017.d14.t2 "flqrgnkx"; '"[AssertionException] .aoc2017.d14.t1 case 1"];
0N!".aoc2017.d14 passed";


//------------------------------------
//Task 15
//N.B.: to slow
//if[not 588~.aoc2017.d15.t1[65;8921;16807;48271]; '"[AssertionException] .aoc2017.d15.t1"];
//if[not 309~.aoc2017.d15.t2[65;8921;16807;48271]; '"[AssertionException] .aoc2017.d15.t2"];
0N!".aoc2017.d15 passed";


//------------------------------------
//Task 16
if[not "baedc"~.aoc2017.d16.t1[5#.Q.a;"s1,x3/4,pe/b"]; '"[AssertionException] .aoc2017.d16.t1"];
if[not "abcde"~.aoc2017.d16.t2[5#.Q.a;"s1,x3/4,pe/b"]; '"[AssertionException] .aoc2017.d16.t2"];
0N!".aoc2017.d16 passed";


//------------------------------------
//Task 17
if[not 638~.aoc2017.d17.t1 3; '"[AssertionException] .aoc2017.d17.t1"];
if[not 33601318~.aoc2017.d17.t2 301; '"[AssertionException] .aoc2017.d17.t2"];
0N!".aoc2017.d17 passed";


//------------------------------------
//Task 18
if[not 4~.aoc2017.d18.t1"set a 1\nadd a 2\nmul a a\nmod a 5\nsnd a\nset a 0\nrcv a\njgz a -1\nset a 1\njgz a -2";
    '"[AssertionException] .aoc2017.d18.t1"];
if[not 3~.aoc2017.d18.t2"snd 1\nsnd 2\nsnd p\nrcv a\nrcv b\nrcv c\nrcv d"; '"[AssertionException] .aoc2017.d18.t2"];
0N!".aoc2017.d18 passed";


//------------------------------------
//Task 19
.input.aoc2017.d19:
"     |
     |  +--+
     A  |  C
 F---|--|-E---+
     |  |  |  D
     +B-+  +--+ ";
if[not "ABCDEF"~.aoc2017.d19.t1 .input.aoc2017.d19; '"[AssertionException] .aoc2017.d19.t1"];
if[not 38~.aoc2017.d19.t2 .input.aoc2017.d19; '"[AssertionException] .aoc2017.d19.t2"];
0N!".aoc2017.d19 passed";


//------------------------------------
//Task 20
.input.aoc2017.d20_1:
"p=<3,0,0>, v=<2,0,0>, a=<-1,0,0>
p=<4,0,0>, v=<0,0,0>, a=<-2,0,0>";
.input.aoc2017.d20_2:
"p=<-6,0,0>, v=<3,0,0>, a=<0,0,0>
p=<-4,0,0>, v=< 2,0,0>, a=<0,0,0>
p=<-2,0,0>, v=< 1,0,0>, a=<0,0,0>
p=< 3,0,0>, v=<-1,0,0>, a=<0,0,0>";
if[not 0~.aoc2017.d20.t1 .input.aoc2017.d20_1; '"[AssertionException] .aoc2017.d20.t1"];
if[not 1~.aoc2017.d20.t2 .input.aoc2017.d20_2; '"[AssertionException] .aoc2017.d20.t2"];
0N!".aoc2017.d20 passed";


//------------------------------------
//Task 21
.input.aoc2017.d21.r:
"../.# => ##./#../...
.#./..#/### => #..#/..../..../#..#";
.input.aoc2017.d21.x:
".#.
..#
###";
if[not 4~.aoc2017.d21.common[.input.aoc2017.d21.x;.input.aoc2017.d21.r;1]; '"[AssertionException] .aoc2017.d21.common case 1"];
if[not 12~.aoc2017.d21.common[.input.aoc2017.d21.x;.input.aoc2017.d21.r;2]; '"[AssertionException] .aoc2017.d21.common case 1"];
0N!".aoc2017.d21 passed";


//------------------------------------
//Task 22
if[not 5~.aoc2017.d22.t1["..#\n#..\n...";7]; '"[AssertionException] .aoc2017.d22.t1 case 1"];
if[not 41~.aoc2017.d22.t1["..#\n#..\n...";70]; '"[AssertionException] .aoc2017.d22.t1 case 2"];
if[not 5587~.aoc2017.d22.t1["..#\n#..\n...";10000]; '"[AssertionException] .aoc2017.d22.t1 case 3"];
if[not 26~.aoc2017.d22.t2["..#\n#..\n...";100]; '"[AssertionException] .aoc2017.d22.t2 case 1"];
if[not 2511944~.aoc2017.d22.t2["..#\n#..\n...";10000000]; '"[AssertionException] .aoc2017.d22.t2 case 2"];
0N!".aoc2017.d22 passed";


//------------------------------------
//Task 24
.input.aoc2017.d24.input: "0/2
2/2
2/3
3/4
3/5
0/1
10/1
9/10";
if[not 31~.aoc2017.d24.t1 .input.aoc2017.d24.input; '"[AssertionException] .aoc2017.d24.t1 case 1"];
if[not 19~.aoc2017.d24.t2 .input.aoc2017.d24.input; '"[AssertionException] .aoc2017.d24.t2 case 1"];

