//------------------------------------
//Task 1
.input.aoc2021.d1: "199
200
208
210
200
207
240
269
260
263";
if[not 7 ~ .aoc2021.d1.t1 .input.aoc2021.d1; '"[AssertionException] .aoc2021.d1.t1"];
if[not 5 ~ .aoc2021.d1.t2 .input.aoc2021.d1; '"[AssertionException] .aoc2021.d1.t2"];


//------------------------------------
//Task 2
.input.aoc2021.d2: "forward 5
down 5
forward 8
up 3
down 8
forward 2";
if[not 150 ~ .aoc2021.d2.t1 .input.aoc2021.d2; '"[AssertionException] .aoc2021.d2.t1"];
if[not 900 ~ .aoc2021.d2.t2 .input.aoc2021.d2; '"[AssertionException] .aoc2021.d2.t2"];



//------------------------------------
//Task 3
.input.aoc2021.d3:
"00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010";
if[not 198 ~ .aoc2021.d3.t1 .input.aoc2021.d3; '"[AssertionException] .aoc2021.d3.t1"];
if[not 230 ~ .aoc2021.d3.t2 .input.aoc2021.d3; '"[AssertionException] .aoc2021.d3.t2"];
