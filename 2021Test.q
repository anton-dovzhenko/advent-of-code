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


//------------------------------------
//Task 4
.input.aoc2021.d4:
"7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7";
if[not 4512 ~ .aoc2021.d4.t1 .input.aoc2021.d4; '"[AssertionException] .aoc2021.d4.t1"];
if[not 1924 ~ .aoc2021.d4.t2 .input.aoc2021.d4; '"[AssertionException] .aoc2021.d4.t2"];


//------------------------------------
//Task 5
.input.aoc2021.d5:
"0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2";
if[not 5i ~ .aoc2021.d5.t1 .input.aoc2021.d5; '"[AssertionException] .aoc2021.d5.t1"];
if[not 12i ~ .aoc2021.d5.t2 .input.aoc2021.d5; '"[AssertionException] .aoc2021.d5.t2"];


//------------------------------------
//Task 5
.input.aoc2021.d6: "3,4,3,1,2";
if[not 5934 ~ .aoc2021.d6.t1 .input.aoc2021.d6; '"[AssertionException] .aoc2021.d6.t1"];
if[not 26984457539 ~ .aoc2021.d6.t2 .input.aoc2021.d6; '"[AssertionException] .aoc2021.d6.t2"];


