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