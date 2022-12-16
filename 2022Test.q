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


//------------------------------------
//Task 5
.input.aoc2022.d5:
"    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2";
if[not "CMZ" ~ .aoc2022.d5.t1 .input.aoc2022.d5; '"[AssertionException] .aoc2022.d5.t1"];
if[not "MCD" ~ .aoc2022.d5.t2 .input.aoc2022.d5; '"[AssertionException] .aoc2022.d5.t2"];


//------------------------------------
//Task 6
if[not 10 ~ .aoc2022.d6.t1 "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"; '"[AssertionException] .aoc2022.d6.t1"];
if[not 29 ~ .aoc2022.d6.t2 "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"; '"[AssertionException] .aoc2022.d6.t2"];


//------------------------------------
//Task 7
.input.aoc2022.d7: "$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k";
if[not 95437 ~ .aoc2022.d7.t1 .input.aoc2022.d7; '"[AssertionException] .aoc2022.d7.t1"];
if[not 24933642 ~ .aoc2022.d7.t2 .input.aoc2022.d7; '"[AssertionException] .aoc2022.d7.t2"];


//------------------------------------
//Task 8
.input.aoc2022.d8: "30373
25512
65332
33549
35390";
if[not 21 ~ .aoc2022.d8.t1 .input.aoc2022.d8; '"[AssertionException] .aoc2022.d8.t1"];
if[not 8 ~ .aoc2022.d8.t2 .input.aoc2022.d8; '"[AssertionException] .aoc2022.d8.t2"];


//------------------------------------
//Task 9
.input.aoc2022.d9_1: "R 4\nU 4\nL 3\nD 1\nR 4\nD 1\nL 5\nR 2";
.input.aoc2022.d9_2: "R 5\nU 8\nL 8\nD 3\nR 17\nD 10\nL 25\nU 20";
if[not 13 ~ .aoc2022.d9.t1 .input.aoc2022.d9_1; '"[AssertionException] .aoc2022.d9.t1"];
if[not 36 ~ .aoc2022.d9.t2 .input.aoc2022.d9_2; '"[AssertionException] .aoc2022.d9.t2"];


//------------------------------------
//Task 10
.input.aoc2022.d10: "addx 15\naddx -11\naddx 6\naddx -3\naddx 5\naddx -1\naddx -8\naddx 13\naddx 4\nnoop\naddx -1\naddx 5\naddx -1\naddx 5\naddx -1\naddx 5\naddx -1\naddx 5\naddx -1\naddx -35\naddx 1\naddx 24\naddx -19\naddx 1\naddx 16\naddx -11\nnoop\nnoop\naddx 21\naddx -15\nnoop\nnoop\naddx -3\naddx 9\naddx 1\naddx -3\naddx 8\naddx 1\naddx 5\nnoop\nnoop\nnoop\nnoop\nnoop\naddx -36\nnoop\naddx 1\naddx 7\nnoop\nnoop\nnoop\naddx 2\naddx 6\nnoop\nnoop\nnoop\nnoop\nnoop\naddx 1\nnoop\nnoop\naddx 7\naddx 1\nnoop\naddx -13\naddx 13\naddx 7\nnoop\naddx 1\naddx -33\nnoop\nnoop\nnoop\naddx 2\nnoop\nnoop\nnoop\naddx 8\nnoop\naddx -1\naddx 2\naddx 1\nnoop\naddx 17\naddx -9\naddx 1\naddx 1\naddx -3\naddx 11\nnoop\nnoop\naddx 1\nnoop\naddx 1\nnoop\nnoop\naddx -13\naddx -19\naddx 1\naddx 3\naddx 26\naddx -30\naddx 12\naddx -1\naddx 3\naddx 1\nnoop\nnoop\nnoop\naddx -9\naddx 18\naddx 1\naddx 2\nnoop\nnoop\naddx 9\nnoop\nnoop\nnoop\naddx -1\naddx 2\naddx -37\naddx 1\naddx 3\nnoop\naddx 15\naddx -21\naddx 22\naddx -6\naddx 1\nnoop\naddx 2\naddx 1\nnoop\naddx -10\nnoop\nnoop\naddx 20\naddx 1\naddx 2\naddx 2\naddx -6\naddx -11\nnoop\nnoop\nnoop";
.output.aoc2022.d10: ("##..##..##..##..##..##..##..##..##..##..";
 "###...###...###...###...###...###...###.";
 "####....####....####....####....####....";
 "#####.....#####.....#####.....#####.....";
 "######......######......######......####";
 "#######.......#######.......#######.....");
if[not 13140 ~ .aoc2022.d10.t1 .input.aoc2022.d10; '"[AssertionException] .aoc2022.d10.t1"];
if[not .output.aoc2022.d10 ~ .aoc2022.d10.t2 .input.aoc2022.d10; '"[AssertionException] .aoc2022.d10.t2"];


//------------------------------------
//Task 11
.input.aoc2022.d11: "Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1"
if[not 10605 ~ .aoc2022.d11.t1 .input.aoc2022.d11; '"[AssertionException] .aoc2022.d11.t1"];
if[not 2713310158 ~ .aoc2022.d11.t2 .input.aoc2022.d11; '"[AssertionException] .aoc2022.d11.t2"];


//------------------------------------
//Task 12
.input.aoc2022.d12: "Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi";
if[not 31 ~ .aoc2022.d12.t1 .input.aoc2022.d12; '"[AssertionException] .aoc2022.d12.t1"];
if[not 29 ~ .aoc2022.d12.t2 .input.aoc2022.d12; '"[AssertionException] .aoc2022.d12.t2"];