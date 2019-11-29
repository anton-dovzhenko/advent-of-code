//------------------------------------
//Task 1
if[not 0 0 3 3 3 -1 -1 -3 -3~.aoc2015.d1.t1 each ("(())";"()()";"(((";"(()(()(";"))(((((";"())";"))(";")))";")())())");
    '"[AssertionException] .aoc2015.d1.t1"];
if[not 1 5~.aoc2015.d1.t2 each (enlist")";"()())");
    '"[AssertionException] .aoc2015.d1.t2"];
0N!".aoc2015.d1 passed";


//------------------------------------
//Task 2
if[not 101~.aoc2015.d2.t1 "2x3x4\n1x1x10";'"[AssertionException] .aoc2015.d2.t1"];
if[not 48~.aoc2015.d2.t2 "2x3x4\n1x1x10";'"[AssertionException] .aoc2015.d2.t2"];
0N!".aoc2015.d2 passed";


//------------------------------------
//Task 3
if[not 2 4 2~.aoc2015.d3.t1 each (">";"^>v<";"^v^v^v^v^v") ;'"[AssertionException] .aoc2015.d3.t1"];
if[not 3 3 11~.aoc2015.d3.t2 each ("^v";"^>v<";"^v^v^v^v^v");'"[AssertionException] .aoc2015.d3.t2"];
0N!".aoc2015.d3 passed";


//------------------------------------
//Task 4
if[not 609043 346386 ~ .aoc2015.d4.t1 each ("abcdef";"iwrupvqb");'"[AssertionException] .aoc2015.d4.t1"];
if[not 3 3 11~.aoc2015.d3.t2 each ("^v";"^>v<";"^v^v^v^v^v");'"[AssertionException] .aoc2015.d4.t2"];
0N!".aoc2015.d4 passed";


//------------------------------------
//Task 8
if[not 1350=.aoc2015.d8.t1 read0 hsym`$input.dir,"2015_8.input"; '"[AssertionException] .aoc2015.d8.t1 case 1"];
if[not 2085=.aoc2015.d8.t2 read0 hsym`$input.dir,"2015_8.input"; '"[AssertionException] .aoc2015.d8.t2 case 1"];

//------------------------------------
//Task 11
if[not "hxbxxyzz"~.aoc2015.d11.t1 "hxbxwxba"; '"[AssertionException] .aoc2015.d11.t1 case 1"];
if[not "hxcaabcc"~.aoc2015.d11.t2 "hxbxwxba"; '"[AssertionException] .aoc2015.d11.t2 case 1"];

//------------------------------------
//Task 17
.aoc2015.d17.input: "33
14
18
20
45
35
16
35
1
13
18
13
50
44
48
6
24
41
30
42";

if[not 1304=.aoc2015.d17.t1 .aoc2015.d17.input; '"[AssertionException] .aoc2015.d17.t1 case 1"];
if[not 18=.aoc2015.d17.t2 .aoc2015.d17.input; '"[AssertionException] .aoc2015.d17.t2 case 1"];


//------------------------------------
//Task 21
if[not 78=.aoc2015.d21.t1`; '"[AssertionException] .aoc2015.d21.t1 case 1"];
if[not 148=.aoc2015.d21.t2`; '"[AssertionException] .aoc2015.d21.t2 case 1"];


//------------------------------------
//Task 22
if[not 1269~.aoc2015.d22.t1[50;500;58;9]; '"[AssertionException] .aoc2015.d22.t1"];
if[not 1309~.aoc2015.d22.t2[50;500;58;9]; '"[AssertionException] .aoc2015.d22.t2"];
0N!".aoc2015.d22 passed";


//------------------------------------
//Task 23
if[not 0=.aoc2015.d23.t1 "inc a\njio a, +2\ntpl a\ninc a"; '"[AssertionException] .aoc2015.d23.t1 case 1"];


//------------------------------------
//Task 24
if[not 11846773891=.aoc2015.d24.t1
    1 2 3 7 11 13 17 19 23 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113; '"[AssertionException] .aoc2015.d24.t1 case 1"];
if[not 80393059=.aoc2015.d24.t2
    1 2 3 7 11 13 17 19 23 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113; '"[AssertionException] .aoc2015.d24.t2 case 1"];


//------------------------------------
//Task 25
if[not 9132360~.aoc2015.d25.t1[2981;3075]; '"[AssertionException] .aoc2015.d25"];
0N!".aoc2015.d22 passed";