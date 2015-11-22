# fama-french

### Fama French Industry Classification

Fama French industry classification

Kenneth French provides a data library with the Fama French factors and industry classifications.

The industry classification schedules is in `/import` for various classifications: 5, 10, 12, 17, 30, 38, 48, 49.

### Source files

The industry classifications are downloaded from Kenneth French' page, e.g. for the 12 industry classification: 

http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/Data_Library/det_12_ind_port.html

### SAS code

Folder `SAS` holds macros for each of the seven industry classifications

#### Sample usage

Download the repository and move it into your SAS folder structure, e.g. `\yourproject\SAS\git\fama-french`. Then, use as follows, assuming your code is in `yourproject\SAS'.
 
    /* load macro */
    include 'git/fama-french/SAS/Siccodes49.sas';

    /* create sample dataset */
    data a_myfunda (keep = gvkey sich gvkey fyear at sale ceq);
    set comp.funda;
    if indfmt eq'INDL' and datafmt eq 'STD' and popsrc eq 'D' and consol eq 'C' ;
    run;

    /* append fama french 49 industry code */
    %ff49(dsin=work.a_funda, dsout=work.b_ff, varname=ff49);


### Nodejs

The SAS code is generated using `scripts\make.js`. To run the script, you need to have node and npm installed:

    npm install
    npm run make

### Templates

For each industry classification file there is a matching template file in directory `templates`. Industry classifications that do not have a specification for industry `other` have an extra line of code where the industry is set to `other` if there was no matching industry.

### Other code

See www.wrds.us for other code examples to use WRDS and SAS. 