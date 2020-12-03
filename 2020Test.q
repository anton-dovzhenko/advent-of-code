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
if[not 7 ~ .aoc2020.d3.t1 .input.aoc2020.d3; '"[AssertionException] .aoc2020.d2.d3"];
if[not 336 ~ .aoc2020.d3.t2 .input.aoc2020.d3; '"[AssertionException] .aoc2020.d2.d3"];
0N!".aoc2020.d3 passed";
