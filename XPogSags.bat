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

:validateXportalPath
if not exist %1 (
	echo link does not exist: %1
    goto :BadArguments
)

set xpPath=%1
set xpPath=%xpPath:xportalen=%
if %xpPath%==%1 (
	echo Parameter 1: %1 does not contain the substring xportalen, this is very likely an error. 
	goto :BadArguments 
) 

:ValidateSagstyrringPath
if "%~2"=="-" ( 
	goto :startupservers
)

if not exist %2 (
	echo link does not exist: %2
	goto :BadArguments
)
set sagPath=%2	
set sagPath=%sagPath:sagsstyring=%
if %sagPath%==%2 (
	echo Parameter 2: %2 does not contain the substring sagsstyring, this is very likely an error. 
	goto :BadArguments 
) 

:startupservers
start startup1.bat xportalen %1 %3 %4
if not "%~2"=="-" (
	timout /t 2
	start startup2.bat sagsstyring %2 %3 %4
)
goto :eof

:BadArguments
    echo Wrong arguments, syntax: 
    echo xportalfolder sagsstyringfolder enviroment (antTarget)

PAUSE