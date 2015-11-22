'use strict';

/* loads files in /import and processes these to create corresponding SAS macro */

var mustache = require('mustache');
var fs = require('fs');

// get file names in directory
var files = fs.readdirSync( "import" );

// @filename: string with file name to process
var processFile = function(filename){
	// read file		
	var fileRaw = fs.readFileSync( "import/" +  filename, "utf8");	
	// read template with matching file name
	var template = fs.readFileSync( "templates/" +  filename, "utf8");	
	// break file into pieces: each industry code section ends with 2 newlines
	// needs to be non-greedy (add ? after *), and make \r optional with ?
	var rx = /[\s\S]*?\n\r?\n\r?/igm;
	// codeblock
	var code = [];
	// match industry file against regular expression
	var matches=fileRaw.match(rx) || [];
	// loop through matches
	matches.forEach( function(m){
		code.push( makeCode(m) );
	});
	var output = mustache.render( template, { code: code.join("\n") } );	
	// write to output file
	var filename_sas = filename.replace('.txt', '.sas');
	fs.writeFileSync( "SAS/" + filename_sas, output, 'utf8');
};

// @codes: string holding industry code, description and SIC codes 
/*
  sample input
	 1 NoDur  Consumer NonDurables -- Food, Tobacco, Textiles, Apparel, Leather, Toys
	          0100-0999
	          2000-2399
	          2700-2749
	          2770-2799
	          3100-3199
	          3940-3989
  should return:
  	if ( &sicvar ge 0100 and &sicvar le 0999) or ( &sicvar ge 2000 and &sicvar le 2399) or ( &sicvar ge 2700 and &sicvar le 2749) or ( &sicvar ge 2770 and &sicvar le 2799) or ( &sicvar ge 3100 and &sicvar le 3199) or ( &sicvar ge 3940 and &sicvar le 3989) then &varname= 1;
*/
var makeCode = function(str){
	// regex to grab industry code
	var indCode = str.match(/^\ ?(\d{1,2})/igm)[0];
	// industry codes: start-end pairs
	var codePairs = str.match(/\d{4}\-\d{4}/igm);
	var codeblock = [];
	codePairs.forEach (function(el){
		var p = el.split("-");
		codeblock.push ( "( &sicvar ge " + p[0] + " and &sicvar le " + p[1] +")" );  
	})	
	// line of code for the industry code
	return "\tif " + codeblock.join(" or ") + " then &varname=" + indCode + ";";	
}; 

// process files
files.forEach(function(f){ processFile(f);});




