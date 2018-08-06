data asdf;
input subject_id:$4. visit_id:$4. a:$4. b c:$4. d e:$4. f:$4. g h i:$4. j k l m n o p q r s t:$4. u v:$4. w x y:$4. z;
datalines;
1111 1 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26
1111 2 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
1112 1 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28
1112 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
1112 7 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
;
run;

proc contents data=asdf out=cont_asdf noprint;
run;

proc sql noprint;
select name into: intem_oid separated by ' ' from cont_asdf where name not in('subject_id','visit_id');
quit;

%put &=intem_oid;

proc sort data=asdf noduprecs;
by subject_id visit_id;
run;

/*wide to narrow transpose*/
proc transpose data=asdf out=asdf_trans(rename=(_name_=item_var)) prefix=col;
by subject_id visit_id;
var &intem_oid.;
run;

data asdf_trans(drop=col1);
set asdf_trans;
value=left(col1);
run;

/*narrow to wide transpose*/
proc transpose data=asdf_trans out=asdf_trans_rev(drop=_name_);
by subject_id visit_id;
var value;
id item_var;
run;