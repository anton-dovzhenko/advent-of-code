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


//------------------------------------
//Task 15
.input.aoc2021.d15:
"1163751742
1381373672
2136511328
3694931569
7463417111
1319128137
1359912421
3125421639
1293138521
2311944581";
if[not 40 ~ .aoc2021.d15.t1 .input.aoc2021.d15; '"[AssertionException] .aoc2021.d15.t1"];
if[not 315 ~ .aoc2021.d15.t2 .input.aoc2021.d15; '"[AssertionException] .aoc2021.d15.t2"];


//------------------------------------
//Task 16
if[not 16 ~ .aoc2021.d16.t1 "8A004A801A8002F478"; '"[AssertionException] .aoc2021.d16.t1 case 1"];
if[not 12 ~ .aoc2021.d16.t1 "620080001611562C8802118E34"; '"[AssertionException] .aoc2021.d16.t1 case 2"];
if[not 23 ~ .aoc2021.d16.t1 "C0015000016115A2E0802F182340"; '"[AssertionException] .aoc2021.d16.t1 case 3"];
if[not 31 ~ .aoc2021.d16.t1 "A0016C880162017C3686B18A3D4780"; '"[AssertionException] .aoc2021.d16.t1 case 4"];
if[not 3 ~ .aoc2021.d16.t2 "C200B40A82"; '"[AssertionException] .aoc2021.d16.t2 case 1"];
if[not 54 ~ .aoc2021.d16.t2 "04005AC33890"; '"[AssertionException] .aoc2021.d16.t2 case 2"];
if[not 7 ~ .aoc2021.d16.t2 "880086C3E88112"; '"[AssertionException] .aoc2021.d16.t2 case 3"];
if[not 9 ~ .aoc2021.d16.t2 "CE00C43D881120"; '"[AssertionException] .aoc2021.d16.t2 case 4"];
if[not 1 ~ .aoc2021.d16.t2 "D8005AC2A8F0"; '"[AssertionException] .aoc2021.d16.t2 case 5"];
if[not 0 ~ .aoc2021.d16.t2 "F600BC2D8F"; '"[AssertionException] .aoc2021.d16.t2 case 6"];
if[not 0 ~ .aoc2021.d16.t2 "9C005AC2F8F0"; '"[AssertionException] .aoc2021.d16.t2 case 7"];
if[not 1 ~ .aoc2021.d16.t2 "9C0141080250320F1802104A08"; '"[AssertionException] .aoc2021.d16.t2 case 8"];

//------------------------------------
//Task 17
if[not 45 ~ .aoc2021.d17.t1 20 30 -10 -5; '"[AssertionException] .aoc2021.d17.t1"];
if[not 112i ~ .aoc2021.d17.t2 20 30 -10 -5; '"[AssertionException] .aoc2021.d17.t2"];


//------------------------------------
//Task 18
.input.aoc2021.d18:
"[[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
[[[5,[2,8]],4],[5,[[9,9],0]]]
[6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
[[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
[[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
[[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
[[[[5,4],[7,7]],8],[[8,3],8]]
[[9,3],[[9,9],[6,[4,9]]]]
[[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
[[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]";
if[not 4140 ~ .aoc2021.d18.t1 .input.aoc2021.d18; '"[AssertionException] .aoc2021.d18.t1"];
if[not 3993 ~ .aoc2021.d18.t2 .input.aoc2021.d18; '"[AssertionException] .aoc2021.d18.t2"];


//------------------------------------
//Task 20
.input.aoc2021.d20: "..#.#..#####.#.#.#.###.##.....###.##.#..###.####..#####..#....#..#..##..###..######.###...####..#..#####..##..#.#####...##.#.#..#.##..#.#......#.###.######.###.####...#.##.##..#..#..#####.....#.#....###..#.##......#.....#..#..#..##..#...##.######.####.####.#.#...#.......#..#.#.#...####.##.#......#..#...##.#.##..#...##.#.##..###.#......#.#.......#.#.#.####.###.##...#.....####.#..#..#.##.#....##..#.####....##...##..#...#......#.#.......#.......##..####..#...#.#.#...##..#.#..###..#####........#..####......#..#

#..#.
#....
##..#
..#..
..###";
if[not 35i ~ .aoc2021.d20.t1 .input.aoc2021.d20; '"[AssertionException] .aoc2021.d20.t1"];
if[not 3351i ~ .aoc2021.d20.t2 .input.aoc2021.d20; '"[AssertionException] .aoc2021.d20.t2"];


//------------------------------------
//Task 22
.input.aoc2021.d22set1:
"on x=10..12,y=10..12,z=10..12
on x=11..13,y=11..13,z=11..13
off x=9..11,y=9..11,z=9..11
on x=10..10,y=10..10,z=10..10";
.input.aoc2021.d22set2:
"on x=-20..26,y=-36..17,z=-47..7
on x=-20..33,y=-21..23,z=-26..28
on x=-22..28,y=-29..23,z=-38..16
on x=-46..7,y=-6..46,z=-50..-1
on x=-49..1,y=-3..46,z=-24..28
on x=2..47,y=-22..22,z=-23..27
on x=-27..23,y=-28..26,z=-21..29
on x=-39..5,y=-6..47,z=-3..44
on x=-30..21,y=-8..43,z=-13..34
on x=-22..26,y=-27..20,z=-29..19
off x=-48..-32,y=26..41,z=-47..-37
on x=-12..35,y=6..50,z=-50..-2
off x=-48..-32,y=-32..-16,z=-15..-5
on x=-18..26,y=-33..15,z=-7..46
off x=-40..-22,y=-38..-28,z=23..41
on x=-16..35,y=-41..10,z=-47..6
off x=-32..-23,y=11..30,z=-14..3
on x=-49..-5,y=-3..45,z=-29..18
off x=18..30,y=-20..-8,z=-3..13
on x=-41..9,y=-7..43,z=-33..15
on x=-54112..-39298,y=-85059..-49293,z=-27449..7877
on x=967..23432,y=45373..81175,z=27513..53682";
.input.aoc2021.d22set3:
"on x=-5..47,y=-31..22,z=-19..33
on x=-44..5,y=-27..21,z=-14..35
on x=-49..-1,y=-11..42,z=-10..38
on x=-20..34,y=-40..6,z=-44..1
off x=26..39,y=40..50,z=-2..11
on x=-41..5,y=-41..6,z=-36..8
off x=-43..-33,y=-45..-28,z=7..25
on x=-33..15,y=-32..19,z=-34..11
off x=35..47,y=-46..-34,z=-11..5
on x=-14..36,y=-6..44,z=-16..29
on x=-57795..-6158,y=29564..72030,z=20435..90618
on x=36731..105352,y=-21140..28532,z=16094..90401
on x=30999..107136,y=-53464..15513,z=8553..71215
on x=13528..83982,y=-99403..-27377,z=-24141..23996
on x=-72682..-12347,y=18159..111354,z=7391..80950
on x=-1060..80757,y=-65301..-20884,z=-103788..-16709
on x=-83015..-9461,y=-72160..-8347,z=-81239..-26856
on x=-52752..22273,y=-49450..9096,z=54442..119054
on x=-29982..40483,y=-108474..-28371,z=-24328..38471
on x=-4958..62750,y=40422..118853,z=-7672..65583
on x=55694..108686,y=-43367..46958,z=-26781..48729
on x=-98497..-18186,y=-63569..3412,z=1232..88485
on x=-726..56291,y=-62629..13224,z=18033..85226
on x=-110886..-34664,y=-81338..-8658,z=8914..63723
on x=-55829..24974,y=-16897..54165,z=-121762..-28058
on x=-65152..-11147,y=22489..91432,z=-58782..1780
on x=-120100..-32970,y=-46592..27473,z=-11695..61039
on x=-18631..37533,y=-124565..-50804,z=-35667..28308
on x=-57817..18248,y=49321..117703,z=5745..55881
on x=14781..98692,y=-1341..70827,z=15753..70151
on x=-34419..55919,y=-19626..40991,z=39015..114138
on x=-60785..11593,y=-56135..2999,z=-95368..-26915
on x=-32178..58085,y=17647..101866,z=-91405..-8878
on x=-53655..12091,y=50097..105568,z=-75335..-4862
on x=-111166..-40997,y=-71714..2688,z=5609..50954
on x=-16602..70118,y=-98693..-44401,z=5197..76897
on x=16383..101554,y=4615..83635,z=-44907..18747
off x=-95822..-15171,y=-19987..48940,z=10804..104439
on x=-89813..-14614,y=16069..88491,z=-3297..45228
on x=41075..99376,y=-20427..49978,z=-52012..13762
on x=-21330..50085,y=-17944..62733,z=-112280..-30197
on x=-16478..35915,y=36008..118594,z=-7885..47086
off x=-98156..-27851,y=-49952..43171,z=-99005..-8456
off x=2032..69770,y=-71013..4824,z=7471..94418
on x=43670..120875,y=-42068..12382,z=-24787..38892
off x=37514..111226,y=-45862..25743,z=-16714..54663
off x=25699..97951,y=-30668..59918,z=-15349..69697
off x=-44271..17935,y=-9516..60759,z=49131..112598
on x=-61695..-5813,y=40978..94975,z=8655..80240
off x=-101086..-9439,y=-7088..67543,z=33935..83858
off x=18020..114017,y=-48931..32606,z=21474..89843
off x=-77139..10506,y=-89994..-18797,z=-80..59318
off x=8476..79288,y=-75520..11602,z=-96624..-24783
on x=-47488..-1262,y=24338..100707,z=16292..72967
off x=-84341..13987,y=2429..92914,z=-90671..-1318
off x=-37810..49457,y=-71013..-7894,z=-105357..-13188
off x=-27365..46395,y=31009..98017,z=15428..76570
off x=-70369..-16548,y=22648..78696,z=-1892..86821
on x=-53470..21291,y=-120233..-33476,z=-44150..38147
off x=-93533..-4276,y=-16170..68771,z=-104985..-24507";


if[not 39 ~ .aoc2021.d22.t1 .input.aoc2021.d22set1; '"[AssertionException] .aoc2021.d22.t1 case 1"];
if[not 590784 ~ .aoc2021.d22.t1 .input.aoc2021.d22set2; '"[AssertionException] .aoc2021.d22.t1 case 2"];
if[not 2758514936282235 ~ .aoc2021.d22.t2 .input.aoc2021.d22set3; '"[AssertionException] .aoc2021.d22.t2"];




