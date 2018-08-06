data tes_in;
input p_id:8. loan_amt:8. rate:8. sex:$1. age:8. paid:8.;
datalines;
1 10000 10 M 30 9000
2 20000 11 F 31 10000
4 40000 10 M 33 8000
5 30000 11 F 34 10000
6 10000 11 M 31 10000
7 30000 10 F 33 0
8 20000 11 M 32 10
9 30000 10 F 35 10000
10 30000 10 F 35 10000
11 10000 11 M 31 9000
12 50000 10 O 36 40000
13 90000 11 F 30 70000
14 30000 10 M 31 40000
15 60000 10 M 32 20000
;
run;

proc freq data=tes_in;
tables sex/out=freq1;
run;

proc freq data=tes_in;
tables sex rate age/*/out=freq1*/; /*the out is useless here as the out variable captures tables for sex only here*/
run;

proc freq data=tes_in;
tables sex*age/out=freq2;
run;

proc format;
value paid
	low-100='less'
	100-10000='mid-range'
	10000-high='high';
run;

proc freq data=tes_in;
tables sex*paid/out=freq3;
format paid paid.;
run;

proc freq data=tes_in;
tables sex*paid/list;
format paid paid.;
run;


proc freq data=tes_in;
tables sex*paid*age;
format paid paid.;
run;