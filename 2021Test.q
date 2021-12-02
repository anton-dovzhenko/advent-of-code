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