//------------------------------------
//Task 1
.aoc2024.d1.t1: {sum abs (-) . asc each flip "J"$"   " vs/:trim each "\n" vs x};

.aoc2024.d1.t2: {
    x:  flip "J"$"   " vs/:trim each "\n" vs x;
    L: x 0; R: x 1;
    sum L * sum each L =\: R
 };
