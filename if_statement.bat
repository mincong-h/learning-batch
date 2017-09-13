:: Basic batch script for if-statement.
::
:: Author: Mincong Huang
::
@echo off

:: Part A
::
:: When using double quotes (") after the equal sign (=), these
:: quotes are NOT boundaries of string values as in other languages.
:: Indeed, they're assigned as part of the content. So now, the user
:: value is two double quotes.
set user=""

:: Variable user is not empty as explained previously
if "%user%"=="" (
    echo (A) Hello, nobody!
) else (
    :: Printed
    echo (A) Hello, %user%!
)

:: Part B
::
:: When using double quotes (") surrounded the set statement, then
:: these quotes are boundaries of the string value now. So user value
:: is empty.
set "user="

if "%user%"=="" (
    :: Printed
    echo (B) Hello, nobody!
) else (
    echo (B) Hello, %user%!
)
