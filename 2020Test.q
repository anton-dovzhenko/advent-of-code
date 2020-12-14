//------------------------------------
//Task 1
if[not 514579 ~ .aoc2020.d1.t1 1721 979 366 299 675 1456; '"[AssertionException] .aoc2020.d1.t1"];
if[not 241861950 ~ .aoc2020.d1.t2 1721 979 366 299 675 1456; '"[AssertionException] .aoc2020.d1.t2"];
0N!".aoc2020.d1 passed";


//------------------------------------
//Task 2
.input.aoc2020.d2:
"1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc";
if[not 2i ~ .aoc2020.d2.t1 .input.aoc2020.d2; '"[AssertionException] .aoc2020.d2.t1"];
if[not 1i ~ .aoc2020.d2.t2 .input.aoc2020.d2; '"[AssertionException] .aoc2020.d2.t2"];
0N!".aoc2020.d2 passed";

//------------------------------------
//Task 3
.input.aoc2020.d3:
"..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#";
if[not 7 ~ .aoc2020.d3.t1 .input.aoc2020.d3; '"[AssertionException] .aoc2020.d3.t1"];
if[not 336 ~ .aoc2020.d3.t2 .input.aoc2020.d3; '"[AssertionException] .aoc2020.d3.t2"];
0N!".aoc2020.d3 passed";


//------------------------------------
//Task 4
.input.aoc2020.d4.task1: "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in";

.input.aoc2020.d4.invalid: "eyr:1972 cid:100
hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

iyr:2019
hcl:#602927 eyr:1967 hgt:170cm
ecl:grn pid:012533040 byr:1946

hcl:dab227 iyr:2012
ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

hgt:59cm ecl:zzz
eyr:2038 hcl:74454a iyr:2023
pid:3556412378 byr:2007";
.input.aoc2020.d4.valid: "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
hcl:#623a2f

eyr:2029 ecl:blu cid:129 byr:1989
iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

hcl:#888785
hgt:164cm byr:2001 iyr:2015 cid:88
pid:545766238 ecl:hzl
eyr:2022

iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719";


if[not 2 ~ .aoc2020.d4.t1 .input.aoc2020.d4.task1; '"[AssertionException] .aoc2020.d4.task1"];
if[not 0 ~ .aoc2020.d4.t2 .input.aoc2020.d4.invalid; '"[AssertionException] .aoc2020.d4.task2_invalid"];
if[not 4 ~ .aoc2020.d4.t2 .input.aoc2020.d4.valid; '"[AssertionException] .aoc2020.d4.task2_valid"];


//------------------------------------
//Task 5
if[not 820 ~ .aoc2020.d5.t1 "BFFFBBFRRR\nFFFBBBFRRR\nBBFFBBFRLL"; '"[AssertionException] .aoc2020.d5.task1"];


//------------------------------------
//Task 6
.input.aoc2020.d6:
"abc

a
b
c

ab
ac

a
a
a
a

b";
if[not 11 ~ .aoc2020.d6.t1 .input.aoc2020.d6; '"[AssertionException] .aoc2020.d6.task1"];
if[not 6 ~ .aoc2020.d6.t2 .input.aoc2020.d6; '"[AssertionException] .aoc2020.d6.task2"];


//------------------------------------
//Task 7
.input.aoc2020.d7: "light red bags contain 1 bright white bag, 2 muted yellow bags.
dark orange bags contain 3 bright white bags, 4 muted yellow bags.
bright white bags contain 1 shiny gold bag.
muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
dark olive bags contain 3 faded blue bags, 4 dotted black bags.
vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
faded blue bags contain no other bags.
dotted black bags contain no other bags.";
if[not 4 ~ .aoc2020.d7.t1 .input.aoc2020.d7; '"[AssertionException] .aoc2020.d7.task1"];
if[not 32 ~ .aoc2020.d7.t2 .input.aoc2020.d7; '"[AssertionException] .aoc2020.d7.task2"];
if[not 32 ~ .aoc2020.d7.t2_v2 .input.aoc2020.d7; '"[AssertionException] .aoc2020.d7.v2task2"];


//------------------------------------
//Task 8
.input.aoc2020.d8: "nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6";
if[not 5 ~ .aoc2020.d8.t1 .input.aoc2020.d8; '"[AssertionException] .aoc2020.d8.task1"];
if[not 8 ~ .aoc2020.d8.t2 .input.aoc2020.d8; '"[AssertionException] .aoc2020.d8.task2"];


//------------------------------------
//Task 9
.input.aoc2020.d9: "35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576";
if[not 127 ~ .aoc2020.d9.t1[.input.aoc2020.d9;5]; '"[AssertionException] .aoc2020.d9.task1"];
if[not 62 ~ .aoc2020.d9.t2[.input.aoc2020.d9;5]; '"[AssertionException] .aoc2020.d9.task2"];


//------------------------------------
//Task 10
.input.aoc2020.d10_1: "16\n10\n15\n5\n1\n11\n7\n19\n6\n12\n4";
.input.aoc2020.d10_2: "28\n33\n18\n42\n31\n14\n46\n20\n48\n47\n24\n23\n49\n45\n19\n38\n39\n11\n1\n32\n25\n35\n8\n17\n7\n9\n4\n2\n34\n10\n3";
if[not 35 ~ .aoc2020.d10.t1 .input.aoc2020.d10_1; '"[AssertionException] .aoc2020.d10.task1_1"];
if[not 220 ~ .aoc2020.d10.t1 .input.aoc2020.d10_2; '"[AssertionException] .aoc2020.d10.task1_2"];
if[not 8 ~ .aoc2020.d10.t2 .input.aoc2020.d10_1; '"[AssertionException] .aoc2020.d10.task2_1"];
if[not 19208 ~ .aoc2020.d10.t2 .input.aoc2020.d10_2; '"[AssertionException] .aoc2020.d10.task2_2"];
if[not 8 ~ .aoc2020.d10.t2_v2 .input.aoc2020.d10_1; '"[AssertionException] .aoc2020.d10.task2_1_v2"];
if[not 19208 ~ .aoc2020.d10.t2_v2 .input.aoc2020.d10_2; '"[AssertionException] .aoc2020.d10.task2_2_v2"];


//------------------------------------
//Task 11
.input.aoc2020.d11: "L.LL.LL.LL
LLLLLLL.LL
L.L.L..L..
LLLL.LL.LL
L.LL.LL.LL
L.LLLLL.LL
..L.L.....
LLLLLLLLLL
L.LLLLLL.L
L.LLLLL.LL";
if[not 37 ~ .aoc2020.d11.t1 .input.aoc2020.d11; '"[AssertionException] .aoc2020.d11.task1"];
if[not 26 ~ .aoc2020.d11.t2 .input.aoc2020.d11; '"[AssertionException] .aoc2020.d11.task2"];


//------------------------------------
//Task 12
.input.aoc2020.d12: "F10\nN3\nF7\nR90\nF11";
if[not 25 ~ .aoc2020.d12.t1 .input.aoc2020.d12; '"[AssertionException] .aoc2020.d12.task1"];
if[not 286 ~ .aoc2020.d12.t2 .input.aoc2020.d12; '"[AssertionException] .aoc2020.d12.task2"];


//------------------------------------
//Task 13
.input.aoc2020.d13:
"939
7,13,x,x,59,x,31,19";
if[not 295 ~ .aoc2020.d13.t1 .input.aoc2020.d13; '"[AssertionException] .aoc2020.d13.task1"];
if[not 1068781 ~ .aoc2020.d13.t2 .input.aoc2020.d13; '"[AssertionException] .aoc2020.d13.task2"];


//------------------------------------
//Task 14
.input.aoc2020.d14.task1:
"mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
mem[8] = 11
mem[7] = 101
mem[8] = 0";
.input.aoc2020.d14.task2:
"mask = 000000000000000000000000000000X1001X
mem[42] = 100
mask = 00000000000000000000000000000000X0XX
mem[26] = 1";
if[not 165 ~ .aoc2020.d14.t1 .input.aoc2020.d14.task1; '"[AssertionException] .aoc2020.d14.task1"];
if[not 208 ~ .aoc2020.d14.t2 .input.aoc2020.d14.task2; '"[AssertionException] .aoc2020.d14.task2"];

