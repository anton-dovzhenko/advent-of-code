//------------------------------------
//Task 6
if[not 17=.aoc.d6.t1("1, 1";"1, 6";"8, 3";"3, 4";"5, 5";"8, 9"); '"[AssertionException] .aoc.d6.t1"];
if[not 16=.aoc.d6.t2[("1, 1";"1, 6";"8, 3";"3, 4";"5, 5";"8, 9");32]; '"[AssertionException] .aoc.d6.t2"];

//------------------------------------
//Task 7
if[not "CABDFE"~.aoc.topSort("CA";"CF";"AB";"AD";"BE";"DE";"FE"); '"[AssertionException] .aoc.topSort"];

//------------------------------------
//Task 8
if[not 138=.aoc.d8.t1"2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2"; '"[AssertionException] .aoc.d8.t1"];
if[not 66=.aoc.d8.t1"2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2"; '"[AssertionException] .aoc.d8.t2"];

//------------------------------------
//Task 9
if[not 8317=.aoc.d9.t1[10;1618]; '"[AssertionException] .aoc.d9.t1"];
if[not 146373=.aoc.d9.t1[13;7999]; '"[AssertionException] .aoc.d9.t1"];
if[not 2764=.aoc.d9.t1[17;1104]; '"[AssertionException] .aoc.d9.t1"];
if[not 54718=.aoc.d9.t1[21;6111]; '"[AssertionException] .aoc.d9.t1"];
if[not 37305=.aoc.d9.t1[30;5807]; '"[AssertionException] .aoc.d9.t1"];
if[not 3349098263=.aoc.d9.t1[427;7072300]; '"[AssertionException] .aoc.d9.t2"];

//------------------------------------
//Task 11
if[not (`energy`x`y`size!enlist each(29;33;45;3))~flip .aoc.d11.t1[300;18;3]; '"[AssertionException] .aoc.d11.t1 case 1"];
if[not (`energy`x`y`size!enlist each(30;21;61;3))~flip .aoc.d11.t1[300;42;3]; '"[AssertionException] .aoc.d11.t1 case 2"];
if[not (`energy`x`y`size!enlist each(30;20;58;3))~flip .aoc.d11.t1[300;6392;3]; '"[AssertionException] .aoc.d11.t1 case 3"];
if[not (`energy`x`y`size!enlist each(83;233;268;13))~flip .aoc.d11.t2[300;6392]; '"[AssertionException] .aoc.d11.t2"];

//------------------------------------
//Task 12
if[not 325=.aoc.d12.t1[input.dir,"2018_12.input0";20]; '"[AssertionException] .aoc.d12.t1 case 1"];
if[not 3258=.aoc.d12.t1[input.dir,"2018_12.input";20]; '"[AssertionException] .aoc.d12.t1 case 2"];

//------------------------------------
//Task 13
if[not "7,3"~.aoc.d13.t1[input.dir,"2018_13.input0"]; '"[AssertionException] .aoc.d13.t1 case 1"];
if[not "16,45"~.aoc.d13.t1[input.dir,"2018_13.input"]; '"[AssertionException] .aoc.d13.t1 case 2"];
if[not "6,4"~.aoc.d13.t2[input.dir,"2018_13.input1"]; '"[AssertionException] .aoc.d13.t2 case 1"];

//------------------------------------
//Task 14
if[not"5158916779"~.aoc.d14.t1[3 7;0 1;9;10]; '"[AssertionException] .aoc.d13.t1 case 1"];
if[not"0124515891"~.aoc.d14.t1[3 7;0 1;5;10]; '"[AssertionException] .aoc.d13.t1 case 2"];
if[not"9251071085"~.aoc.d14.t1[3 7;0 1;18;10]; '"[AssertionException] .aoc.d13.t1 case 3"];
if[not"5941429882"~.aoc.d14.t1[3 7;0 1;2018;10]; '"[AssertionException] .aoc.d13.t1 case 4"];
if[not 9=.aoc.d14.t2[3 7;"51589"]; '"[AssertionException] .aoc.d13.t2 case 1"];
if[not 5=.aoc.d14.t2[3 7;"01245"]; '"[AssertionException] .aoc.d13.t2 case 2"];
if[not 18=.aoc.d14.t2[3 7;"92510"]; '"[AssertionException] .aoc.d13.t2 case 3"];
if[not 2018=.aoc.d14.t2[3 7;"59414"]; '"[AssertionException] .aoc.d13.t2 case 4"];

//------------------------------------
//Task 16
if[not 500=.aoc.d16.t1 3296#read0 hsym`$input.dir,"2018_16.input"; '"[AssertionException] .aoc.d16.t1 case 1"];
if[not 533=.aoc.d16.t2[3296#read0 hsym`$input.dir,"2018_16.input";3298_read0 hsym`$input.dir,"2018_16.input"]
    ; '"[AssertionException] .aoc.d16.t2 case 1"];

//------------------------------------
//Task 18
if[not 1147=.aoc.d18.t1[read0 hsym`$input.dir,"2018_18.input0";10]; '"[AssertionException] .aoc.d18.t1 case 1"];
if[not 466312=.aoc.d18.t1[read0 hsym`$input.dir,"2018_18.input";10]; '"[AssertionException] .aoc.d18.t1 case 2"];
if[not 176782=.aoc.d18.t2[read0 hsym`$input.dir,"2018_18.input";1000000000]; '"[AssertionException] .aoc.d18.t2 case 1"];


//------------------------------------
//Task 25
if[not 8=.aoc.d25.t1[read0 hsym`$input.dir,"2018_25.input0"]; '"[AssertionException] .aoc.d18.d25 case 1"];
if[not 425=.aoc.d25.t1[read0 hsym`$input.dir,"2018_25.input"]; '"[AssertionException] .aoc.d18.d25 case 2"];