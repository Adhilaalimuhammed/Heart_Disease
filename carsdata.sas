/*-----------------------------------------------------------*/
/*1  loading tha cars data from sas.help--*/
data Cars;
	set sashelp.cars;
run;

proc print data=cars;
run;

/*2: head of the dataset--*/
proc print data=cars(obs=5);
run;

/*3 :summary & information--*/
proc contents data=cars;
run;

/*4: print all columns where make=audi,origin=asia---*/
proc sql;
	select * from cars where Make='Acura' and origin='Asia';
quit;

/*5 print make,type with origin plot in bargraph*/
proc sql;
	select make, type from cars where origin;
quit;

proc sgplot data=_BarChartTaskData;
	by Origin;
	vbar Make / group=Type groupdisplay=cluster datalabel;
	yaxis grid;
run;

/*6: find the relation between horsepower & cylinder plot in histogram*/
proc sql;
	select horsepower, cylinders from cars;
quit;

/*-------------------------------------------------*/
proc sort data=CARS out=_HistogramTaskData;
	by Cylinders;
run;

proc sgplot data=_HistogramTaskData;
	by Cylinders;
	histogram Horsepower /;
	yaxis grid;
run;

/*7: find the count of different type of Europe origin*/
proc sql;
	select count(type) from cars where origin='Europe';
quit;

/*8: plot the type column in pie chart*/
proc template;
	define statgraph SASStudio.Pie;
		begingraph;
		layout region;
		piechart category=Type /;
		endlayout;
		endgraph;
	end;
run;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgrender template=SASStudio.Pie data=CARS;
run;

/*9: select all columns type= Audi  ande have cylinder>3*/
proc sql;
	select * from cars where make='Audi' and cylinders>4;
quit;

/*10: scatterplot*/
proc sgscatter data=cars;
	plot horsepower*MSRP / datalabel=make group=type grid;
run;

/*11:barplot bw drive train & type*/
proc sgplot data=cars;
	vbar DriveTrain / group=Type;
	title "drive train with type";
run;

/*12: origin barplot*/
proc sgplot data=cars;
	vbar origin;
	title "origin ";
run;

/*13: histogram of weight */
proc sgplot data=CARS;
	histogram Weight /;
	yaxis grid;
run;

/*14: histogram of horsepower*/
proc sgplot data=CARS;
	histogram Horsepower /;
	yaxis grid;

	/*15  barplot of type*/
proc sgplot data=cars;
	vbar Type;
	title "type category";
run;

/*16: barplot of make with cylinders*/
proc sgplot data=CARS;
	vbar Make / group=Cylinders groupdisplay=stack;
	yaxis grid;