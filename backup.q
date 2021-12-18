
{
    x: "\n\n" vs x;
    R: ssr[;"\"";""] each"\n" vs x 0;
    m: `$"\n" vs x 1;
    R: flip `n`r!flip ": " vs/:R;

    R: ungroup `$update " | "vs/:r from R;
    R: update `$" "vs/:string r from R;
    R: update `g#n from R;

    Rules: exec r from R where n=`0;
    .temp.letters: `g#`$/:.Q.a;

    Rules: {[R;Rules]
        0N!Rules;
        Rules: raze {[R;x] {x cross y} over  {[R;x] $[all string[x] in .Q.a;x;exec r from R where n=x] }[R] each x}[R] each Rules;
        Rules: {$[all x in .temp.letters;`$raze string x;x] }each Rules;
        Rules: distinct Rules;
        Rules
        }[R] over Rules;


    sum m in Rules


}P



{

    x: "\n\n" vs x;
    x: flip `t`m ! flip {x:"\n" vs x; ("J"$-1 _ last " " vs first x;1_x) }each x;
    x: update sides: enlist each first each m from x;
    x: update sides: (sides,'enlist each last each m) from x;
    x: update sides: (sides,'enlist each {x[;0]} each m) from x;
    x: update sides: (sides,'enlist each {last each x} each m) from x;
    x: update sides: {x:"#"=x; (2 sv/:x), (2 sv/:reverse each x)}each sides from x;
    S: raze x`sides;
    x: 4#`s2 xasc update s2: sum each s1 from select t, sides, s1: {sum each y=\:x}[S] each sides from x;

    prd x`t


    }