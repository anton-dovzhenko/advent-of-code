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