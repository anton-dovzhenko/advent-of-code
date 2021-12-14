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
//Task 6
.input.aoc2021.d6: "3,4,3,1,2";
if[not 5934 ~ .aoc2021.d6.t1 .input.aoc2021.d6; '"[AssertionException] .aoc2021.d6.t1"];
if[not 26984457539 ~ .aoc2021.d6.t2 .input.aoc2021.d6; '"[AssertionException] .aoc2021.d6.t2"];


//------------------------------------
//Task 7
.input.aoc2021.d7: "16,1,2,0,4,2,7,1,2,14";
if[not 37 ~ .aoc2021.d7.t1 .input.aoc2021.d7; '"[AssertionException] .aoc2021.d7.t1"];
if[not 168 ~ .aoc2021.d7.t2 .input.aoc2021.d7; '"[AssertionException] .aoc2021.d7.t2"];


//------------------------------------
//Task 8
.input.aoc2021.d8:
"be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce";
if[not 26 ~ .aoc2021.d8.t1 .input.aoc2021.d8; '"[AssertionException] .aoc2021.d8.t1"];
if[not 61229 ~ .aoc2021.d8.t2 .input.aoc2021.d8; '"[AssertionException] .aoc2021.d8.t2"];


//------------------------------------
//Task 9
.input.aoc2021.d9:
"2199943210
3987894921
9856789892
8767896789
9899965678";
if[not 15 ~ .aoc2021.d9.t1 .input.aoc2021.d9; '"[AssertionException] .aoc2021.d9.t1"];
if[not 1134 ~ .aoc2021.d9.t2 .input.aoc2021.d9; '"[AssertionException] .aoc2021.d9.t2"];


//------------------------------------
//Task 10
.input.aoc2021.d10:
"[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]";
if[not 26397 ~ .aoc2021.d10.t1 .input.aoc2021.d10; '"[AssertionException] .aoc2021.d10.t1"];
if[not 288957 ~ .aoc2021.d10.t2 .input.aoc2021.d10; '"[AssertionException] .aoc2021.d10.t2"];


//------------------------------------
//Task 11
.input.aoc2021.d11:
"5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526";
if[not 1656 ~ .aoc2021.d11.t1 .input.aoc2021.d11; '"[AssertionException] .aoc2021.d11.t1"];
if[not 195 ~ .aoc2021.d11.t2 .input.aoc2021.d11; '"[AssertionException] .aoc2021.d11.t2"];


//------------------------------------
//Task 12
.input.aoc2021.d12:
"start-A
start-b
A-c
A-b
b-d
A-end
b-end";
if[not 10 ~ .aoc2021.d12.t1 .input.aoc2021.d12; '"[AssertionException] .aoc2021.d12.t1"];
if[not 36 ~ .aoc2021.d12.t2 .input.aoc2021.d12; '"[AssertionException] .aoc2021.d12.t2"];


//------------------------------------
//Task 13
.input.aoc2021.d13: "6,10
0,14
9,10
0,3
10,4
4,11
6,0
6,12
4,1
0,13
10,12
3,4
3,0
8,4
1,10
2,14
8,10
9,0

fold along y=7
fold along x=5";
if[not 17 ~ .aoc2021.d13.t1 .input.aoc2021.d13; '"[AssertionException] .aoc2021.d13.t1"];


//------------------------------------
//Task 14
.input.aoc2021.d14:
"NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C";
if[not 1588 ~ .aoc2021.d14.t1 .input.aoc2021.d14; '"[AssertionException] .aoc2021.d14.t1"];
if[not 2188189693529 ~ .aoc2021.d14.t2 .input.aoc2021.d14; '"[AssertionException] .aoc2021.d14.t2"];

