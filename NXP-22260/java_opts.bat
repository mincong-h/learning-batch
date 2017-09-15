:: Java options parser
::
:: A small parser for parsing variable JAVA_OPTS defined in the
:: configuration file.
::
:: Author: Mincong Huang
::
@ECHO OFF

ECHO Print every line which does not start with #
ECHO ---
FOR /F "tokens=* eol=#" %%a IN (nuxeo.conf) DO ECHO %%a
ECHO ***

ECHO Print every line starting with word "JAVA_OPTS". Only the right part
ECHO of the first equals sign '=' will be printed.
ECHO ---
FOR /F "tokens=1,* eol=# delims==" %%a IN (nuxeo.conf) DO (
    IF "%%a" == "JAVA_OPTS" ECHO %%b
)
ECHO ***

ECHO Print every line starting with word "JAVA_OPTS=...". Each line will be
ECHO expanded: "$JAVA_OPTS" will be replaced by the value defined in the
ECHO previous lines.

ECHO Delayed environment variable expansion allows you to use a different
ECHO character (the exclamation mark) to expand environment variables at
ECHO execution time.
ECHO ---
SETLOCAL ENABLEDELAYEDEXPANSION
SET curr_opts=
SET java_opts=
FOR /F "tokens=1,* eol=# delims==" %%a IN (nuxeo.conf) DO (
    IF "%%a" == "JAVA_OPTS" (
        REM Exclamation mark '!': delayed env variable
        SET curr_opts=%%b
        SET java_opts=!java_opts!!curr_opts:$JAVA_OPTS=!
        ECHO !java_opts!
    )
)
ENDLOCAL
ECHO ***
