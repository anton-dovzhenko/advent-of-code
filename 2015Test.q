//------------------------------------
//Task 8
if[not 1350=.aoc.d8.t1 read0 hsym`$input.dir,"2015_8.input"; '"[AssertionException] .aoc.d8.t1 case 1"];
if[not 2085=.aoc.d8.t2 read0 hsym`$input.dir,"2015_8.input"; '"[AssertionException] .aoc.d8.t2 case 1"];

//------------------------------------
//Task 11
if[not "hxbxxyzz"~.aoc.d11.t1 "hxbxwxba"; '"[AssertionException] .aoc.d11.t1 case 1"];
if[not "hxcaabcc"~.aoc.d11.t2 "hxbxwxba"; '"[AssertionException] .aoc.d11.t2 case 1"];

//------------------------------------
//Task 17
.aoc.d17.input: "33
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

if[not 1304=.aoc.d17.t1 .aoc.d17.input; '"[AssertionException] .aoc.d17.t1 case 1"];
if[not 18=.aoc.d17.t2 .aoc.d17.input; '"[AssertionException] .aoc.d17.t2 case 1"];


//------------------------------------
//Task 21
if[not 78=.aoc.d21.t1`; '"[AssertionException] .aoc.d21.t1 case 1"];
if[not 148=.aoc.d21.t2`; '"[AssertionException] .aoc.d21.t2 case 1"];


//------------------------------------
//Task 23
if[not 0=.aoc.d23.t1 "inc a\njio a, +2\ntpl a\ninc a"; '"[AssertionException] .aoc.d23.t1 case 1"];


//------------------------------------
//Task 24
if[not 11846773891=.aoc.d24.t1
    1 2 3 7 11 13 17 19 23 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113; '"[AssertionException] .aoc.d24.t1 case 1"];
if[not 80393059=.aoc.d24.t2
    1 2 3 7 11 13 17 19 23 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113; '"[AssertionException] .aoc.d24.t2 case 1"];