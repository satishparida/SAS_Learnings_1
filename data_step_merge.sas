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

/*The length of A is considered over B for variable y*/
data C1;
set A B;
run;

/*The length of B is considered over A for variable y*/
data C2;
set B A;
run;

/*The minimum length is concidered for variable y*/
/*Number of observation = least number of oberservations present in participating tables in set*/
/*Here data of B overwrites data of A for variable y*/
data D1;
set A;
set B;
run;

/*The minimum length is concidered for variable y*/
/*Number of observation = least number of oberservations present in participating tables in set*/
/*Here data of A overwrites data of B for variable y*/
data D2;
set B;
set A;
run;

/*The length of A is considered over B for variable y*/
/*Data of B over writes data of A for variable y*/
data E1;
merge A B;
run;

/*The length of B is considered over A for variable y*/
/*Data of A over writes data of B for variable y*/
data E2;
merge B A;
run;
