//------------------------------------
//Task 1
.aoc2021.d1.t1: {-1+sum 0<deltas "J"$"\n" vs x};
.aoc2021.d1.t2: {-1+sum 0<deltas 2_3 msum "J"$"\n" vs x};


//------------------------------------
//Task 2
.aoc2021.d2.t1: {
    x: flip update `$c, "J"$u from `c`u!flip " " vs/:"\n" vs x;
    x: update (`forward`down`up!(1 0;0 -1;0 1))c from x;
    prd abs exec sum c*u from x
 };


.aoc2021.d2.t2: {
    x: flip " " vs/:"\n" vs x;
    x[0]: `$x[0];
    x[1]: "J"$x[1];
    x: flip x;
    x: {[x;y]
        if[`down=y[0]; :x + (y[1];0;0)];
        if[`up=y[0]; :x - (y[1];0;0)];
        x + (0;y 1; x[0]*y 1)
    } over (enlist 0 0 0), x;
    prd x 1 2
 };