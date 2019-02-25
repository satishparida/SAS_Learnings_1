/*Macro to delete empty columns and the columns on demand with any perticular value*/
%macro drop_empty_var(ds_in=,ds_out=);
	data _null_;
	set &ds_in.;
	array my_nums[*] _numeric_;
	array my_chars[*] _character_;
	call symput ('dim_n',dim(my_nums));
	call symput ('dim_c',dim(my_chars));
	stop;
	run;

	data _null_;
	set &ds_in. end=last;
	length drop_numvars $2000 drop_charvars $2000;
	array num_delete[&dim_n.];
	array char_delete[&dim_c.];
	array my_nums[*] _numeric_;
	array my_chars[*] _character_;
	retain num_delete char_delete;
	do j=1 to &dim_n.;
		if _n_=1 or num_delete[j] =0 then do;
			/*Condition to delete numeric Variable*/
			if my_nums[j]=. or my_nums[j]=0 then num_delete[j] =0;
			else num_delete[j] =1;
		end; 
	end;
	do j=1 to &dim_c.;
		if _n_=1 or char_delete[j] =0 then do;
			/*Condition to delete charecter Variable*/
			if strip(my_chars[j])='.' or strip(my_chars[j])='' or strip(my_chars[j])='0' then char_delete[j] =0;
			else char_delete[j] =1;
		end; 
	end;

	if last then do;
		do j=1 to &dim_n.;
			if num_delete[j]=0 then do;
				drop_numvars=cats(drop_numvars,',',vname(my_nums[j]));
			end;
		end;
		do j=1 to &dim_c.;
			if char_delete[j]=0 then do;
				drop_charvars=cats(drop_charvars,',',vname(my_chars[j]));
			end;
		end;
		call symput('drop_numvars',translate(drop_numvars,' ',','));
		call symput('drop_charvars',translate(drop_charvars,' ',','));
	end;
	run;

	data &ds_out.(drop=&drop_numvars. &drop_charvars.);
	set &ds_in.;
	run;
%mend drop_empty_var;

option mprint;
Data have;
   do i =1 to 5;
   if i=1 then do; a="1"; b="2"; c=""; end;
   if i=2 then do; a="3"; b="4"; c="0"; end;
   if i=3 then do; a="5"; b="6"; c=""; end;
   if i=4 then do; a="7"; b="8"; c="0"; end;
   if i=5 then do; a="9"; b="10"; c=""; end;
   output;
   end;
run;

%drop_empty_var(ds_in=have,ds_out=want);
