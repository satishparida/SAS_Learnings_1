data A;
input x:best12. y:$4. z:$1.;
datalines;
1 qwer y
2 uyer n
3 ugfg n
4 klsd n
5 lkfd y
;
run;

data B;
input x:best12. y:$3.;
datalines;
1 abc
2 def
3 ghk
;
run;

data C;
set B A;
run;

data D;
set A B;
run;

data E;
set A;
set B;
run;

data F;
set B;
set A;
run;

data G;
merge A B;
run;

data H;
merge B A;
run;