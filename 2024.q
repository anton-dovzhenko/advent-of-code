//------------------------------------
//Task 1
.aoc2024.d1.t1: {sum abs (-) . asc each flip "J"$"   " vs/:trim each "\n" vs x};

.aoc2024.d1.t2: {
    x:  flip "J"$"   " vs/:trim each "\n" vs x;
    L: x 0; R: x 1;
    sum L * sum each L =\: R
 };


//------------------------------------
//Task 2
.aoc2024.d2.t1: {
    x: "J"$" " vs/:trim each "\n" vs x;
    x: 1_'deltas each x;
    `long$sum (all each abs[x] <= 3)&(1=count each group each signum x)
 };

.aoc2024.d2.t2: {
    x: "J"$" " vs/:trim each "\n" vs x;
    x: (enlist each x),'{x@/:where each not 2 vs 2 xexp til count x} each x;
    x: (1_'') (deltas'')x;
    `long$sum {any (all each abs[x] <= 3)&(1=count each group each signum x)} each x
 };
