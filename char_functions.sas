data _null_;

x='my ass is grass';
put x=;

/*translate(source,to,from)
			to: the set of charcters up for replacement
			from: the set of charecters to be replaced
	See Output to understand it better, every charecter is replaced separtely*/
y=translate(x,'mx','ys'); /*here y is relaced by m and s is replaced by x*/
put "translate(x,'mx','ys') "y=;
y=translate(x,'m','ys'); /*here y is relaced by m and s is replaced by ' '*/
put "translate(x,'m','ys') "y=;

/*tranwrd(source,from_string,to_string)
		from_string: the string to be replaced on occurance in source
		to_string: the string up for replacement for from_string*/
y=tranwrd(x,'my','yo'); /*here 'my' is relaced by 'yo'*/
put "tranwrd(x,'my','yo') "y=;
y=tranwrd(x,'my','your'); /*here 'my' is relaced by 'your'*/
put "tranwrd(x,'my','your') "y=;
y=tranwrd(x,'ss','qq'); /*here 'ss' are relaced by 'qq'*/
put "tranwrd(x,'ss','qq') "y=;

/*index function serches for string patterns inside a source string*/
y=index(x,'sss');					/*Here we are serching for a string patteren sss in the source string*/
put "index(x,'sss') "y=;
y=index(x,'s ');					/*Here we are serching for a string patteren 's ' in the source string*/
put "index(x,'s ') "y=;

/*indexc function serches for a charecter from a charecter set inside a source string*/
y=indexc(x,'xy');					/*Here we are serching for any charcter in carecter set {'x','y'} in the source string*/
put "indexc(x,'xy') " y=;
y=indexc(x,'');						/*Here we are serching for any charcter in carecter set {' '} in the source string*/
put "indexc(x,'') " y=;

/*indexw function serches for word inside a source string with defined delimitors*/
y=indexw(x,'sss');					/*Here we are serching for a word 'sss' in the source string: dfault separtaor ' '*/
put "indexw(x,'sss') "y=;
y=indexw(x,'ass');					/*Here we are serching for a word 'ass' in the source string: dfault separtaor ' '*/
put "indexw(x,'ass') "y=;
y=indexw(x,'ass',',');				/*Here we are serching for a word 'ass' in the source string: separtaor ','*/
put "indexw(x,'ass',',') "y=;
y=indexw(x,'ass',', ');				/*Here we are serching for a word 'ass' in the source string: separtaors {',',' '}*/
put "indexw(x,'ass',', ') "y=;

/*FIND(string,substring,modifiers,startpos)
	modifier:{'i','t'} i:ignore case t:remove trailing blanck
	startpos:is a numeric constant, variable, 
				or expression with an integer value that specifies the position at 
				which the search should start and the direction of the search.*/
var1='She sells seashells? Yes, she does.';
put var1=;

whereisshe=find(var1,'she');
put "find(var1,'she') "whereisshe=;
whereisshe=find(var1,'she ');
put "find(var1,'she ') "whereisshe=;
whereisshe=find(var1,'she ','t');
put "find(var1,'she ','t') "whereisshe=;
whereisshe=find(var1,'she','i');
put "find(var1,'she','i') "whereisshe=;
whereisshe=find(var1,'she ','it');
put "find(var1,'she ','it') "whereisshe=;
whereisshe=find(var1,'she ','it',2);
put "find(var1,'she ','it',2) "whereisshe=;
whereisshe=find(var1,'she ','it',20);
put "find(var1,'she ','it',20) "whereisshe=;

/*FINDC(string, charlist, modifier(s) , startpos) */
f1='/u01/mydata/dataloader/skparida/tst.csv';
put f1=;

fname=findc(f1,'xa');
put "findc(f1,'xa') " fname=;
fname=findc(f1,'/');
put "findc(f1,'/') " fname=;
fname2=findc(f1,'/','b');
put "findc(f1,'/','b') " fname2=;
fname=findc(f1,'/',-22);
put "findc(f1,'/',-22) " fname=;
fname=findc(f1,'/','b',-30);
put "findc(f1,'/','b',-30) " fname=;
fname1=findc(f1,'/',-1*(findc(f1,'/','b')-1));
put "findc(f1,'/',-1*(findc(f1,'/','b')-1)) "fname1=;
file_folder=substr(f1,fname1+1,fname2-fname1-1);
put "substr(f1,fname1+1,fname2-fname1-1) "file_folder=;

/*FINDW(string, word, delimter(s), startpos , modifier(s))*/
string='Artists from around the country display their art at an art festival.';
put string=;

result=findw(string, 'art',' ','b');
put "findw(string, 'art',' ','b') "result=;
result=findw(string, 'art');
put "findw(string, 'art') "result=;
result=findw(string, 'art',' ',50);
put "findw(string, 'art',' ',50) "result=;

/*CALL SCAN(source_string, count, position, length , delimiter(s) , modifier(s))*/
CALL SCAN(string, 3, position, length , ' -' ,);
put "CALL SCAN(string, 2, position, length , ' -' ,) "position= length=;

/*SCAN(string, count, delimiter(s) ,modifiers) */
chk=scan(string,10,' ');
put "scan(string,10,' ') "chk=;

grade='a b c b c d f a a q a b d d b';
put grade=;

check=verify(grade,'a b c d f');
put "verify(grade,'a b c d f') "check=;
run;

*Analogus functions:
 find		index			-both serch for position of matching charecter pattern in the source, while find have 
 								modifiers
 findc		indexc			-both serch for position of matching charecter from a list of charecters while, findc have 
 								modifiers
 findw		indexw			-both serch for position of matching charecter pattern/word(delemiter specified) 
 								in the source while findw have modifiers
 translate	tranwrd			-translate replaces exact charecters with new chacters, while tranwrd replaces 
 								whole word with the new specifid word
 call scan	scan			-
 ;
