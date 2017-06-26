@ECHO off

if "%~1"=="" (
    goto :BadArguments
)
if "%~2"=="" (
    goto :BadArguments
)
if "%~3"=="" (
    goto :BadArguments
)
if not "%~5"=="" (
    goto :BadArguments
)

start startup1.bat xportalen %1 %3 %4
if not "%~2"=="-" (
 start startup2.bat sagsstyring %2 %3 %4
)
goto :eof

:BadArguments
    echo Wrong arguments, syntax: 
    echo linkd xportalfolder sagsstyringfolder enviroment

PAUSE