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

REM build\wsdls
echo ""
echo *************************** build\wsdls ***********************************************
echo ""
echo download "%~1build/wsdls/*zip*/lib.zip"
curl "%~1build/wsdls/*zip*/wsdls.zip" > lib.zip
echo extract to build\wsdls
7z x lib.zip -o"%~dp0build\

REM build\loanoffer-schemas
echo ""
echo *************************** build\loanoffer-schemas ***********************************************
echo ""
echo download "%~1build/loanoffer-schemas/*zip*/lib.zip"
curl "%~1build/loanoffer-schemas/*zip*/loanoffer-schemas.zip" > lib.zip
echo extract to build\loanoffer-schemas
7z x lib.zip -o"%~dp0build\

REM build\bank-priolaanoverdragelse-schemas
echo ""
echo *************************** build\bank-priolaanoverdragelse-schemas ***********************************************
echo ""
echo download "%~1build/bank-priolaanoverdragelse-schemas/*zip*/lib.zip"
curl "%~1build/bank-priolaanoverdragelse-schemas/*zip*/bank-priolaanoverdragelse-schemas.zip" > lib.zip
echo extract to build\bank-priolaanoverdragelse-schemas
7z x lib.zip -o"%~dp0build\

REM target\clients
echo ""
echo *************************** target\clients ***********************************************
echo ""
echo download "%~1target/clients/*zip*/lib.zip"
curl "%~1target/clients/*zip*/clients.zip" > lib.zip
echo extract to target\clients
7z x lib.zip -o"%~dp0target\

REM src\Partnerportal\APP-INF\lib
echo ""
echo *************************** src\Partnerportal\APP-INF\lib ***********************************************
echo ""
echo download "%~1src/Partnerportal/APP-INF/lib/*zip*/lib.zip"
curl "%~1src/Partnerportal/APP-INF/lib/*zip*/lib.zip" > lib.zip
echo extract to src\Partnerportal\APP-INF\lib
7z x lib.zip -o"%~dp0src\Partnerportal\APP-INF\"


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
    echo path to jenkins build where files can be fetched: example http://jenkins/job/ant-jobs/job/xportalen/job/xportalen%20trunk%20CI/ws/

PAUSE