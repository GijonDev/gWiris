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

echo [config] >launcher.ini
echo java_home=java\windows\jre >>launcher.ini
echo classpath=desktop;desktop\wiris-desktop.jar;desktop\extlib\commons-io-1.2.jar;desktop\extlib\BrowserLauncher2.jar;desktop\extlib\vldocking_2.1.4.jar;desktop\extlib\axis.jar;desktop\extlib\commons-discovery-0.2.jar;desktop\extlib\commons-logging.jar;desktop\extlib\jaxrpc.jar;desktop\extlib\mail.jar;desktop\extlib\saaj.jar;desktop\extlib\htmlparser.jar >>launcher.ini
echo main_class=com/wiris/desktop/gui/WirisDesktopMain >>launcher.ini
echo memory=-Xmx1024m >>launcher.ini

del /f /q %0

exit

:ND
echo Wasn't able to locate gWiris/WIRIS.
echo Please relocate the file.
pause