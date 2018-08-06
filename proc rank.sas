data elect;
input Candidate $ 1-11 District 13 Vote 15-18 Years 20;
datalines;
Cardella    1 1689 8
Latham      1 1005 2
Smith       1 1406 0
Walker      1  846 0
Hinkley     2  912 0
Kreitemeyer 2 1198 0
Lundell     2 2447 6
Thrash      2  912 2
;
run;

proc rank data=elect out=results_1 ties=low descending;
   var vote years;
   ranks VoteRank YearsRank;
run;

proc print data=results_1;
run; 

proc rank data=elect out=results_2 ties=low descending;
   by district;
   var vote years;
   ranks VoteRank YearsRank;
run;

proc print data=results_2;
   by district;
run; 