@echo off
echo Uninstalling...
echo.
if NOT EXIST gWiris.cmd goto ND
IF NOT EXIST desktop\wiris-desktop.jar GOTO ND
IF NOT EXIST applets\wiris-codebase\wrs_desktop_en.jar GOTO ND
IF NOT EXIST applets\wiris-codebase\wrs_desktop_es.jar GOTO ND
IF NOT EXIST java\windows\jre\bin\javaw.exe GOTO ND

if EXIST desktop\extlib\deploy.jar attrib -h desktop\extlib\deploy.jar
if EXIST desktop\extlib\javaws.jar attrib -h desktop\extlib\javaws.jar
if EXIST desktop\WirisDesktop.exe attrib -h desktop\WirisDesktop.exe
if NOT EXIST java\windows\jre\lib\deploy.jar move desktop\extlib\deploy.jar java\windows\jre\lib\
if NOT EXIST java\windows\jre\lib\javaws.jar move desktop\extlib\javaws.jar java\windows\jre\lib\
if NOT EXIST WirisDesktop.exe move desktop\WirisDesktop.exe 
del /f /q gWiris.cmd

exit

:ND
echo Wasn't able to locate gWiris/WIRIS.
echo Please relocate the file.
pause