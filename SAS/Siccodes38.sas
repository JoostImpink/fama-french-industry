/*
	Fama French 38 industry classification 

	variables:
	- dsin: input dataset 
	- dsout: name of output dataset
	- sicvar: variable holding sic
	- varname: variable name to hold industry classification

	sample usage:
	%ff38(dsin=work.input, dsout=work.output, varname=ff38);	
*/

%macro ff38(dsin=, dsout=, sicvar=sich, varname=ff38);

	data &dsout;
	set &dsin;
	
	/* industry assignments */
	if ( &sicvar ge 0100 and &sicvar le 0999) then &varname= 1;
	if ( &sicvar ge 1000 and &sicvar le 1299) then &varname= 2;
	if ( &sicvar ge 1300 and &sicvar le 1399) then &varname= 3;
	if ( &sicvar ge 1400 and &sicvar le 1499) then &varname= 4;
	if ( &sicvar ge 1500 and &sicvar le 1799) then &varname= 5;
	if ( &sicvar ge 2000 and &sicvar le 2099) then &varname= 6;
	if ( &sicvar ge 2100 and &sicvar le 2199) then &varname= 7;
	if ( &sicvar ge 2200 and &sicvar le 2299) then &varname= 8;
	if ( &sicvar ge 2300 and &sicvar le 2399) then &varname= 9;
	if ( &sicvar ge 2400 and &sicvar le 2499) then &varname=10;
	if ( &sicvar ge 2500 and &sicvar le 2599) then &varname=11;
	if ( &sicvar ge 2600 and &sicvar le 2661) then &varname=12;
	if ( &sicvar ge 2700 and &sicvar le 2799) then &varname=13;
	if ( &sicvar ge 2800 and &sicvar le 2899) then &varname=14;
	if ( &sicvar ge 2900 and &sicvar le 2999) then &varname=15;
	if ( &sicvar ge 3000 and &sicvar le 3099) then &varname=16;
	if ( &sicvar ge 3100 and &sicvar le 3199) then &varname=17;
	if ( &sicvar ge 3200 and &sicvar le 3299) then &varname=18;
	if ( &sicvar ge 3300 and &sicvar le 3399) then &varname=19;
	if ( &sicvar ge 3400 and &sicvar le 3499) then &varname=20;
	if ( &sicvar ge 3500 and &sicvar le 3599) then &varname=21;
	if ( &sicvar ge 3600 and &sicvar le 3699) then &varname=22;
	if ( &sicvar ge 3700 and &sicvar le 3799) then &varname=23;
	if ( &sicvar ge 3800 and &sicvar le 3879) then &varname=24;
	if ( &sicvar ge 3900 and &sicvar le 3999) then &varname=25;
	if ( &sicvar ge 4000 and &sicvar le 4799) then &varname=26;
	if ( &sicvar ge 4800 and &sicvar le 4829) then &varname=27;
	if ( &sicvar ge 4830 and &sicvar le 4899) then &varname=28;
	if ( &sicvar ge 4900 and &sicvar le 4949) then &varname=29;
	if ( &sicvar ge 4950 and &sicvar le 4959) then &varname=30;
	if ( &sicvar ge 4960 and &sicvar le 4969) then &varname=31;
	if ( &sicvar ge 4970 and &sicvar le 4979) then &varname=32;
	if ( &sicvar ge 5000 and &sicvar le 5199) then &varname=33;
	if ( &sicvar ge 5200 and &sicvar le 5999) then &varname=34;
	if ( &sicvar ge 6000 and &sicvar le 6999) then &varname=35;
	if ( &sicvar ge 7000 and &sicvar le 8999) then &varname=36;
	if ( &sicvar ge 9000 and &sicvar le 9999) then &varname=37;

	/*  Fama french siccodes file does not include industry codes for 'other'
		Set it to 38 (i.e. 'other') if not yet set
	 */
	if &varname eq . then &varname = 38;
	run;

%mend;