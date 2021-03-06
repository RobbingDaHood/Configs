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
if not "%~4"=="" (
    goto :BadArguments
)

if not exist %2 (
	echo link does not exist: %2
    goto :eof
)

set linkPath=%2
CALL set linkPath=%%linkPath:%1=%%
if %linkPath%==%2 (
	echo linkPath: %2 does not contain the targetpath as a substring %1%, this is very likely an error. 
	goto :BadArguments 
) 

if exist %1 (
	echo Removes old link: %1
	rmdir %1
)

if not exist S: (
	net use S: \\deltedata\projekter
)

mode con lines=32766 cols=200

mklink /D %1 %2
CALL prj %1
CALL ant switchTo%3

:BadArguments
    echo Wrong arguments, syntax: 
    echo linkd 
	echo target link (branch, tag or trunk)
    echo enviroment
    goto :eof
	
PAUSE