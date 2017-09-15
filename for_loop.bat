:: Basic batch script for for-loop.
:: > help for
:: Runs a specified command for each file in a set of files.
::
:: Author: Mincong Huang
::
@ECHO OFF

:: FOR %variable IN (set) DO command [command-parameters]
::
::   %variable  Specifies a single letter replaceable parameter.
::   (set)      Specifies a set of one or more files.  Wildcards may be used.
::   command    Specifies the command to carry out for each file.
::   command-parameters
::              Specifies parameters or switches for the specified command.
::
:: To use the FOR command in a batch program, specify %%variable instead
:: of %variable.  Variable names are case sensitive, so %i is different
:: from %I.
FOR %%a IN (a1,a2,a3,a4) DO ECHO %%a
FOR %%b IN (b1;b2;b3;b4) DO ECHO %%b
FOR %%c IN (k1=v1,k2=v2) DO ECHO %%c
ECHO ---

:: If Command Extensions are enabled, the following additional
:: forms of the FOR command are supported:

:: FOR /D %variable IN (set) DO command [command-parameters]
::
::     If set contains wildcards, then specifies to match against directory
::     names instead of file names.
::
REM Too lazy to write examples.

:: FOR /R [[drive:]path] %variable IN (set) DO command [command-parameters]
::
::     Walks the directory tree rooted at [drive:]path, executing the FOR
::     statement in each directory of the tree.  If no directory
::     specification is specified after /R then the current directory is
::     assumed.  If set is just a single period (.) character then it
::     will just enumerate the directory tree.
::
REM Too lazy to write examples.

:: FOR /L %variable IN (start,step,end) DO command [command-parameters]
::
::     The set is a sequence of numbers from start to end, by step amount.
::     So (1,1,5) would generate the sequence 1 2 3 4 5 and (5,-1,1) would
::     generate the sequence (5 4 3 2 1)
FOR /L %%i IN (1,1,5) DO ECHO %%i
FOR /L %%i IN (5,-1,1) DO ECHO %%i
ECHO ---

:: FOR /F ["options"] %variable IN (file-set) DO command [command-parameters]
:: FOR /F ["options"] %variable IN ("string") DO command [command-parameters]
:: FOR /F ["options"] %variable IN ('command') DO command [command-parameters]
::
::     or, if usebackq option present:
::
:: FOR /F ["options"] %variable IN (file-set) DO command [command-parameters]
:: FOR /F ["options"] %variable IN ('string') DO command [command-parameters]
:: FOR /F ["options"] %variable IN (`command`) DO command [command-parameters]
::
::     file-set is one or more file names.  Each file is opened, read
::     and processed before going on to the next file in file-set.
::     Processing consists of reading in the file, breaking it up into
::     individual lines of text and then parsing each line into zero or
::     more tokens.  The body of the for loop is then called with the
::     variable value(s) set to the found token string(s).  By default, /F
::     passes the first blank separated token from each line of each file.
::     Blank lines are skipped.  You can override the default parsing
::     behavior by specifying the optional "options" parameter.  This
::     is a quoted string which contains one or more keywords to specify
::     different parsing options.  The keywords are:
::
::         eol=c           - specifies an end of line comment character
::                           (just one)
::         skip=n          - specifies the number of lines to skip at the
::                           beginning of the file.
::         delims=xxx      - specifies a delimiter set.  This replaces the
::                           default delimiter set of space and tab.
::         tokens=x,y,m-n  - specifies which tokens from each line are to
::                           be passed to the for body for each iteration.
::                           This will cause additional variable names to
::                           be allocated.  The m-n form is a range,
::                           specifying the mth through the nth tokens.  If
::                           the last character in the tokens= string is an
::                           asterisk, then an additional variable is
::                           allocated and receives the remaining text on
::                           the line after the last token parsed.
::         usebackq        - specifies that the new semantics are in force,
::                           where a back quoted string is executed as a
::                           command and a single quoted string is a
::                           literal string command and allows the use of
::                           double quotes to quote file names in
::                           file-set.
::
:: For each line in file "users.csv", tokenize the line with the default
:: delimiter set of space ' ' and tab '\t'. Among all tokens in the result,
:: only the first one is stored, which is named as variable %%a.
FOR /F %%a IN (users.csv) DO ECHO %%a
ECHO ---

:: For each line in file "users.csv", tokenize the line with customized
:: delimiter set of comma ',' and space ' '. Among all tokens in the result,
:: only the 1th token, 2nd token and the 3rd token are stored. Even though
:: we declare only the variable %%a, batch declares automatically %%a, %%b
:: and %%c for us.
FOR /F "tokens=1,2,3 delims=, " %%a IN (users.csv) DO ECHO %%a %%b %%c
ECHO ---

:: For each line in file "users.csv", tokenize the line with customized
:: delimiter set of comma ',' and space ' '. Among all tokens in the result,
:: the 1th token is stored as %%a, the remaining text on the line is stored
:: as %%b.
FOR /F "tokens=1,* delims=, " %%a IN (users.csv) DO ECHO %%a;%%b
ECHO ---

:: Remove the surrounded quotes in variable %%a and variable %%c.
FOR /F "tokens=1,2,3 delims=, " %%a IN (users.csv) DO ECHO %%~a %%b %%~c
ECHO ---

:: Use double quotes to quote file names in file-set
FOR /F "tokens=1,2,3 usebackq delims=, " %%a IN ("users.csv") DO ECHO %%~a %%b %%~c
ECHO ---
