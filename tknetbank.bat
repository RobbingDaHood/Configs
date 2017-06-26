@ECHO off

if "%~1"=="" (
    goto :BadArguments
)

if "%~2"=="" (
    goto :BadArguments
)

if not "%~4"=="" (
    goto :BadArguments
)

if not exist %1 (
	echo link does not exist: %1
	goto :eof
)

if exist tknetbank (
	echo Removes old link: tknetbank
	rmdir tknetbank
)

if not exist S: (
	net use S: \\deltedata\projekter
)

tasklist /nh /fi "imagename eq Fiddler.exe" | find /i "Fiddler.exe" > nul || (start Fiddler.exe)

mode con lines=32766 cols=200

if not "%~1"=="-" (
	mklink /D tknetbank %1
)

CALL prj tknetbank
if not "%~3"=="" (
    CALL mvn %3
)
CALL startpp
SET ENV=%2
CALL wlsj debug
goto :eof

:BadArguments
    echo Wrong arguments, arguments: 
    echo target env "mvn build target"
    goto :eof

:eof
PAUSE