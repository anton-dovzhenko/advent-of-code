//------------------------------------
//Task 1
.aoc2022.d1.t1: {max sum each "J"$"\n" vs/: "\n\n" vs x};
.aoc2022.d1.t2: {sum 3#desc sum each "J"$"\n" vs/: "\n\n" vs x};


//------------------------------------
//Task 2
.aoc2022.d2.t1: {
    x: `$" " vs/:"\n" vs x;
    x: x^(`X`Y`Z!`A`B`C)x;
    score: (`A`B`C cross `A`B`C)!3 6 0 0 3 6 6 0 3;
    sum (score x)+(`A`B`C!1 2 3) x[;1]
 };


.aoc2022.d2.t2: {
    x: `$" " vs/:"\n" vs x;
    score: (`A`B`C cross `X`Y`Z)!3 1 2 1 2 3 2 3 1;
    sum (score x)+(`X`Y`Z!0 3 6) x[;1]
 };


//------------------------------------
//Task 3
.aoc2022.d3.t1: {
    sum ((.Q.a,.Q.A)!1+til 52) raze {distinct (inter) . (count[x] div 2) cut x} each "\n" vs x
 };


.aoc2022.d3.t2: {
    a: .Q.a,.Q.A;
    sum (a!1+til 52) raze {[a;x] a where 3=sum a in/:x}[a] each 3 cut "\n" vs x
 };
