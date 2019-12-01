//------------------------------------
//Task 1
.aoc2019.d1.t1: {{sum -2+ floor x%3}"J"$"\n" vs x};
.aoc2019.d1.t2: {sum {x: -2+ floor x%3; $[x<=0;0;x+.z.s x]} each "J"$"\n" vs x};