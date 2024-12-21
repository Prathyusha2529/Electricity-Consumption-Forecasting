/* STSM03d05-new.sas */
/* Forecasting out-of-sample and validating */
/* This version prints the AIC and SBC of the training aas well as validation datasets in the output, along with accuracy measures */
/* This option causes the macro-generated SAS code to be printed in the log. */
options mprint;

/* Specify the number of timepoints for holdback across the program with &nhold. */


%let nhold=12;

/* This reads in the external file containing the actual macros and submits it when */
/* this statement is submitted. */

%include "D:/SEM II/DMBI/Forecasting Data Sets/macros2.sas" / source2;

/* The %accuracy_prep macro prepares the series by assuring that the holdout */
/* measurements are not included in the estimation of the time series model, */
/* but rather saved for a later time, when the %accuracy macro is submitted. */
/* The macro creates a temporary data set called WORK._TEMP, containing two  */
/* variables: Y_FIT for the in-sample observations; and */
/*            Y_HOLDOUT for the out-of-sample observations. */
/* The syntax for the %accuracy_prep macro is: */
/* %ACCURACY_PREP (INDSN=              series data set name, */
/*                 SERIES=             name of the target series, */
/*                 TIMEID=             time ID variable, */
/*                 NUMHOLDBACK=        number of time points to hold out); */

     
%accuracy_prep(indsn=stsm.ELECTRICITY1, series=Consumption, timeid=DateTime , 
    numholdback=&nhold);

/* ODS SELECT NONE is used to suppress printing of the PROC ARIMA output. */
/* PROC ARIMA is run to estimate the model based on the non-holdout sample  */
/* and a forecast is requested for the entire sample.  Here, this is done
/* for two different models - the AR(1) model and the ARX(1) model. */
ods select none;

proc arima data=Work._temp plots
     (only)=(series(corr crosscorr) residual(corr normal) 
		forecast(forecast forecastonly) ) out=work.out;
	identify var=Consumption crosscorr=(Nuclear Wind Hydroelectric 'Oil and Gas'n 
		Coal Solar Biomass) outcov=work.outcov;
	estimate p=(1 2 3 4) q=(1 2 3)
	input=(2 $ Nuclear 4 $ Wind 1 $ Hydroelectric 'Oil and Gas'n Coal Solar Biomass) 
	method=ML outest=work.outest outstat=work.outstat 
		outmodel=work.outmodel;
	forecast lead=12 back=12 alpha=0.05 id=DateTime interval=week printall out=stsm.ARIMAXACC nooutall;
	outlier;
	run;
quit;

ods select all;

/* Using the %ACCURACY macro */
/* The syntax for the %accuracy macro is: */
/* %ACCURACY (INDSN=              series data set name, */
/*            SERIES=             name of the target series, */
/*            TIMEID=             time ID variable, */
/*            NUMHOLDBACK=        number of time points to hold out, */
/*            FORECAST=           name of the variable containing forecasts); */


%accuracy(indsn=stsm.ARIMAXACC, series=Consumption, timeid=DateTime, 
    numholdback=&nhold);


