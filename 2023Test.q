//------------------------------------
//Task 1
.input.aoc2023.d1.t1: "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet";

.input.aoc2023.d1.t2: "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen";

if[not 142 ~ .aoc2023.d1.t1 .input.aoc2023.d1.t1; '"[AssertionException] .aoc2023.d1.t1"];
if[not 281 ~ .aoc2023.d1.t2 .input.aoc2023.d1.t2; '"[AssertionException] .aoc2023.d1.t2"];


//------------------------------------
//Task 5
.input.aoc2023.d5: "seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4";

if[not 35 ~ .aoc2023.d5.t1 .input.aoc2023.d5; '"[AssertionException] .aoc2023.d5.t1"];
if[not 46 ~ .aoc2023.d5.t2 .input.aoc2023.d5; '"[AssertionException] .aoc2023.d5.t2"];

//------------------------------------
//Task 7
.input.aoc2023.d7: "32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483";

if[not 6440 ~ .aoc2023.d7.t1 .input.aoc2023.d7; '"[AssertionException] .aoc2023.d7.t1"];
if[not 5905 ~ .aoc2023.d7.t2 .input.aoc2023.d7; '"[AssertionException] .aoc2023.d7.t2"];


//------------------------------------
//Task 8
.input.aoc2023.d8.t1: "LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)";

if[not 6 ~ .aoc2023.d8.t1 .input.aoc2023.d8.t1; '"[AssertionException] .aoc2023.d8.t1"];


//------------------------------------
//Task 9
.input.aoc2023.d9: "0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45";

if[not 114 ~ .aoc2023.d9.t1 .input.aoc2023.d9; '"[AssertionException] .aoc2023.d9.t1"];
if[not 2 ~ .aoc2023.d9.t2 .input.aoc2023.d9; '"[AssertionException] .aoc2023.d9.t2"];


//------------------------------------
//Task 11
.input.aoc2023.d11:
"...#......
.......#..
#.........
..........
......#...
.#........
.........#
..........
.......#..
#...#.....";

if[not 374 ~ .aoc2023.d11.t[;2] .input.aoc2023.d11; '"[AssertionException] .aoc2023.d11 case 1"];
if[not 1030 ~ .aoc2023.d11.t[;10] .input.aoc2023.d11; '"[AssertionException] .aoc2023.d11 case 2"];
if[not 8410 ~ .aoc2023.d11.t[;100] .input.aoc2023.d11; '"[AssertionException] .aoc2023.d11 case 3"];


