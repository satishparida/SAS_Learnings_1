data A;
input x1:best12. x2:best12. x3:best12. x4:best12. x5:best12.
	y1:$10. y2:$12. y3:$10. ;
datalines;
1.2 1.3 1.4 1.5 1.6 asdf awsd lkdf
0.3 4.5 555 230 12. lkfg erfg lkdf
0.0 1.0 2.3 9.9 120 lktr kjfg e345
;
run;

data B(keep=z:);
set A;
array num[*] _NUMERIC_;
array z_num[*] z1-z5;
array char[*] _character_;
array temp[3] $ _temporary_;
array z_char[*] $ z6-z8;

do i = 1 to dim(num);
	z_num[i]=int(num[i]);
end;

do i = 1 to dim(char);
	temp[i]=substr(char[i],1,2);
	z_char[i]=temp[i];
end;
run;

