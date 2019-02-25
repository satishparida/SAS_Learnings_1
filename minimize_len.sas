/*Macro Designed to reduce the length or remove unneccesary waight of the charcter varaibles from a data set*/

%macro minimize_len(indsn,outdsn);                                        
data _null_;                                               
  set &indsn;                                                
  array qqq(*) _character_;                                
  call symput('siz',put(dim(qqq),5.-L));                   
  stop;                                                    
run;                                                        
data _null_;                                               
  set &indsn end=done;                                       
  array qqq(&siz) _character_;                             
  array www(&siz.);                                        
  if _n_=1 then do i= 1 to dim(www);                       
    www(i)=0;                                              
  end;                                                     
  do i = 1 to &siz.;                                       
    www(i)=max(www(i),length(qqq(i)));                     
  end;                                                     
  retain _all_;                                            
  if done then do;                                         
    do i = 1 to &siz.;                                     
      length vvv $50;                                      
      vvv=catx(' ','length',vname(qqq(i)),'$',www(i),';'); 
      fff=catx(' ','format ',vname(qqq(i))||' '||          
          compress('$'||put(www(i),5.)||'.;'),' ');        
      call symput('lll'||put(i,5.-L),vvv) ;                
      call symput('fff'||put(i,5.-L),fff) ;                
    end;                                                   
  end;                                                     
run;                                                        
data &outdsn;                                               
  %do i = 1 %to &siz.;                                     
    &&lll&i                                                
    &&fff&i                                                
  %end;                                                    
  set &indsn;                                                
run;                                                      
%mend minimize_len;    

