//------------------------------------
//Task 1
.input.aoc2022.d1: "1000
2000
3000

4000

5000
6000

7000
8000
9000

10000";
if[not 24000 ~ .aoc2022.d1.t1 .input.aoc2022.d1; '"[AssertionException] .aoc2022.d1.t1"];
if[not 45000 ~ .aoc2022.d1.t2 .input.aoc2022.d1; '"[AssertionException] .aoc2022.d1.t2"];


//------------------------------------
//Task 2
.input.aoc2022.d2: "A Y
B X
C Z";
if[not 15 ~ .aoc2022.d2.t1 .input.aoc2022.d2; '"[AssertionException] .aoc2022.d2.t1"];
if[not 12 ~ .aoc2022.d2.t2 .input.aoc2022.d2; '"[AssertionException] .aoc2022.d2.t2"];


//------------------------------------
//Task 3
.input.aoc2022.d3: "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw";
if[not 157 ~ .aoc2022.d3.t1 .input.aoc2022.d3; '"[AssertionException] .aoc2022.d3.t1"];
if[not 70 ~ .aoc2022.d3.t2 .input.aoc2022.d3; '"[AssertionException] .aoc2022.d3.t2"];

//------------------------------------
//Task 4
.input.aoc2022.d4: "2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8";
if[not 2 ~ .aoc2022.d4.t1 .input.aoc2022.d4; '"[AssertionException] .aoc2022.d4.t1"];
if[not 4 ~ .aoc2022.d4.t2 .input.aoc2022.d4; '"[AssertionException] .aoc2022.d4.t2"];