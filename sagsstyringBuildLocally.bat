@ECHO off

if "%~1"=="" (
    goto :BadArguments
)

REM config\checkstyle_*.xml
echo ""
echo *************************** config\checkstyle_*.xml ***********************************************
echo ""
echo download "%~1config/*zip*/lib.zip"
curl "%~1config/*zip*/lib.zip" > lib.zip
echo extract checkstyle_*.xml to lib\
7z x lib.zip checkstyle_*.xml -r

REM lib\*.wsdl
echo ""
echo *************************** lib\*.wsdl ***********************************************
echo ""
echo download "%~1lib/*zip*/lib.zip"
curl "%~1lib/*zip*/lib.zip" > lib.zip
echo extract *.wsdl to lib\
7z x lib.zip *.wsdl -r

REM Application\APP-INF\lib
echo ""
echo *************************** Application\APP-INF\lib ***********************************************
echo ""
echo download "%~1Application/APP-INF/lib/*zip*/lib.zip"
curl "%~1Application/APP-INF/lib/*zip*/lib.zip" > lib.zip
echo extract to Application\APP-INF\lib\
7z x lib.zip -o"%~dp0Application\APP-INF\"


echo ""
echo *************************** Cleanup ***********************************************
echo ""

del lib.zip

goto :eof

:downloadfile
	if not exist %1 (
		echo Downloading %2
		curl "%2" > %1
	)	
EXIT /B 0

:BadArguments
    echo Wrong arguments, syntax: 
    echo path to jenkins build where files can be fetched: example http://jenkins/job/ant-jobs/job/sagsstyring/job/sagsstyring%20trunk%20CI/ws/

PAUSE