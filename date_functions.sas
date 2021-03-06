data intck_explained; 
   scale='YEAR';
   Today='09Jul2018'd;
   
   scale_type='C';
   WeddingDay='09Dec1999'd;
   YearsMarried=INTCK(scale,WeddingDay,Today,scale_type);
   output;
   WeddingDay='08Jul2000'd;
   YearsMarried=INTCK(scale,WeddingDay,Today,scale_type);
   output;
   WeddingDay='09Jul2000'd;
   YearsMarried=INTCK(scale,WeddingDay,Today,scale_type);
   output;
   WeddingDay='10Jul2000'd;
   YearsMarried=INTCK(scale,WeddingDay,Today,scale_type);
   output;
   WeddingDay='31Jul2000'd;
   YearsMarried=INTCK(scale,WeddingDay,Today,scale_type);
   output;
   WeddingDay='5Jan2001'd;
   YearsMarried=INTCK(scale,WeddingDay,Today,scale_type);
   output;
   
   scale_type='D';
   WeddingDay='09Dec1999'd;
   YearsMarried=INTCK(scale,WeddingDay,Today,scale_type);
   output;
   WeddingDay='08Jul2000'd;
   YearsMarried=INTCK(scale,WeddingDay,Today,scale_type);
   output;
   WeddingDay='09Jul2000'd;
   YearsMarried=INTCK(scale,WeddingDay,Today,scale_type);
   output;
   WeddingDay='10Jul2000'd;
   YearsMarried=INTCK(scale,WeddingDay,Today,scale_type);
   output;
   WeddingDay='31Jul2000'd;
   YearsMarried=INTCK(scale,WeddingDay,Today,scale_type);
   output;
   WeddingDay='5Jan2001'd;
   YearsMarried=INTCK(scale,WeddingDay,Today,scale_type);
   output;
   
   format WeddingDay Today yymmdd10.;
run;

data intnx_explained;
   current_date='12Jul2018'd;
   interval='MONTH';
   icremant=2;
   allignment='S';
   future_date=intnx(interval,current_date,icremant,allignment);
   output;
   allignment='B';
   future_date=intnx(interval,current_date,icremant,allignment);
   output;
   allignment='E';
   future_date=intnx(interval,current_date,icremant,allignment);
   output;
   icremant=3;
   allignment='M';
   future_date=intnx(interval,current_date,icremant,allignment);
   output;
   
   format current_date future_date yymmdd10.;
run;