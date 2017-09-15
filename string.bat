:: Basic batch script for string manipulation.
::
:: Author: Mincong Huang
::
@ECHO OFF & SETLOCAL

:: Substring
::
:: Use index to compute substring
SET site=www.microsoft.com
ECHO Left string [0, 3[:     "%site:~,3%"
ECHO Left string [3, N[:     "%site:~3%"
ECHO Right string [N-3, N[:  "%site:~-3%"
ECHO Mid string [4, 4+9[:    "%site:~4,9%"

:: Replace
::
:: Replace a substring using string substitution. Same principle for
:: remove, where the target string is empty "".
SET sentence=My name is XXX.
ECHO %sentence%
SET sentence=%sentence:XXX=Tom%
ECHO %sentence%
SET sentence=%sentence:YYY=Cat%
ECHO %sentence%

:: Split String
::
:: Split a string, extract substrings by delimiters. By default,
:: characters: comma (,), semi-colon (;), and equal sign (=) are used
:: as delimiters.
SET tokens=A,B;C=D
FOR %%t IN (%tokens%) DO ECHO %%t
