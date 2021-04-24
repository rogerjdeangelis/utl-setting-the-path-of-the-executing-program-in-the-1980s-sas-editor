Setting the path of the executing program in the 1980s sas editor

GitHub
https://tinyurl.com/7vtvad4w
https://github.com/rogerjdeangelis/utl-setting-the-path-of-the-executing-program-in-the-1980s-sas-editor

You cannot get the name of the executing program in the 1980s DMS editor.

However you can easily set SAS_EXECFILEPATH equal to the program path in the DMS editor.
This makes your program more compatible with the Enhanced Editor.

The enhanced editor automatically sets SAS_EXECPATH.

I like to set the name of the executing program using this initial assignment.

%let pgm=utl_freshstart;

An alternative technique to set pgm and sas_execfilepath macro variables in DMS would be

%setpgm(fresh_start);

This assumes the current working directory is set to where the program is loacated.

%macro setpgm(twoset);
  %global pgm sas_execfilepath;
  %let pgm=&twoset..sas;
  filename _xyzst "./&twoset..sas";
  %let SAS_EXECFILEPATH=%sysfunc(pathname(_xyzst));
  filename _xyzst clear;
%mend setpgm;

%setpgm(freshstart);

%put The executing program path is &=SAS_EXECFILEPATH;

%put The executing program is &=pgm;

%put &=pgm;

run;quit;


