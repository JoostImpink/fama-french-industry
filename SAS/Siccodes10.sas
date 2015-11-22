/*
	Fama French 10 industry classification 

	variables:
	- dsin: input dataset 
	- dsout: name of output dataset
	- sicvar: variable holding sic
	- varname: variable name to hold industry classification

	sample usage:
	%ff10(dsin=work.input, dsout=work.output, varname=ff10);	
*/

%macro ff10(dsin=, dsout=, sicvar=sich, varname=ff10);

	data &dsout;
	set &dsin;
	
	/* industry assignments */
	if ( &sicvar ge 0100 and &sicvar le 0999) or ( &sicvar ge 2000 and &sicvar le 2399) or ( &sicvar ge 2700 and &sicvar le 2749) or ( &sicvar ge 2770 and &sicvar le 2799) or ( &sicvar ge 3100 and &sicvar le 3199) or ( &sicvar ge 3940 and &sicvar le 3989) then &varname= 1;
	if ( &sicvar ge 2500 and &sicvar le 2519) or ( &sicvar ge 2590 and &sicvar le 2599) or ( &sicvar ge 3630 and &sicvar le 3659) or ( &sicvar ge 3710 and &sicvar le 3711) or ( &sicvar ge 3714 and &sicvar le 3714) or ( &sicvar ge 3716 and &sicvar le 3716) or ( &sicvar ge 3750 and &sicvar le 3751) or ( &sicvar ge 3792 and &sicvar le 3792) or ( &sicvar ge 3900 and &sicvar le 3939) or ( &sicvar ge 3990 and &sicvar le 3999) then &varname= 2;
	if ( &sicvar ge 2520 and &sicvar le 2589) or ( &sicvar ge 2600 and &sicvar le 2699) or ( &sicvar ge 2750 and &sicvar le 2769) or ( &sicvar ge 2800 and &sicvar le 2829) or ( &sicvar ge 2840 and &sicvar le 2899) or ( &sicvar ge 3000 and &sicvar le 3099) or ( &sicvar ge 3200 and &sicvar le 3569) or ( &sicvar ge 3580 and &sicvar le 3621) or ( &sicvar ge 3623 and &sicvar le 3629) or ( &sicvar ge 3700 and &sicvar le 3709) or ( &sicvar ge 3712 and &sicvar le 3713) or ( &sicvar ge 3715 and &sicvar le 3715) or ( &sicvar ge 3717 and &sicvar le 3749) or ( &sicvar ge 3752 and &sicvar le 3791) or ( &sicvar ge 3793 and &sicvar le 3799) or ( &sicvar ge 3860 and &sicvar le 3899) then &varname= 3;
	if ( &sicvar ge 1200 and &sicvar le 1399) or ( &sicvar ge 2900 and &sicvar le 2999) then &varname= 4;
	if ( &sicvar ge 3570 and &sicvar le 3579) or ( &sicvar ge 3622 and &sicvar le 3622) or ( &sicvar ge 3660 and &sicvar le 3692) or ( &sicvar ge 3694 and &sicvar le 3699) or ( &sicvar ge 3810 and &sicvar le 3839) or ( &sicvar ge 7370 and &sicvar le 7372) or ( &sicvar ge 7373 and &sicvar le 7373) or ( &sicvar ge 7374 and &sicvar le 7374) or ( &sicvar ge 7375 and &sicvar le 7375) or ( &sicvar ge 7376 and &sicvar le 7376) or ( &sicvar ge 7377 and &sicvar le 7377) or ( &sicvar ge 7378 and &sicvar le 7378) or ( &sicvar ge 7379 and &sicvar le 7379) or ( &sicvar ge 7391 and &sicvar le 7391) or ( &sicvar ge 8730 and &sicvar le 8734) then &varname= 5;
	if ( &sicvar ge 4800 and &sicvar le 4899) then &varname= 6;
	if ( &sicvar ge 5000 and &sicvar le 5999) or ( &sicvar ge 7200 and &sicvar le 7299) or ( &sicvar ge 7600 and &sicvar le 7699) then &varname= 7;
	if ( &sicvar ge 2830 and &sicvar le 2839) or ( &sicvar ge 3693 and &sicvar le 3693) or ( &sicvar ge 3840 and &sicvar le 3859) or ( &sicvar ge 8000 and &sicvar le 8099) then &varname= 8;
	if ( &sicvar ge 4900 and &sicvar le 4949) then &varname= 9;

	/*  Fama french siccodes file does not include industry codes for 'other'
		Set it to 10 (i.e. 'other') if not yet set
	 */
	if &varname eq . then &varname = 10;
	run;

%mend;