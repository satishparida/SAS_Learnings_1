options mprint source;
/*This is a program designed to understand the look back 
and look forward in a same program using SAS, this is higly
usefull for verifying time series data*/
libname xxx '/u04/dataloader/skparida/App/ZZ';

data xxx.asdf;
format vistdate date9.;
input siteid:$4. subjectid:$4. visitid:$4. vistdate:ddmmyy10.;
ID=_n_;
/*This is needed in method 1 only, if the dataset do not have a numeric sequential variable*/
datalines;
1000 0001 0001 01-01-2018
1000 0001 0002 02-01-2018
1000 0001 0003 30-01-2018
1000 0001 0004 04-01-2018
1000 0001 0005 10-01-2018
1000 0001 0006 19-01-2018
1000 0002 0001 03-02-2018
1000 0002 0002 03-02-2018
1000 0002 0003 04-02-2018
1000 0002 0004 08-02-2018
1000 0002 0005 06-02-2018
1000 0003 0001 01-01-2018
1000 0003 0002 02-01-2018
;
run;

/*Method 1*/
proc sql;
	create table xxx.result_1 as
	select a.*, next.vistdate as next_vistdate, prev.vistdate as prev_vistdate
	from xxx.asdf a 
			left join 
			xxx.asdf next on
						a.subjectid=next.subjectid and a.ID=next.ID-1
			left join 
			xxx.asdf prev on
						a.subjectid=prev.subjectid and a.ID=prev.ID+1
	;
quit;

/*Method 2*/
proc sort data=xxx.asdf; by subjectid visitid; run;

data xxx.result_2;
set xxx.asdf;
by subjectid;
set xxx.asdf(firstobs=2 keep=vistdate rename=(vistdate=next_vistdate))
	/*This set statement is kept here because if we keep it before by variable we will get the following error
	ERROR: BY variable subjectid is not on input data set XXX.ASDF.*/
	xxx.asdf(obs = 1 drop = _all_);
	/*This dataset with 1 observation and 0 variables added to avoid inter-leveling issue. see following the final DS have 1 less record
	NOTE: There were 13 observations read from the data set XXX.ASDF.
	NOTE: There were 12 observations read from the data set XXX.ASDF.
	NOTE: The data set XXX.RESULT_1 has 12 observations and 7 variables.*/
prev_vistdate = ifn( first.subjectid, (.), lag(vistdate) );
next_vistdate = ifn( last.subjectid, (.), next_vistdate );
format prev_vistdate date9.;
run;

/*Method 3 -- WORK on This, not working properly*/
proc sql;
	create table xxx.result_3 as
	 select lookback.*, next.vistdate as Next_Measure         
	  from  ( select a.*, prev.vistdate as Prev_Measure         
	           from xxx.asdf a left join xxx.asdf as prev
	             on a.subjectid = prev.subjectid and prev.vistdate < a.vistdate
	           group by a.subjectid, a.vistdate
	           having prev.vistdate = max(prev.vistdate)
	        ) as lookback 
	   left join xxx.asdf as next
	     on lookback.subjectid = next.subjectid and next.vistdate > lookback.vistdate
	   group by lookback.subjectid, lookback.subjectid
	   having next.vistdate = min(next.vistdate)
	;
quit;