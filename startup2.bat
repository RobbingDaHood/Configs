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

if not exist %2 (
	echo link does not exist: %2
    goto :eof
)

if exist %1 (
	echo Removes old link: %1
	rmdir %1
)

if not exist S: (
	net use S: \\deltedata\projekter
)

tasklist /nh /fi "imagename eq Fiddler.exe" | find /i "Fiddler.exe" > nul || (start Fiddler.exe)

mode con lines=32766 cols=200

mklink /D %1 %2
CALL prj %1
if not "%~4"=="" (
    CALL ant %4
)
CALL ant switchTo%3
CALL wls wdebug
goto :eof

:BadArguments
    echo Wrong arguments, syntax: 
    echo linkd target link
    echo enviroment
    goto :eof

PAUSE