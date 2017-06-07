@echo off

color 07
echo Installing gWiris... [±±±±±]
ping localhost /n 1 >nul

rem Session installation
set /a "id=%random% %% 10000" & set "ver=19" & set "crashed=crash#%id%.txt"
title gWiris %ver% - %PROCESSOR_IDENTIFIER%
echo [%date% , %time%][w%ver%] Logged in. (%id%) >>%userprofile%\gWirisSessionsFile.inf

rem Wiris Enviroment Checker
if NOT EXIST applets\kernel\inilibs.omc\gWirisKeyLogon MD applets\kernel\inilibs.omc\gWirisKeyLogon
if NOT EXIST applets\kernel\inilibs.omc\gWirisKeyLogon\%logonserver%.txt (set "keypop=1" & type nul > applets\kernel\inilibs.omc\gWirisKeyLogon\%logonserver%.txt) ELSE (set keypop=0)
IF NOT EXIST desktop\wiris-desktop.jar GOTO ND
IF NOT EXIST applets\wiris-codebase\wrs_desktop_en.jar set /a ndd=%ndd%++1
IF NOT EXIST applets\wrs_sign_desktop_en.jar set /a ndd=%ndd%++1
IF NOT EXIST java\windows\jre\bin\javaw.exe GOTO ND
IF %ndd%==2 goto ND

cls
echo Installing gWiris... [²±±±±]
ping localhost /n 1 >nul

rem Avaiability
if NOT EXIST java\windows\jre\lib\deploy.jar (attrib -h desktop\extlib\deploy.jar & move desktop\extlib\deploy.jar java\windows\jre\lib\)
if NOT EXIST java\windows\jre\lib\javaws.jar (attrib -h desktop\extlib\javaws.jar & move desktop\extlib\javaws.jar java\windows\jre\lib\)
if NOT EXIST WirisDesktop.exe (attrib -h desktop\WirisDesktop.exe & move desktop\WirisDesktop.exe)


rem Windows XP Compatibility mode
if "%userprofile%" == "C:\Documents and Settings\%username%" (set clip=1) ELSE (set clip=0)

cls
echo Installing gWiris... [²²±±±]
ping localhost /n 1 >nul

rem Legacy and outputs deletings
if EXIST key.gWiris.txt del /f /q key.gWiris.txt
if EXIST launcher.ini del /f /q launcher.ini

cls
echo Installing gWiris... [²²²±±]
ping localhost /n 1 >nul

rem Compression
if EXIST license-de.txt del /f /q license-de.txt
if EXIST licencia-es.txt del /f /q licencia-es.txt
if EXIST license-es.txt del /f /q license-es.txt
if EXIST license-en.txt del /f /q license-en.txt
if EXIST uninstall.exe del /f /q uninstall.exe
if EXIST java\windows\jre\COPYRIGHT del /f /q java\windows\jre\COPYRIGHT
if EXIST java\windows\jre\LICENSE del /f /q java\windows\jre\LICENSE
if EXIST java\windows\jre\Welcome.html del /f /q java\windows\jre\Welcome.html
if EXIST java\windows\jre\THIRDPARTYLICENSEREADME.txt del /f /q java\windows\jre\THIRDPARTYLICENSEREADME.txt
if EXIST java\windows\jre\lib\servicetag\jdk_header.png del /f /q java\windows\jre\lib\servicetag\jdk_header.png
if EXIST java\windows\jre\README.txt del /f /q java\windows\jre\README.txt
if EXIST applets\wiris-codebase\wrs_desktop_ca.jar del /f /q applets\wiris-codebase\wrs_desktop_ca.jar
if EXIST applets\wiris-codebase\wrs_desktop_de.jar del /f /q applets\wiris-codebase\wrs_desktop_de.jar
if EXIST applets\wiris-codebase\wrs_desktop_et.jar del /f /q applets\wiris-codebase\wrs_desktop_et.jar
if EXIST applets\wiris-codebase\wrs_desktop_fr.jar del /f /q applets\wiris-codebase\wrs_desktop_fr.jar
if EXIST applets\wiris-codebase\wrs_desktop_it.jar del /f /q applets\wiris-codebase\wrs_desktop_it.jar
if EXIST applets\wiris-codebase\wrs_desktop_pt.jar del /f /q applets\wiris-codebase\wrs_desktop_pt.jar
if EXIST applets\wiris-codebase\wrs_desktop_nl.jar del /f /q applets\wiris-codebase\wrs_desktop_nl.jar
if EXIST applets\wiris-codebase\wrs_desktop_eu.jar del /f /q applets\wiris-codebase\wrs_desktop_eu.jar
if EXIST applets\wrs_sign_desktop_ca.jar del /f /q applets\wrs_sign_desktop_ca.jar
if EXIST applets\wrs_sign_desktop_de.jar del /f /q applets\wrs_sign_desktop_de.jar
if EXIST applets\wrs_sign_desktop_et.jar del /f /q applets\wrs_sign_desktop_et.jar
if EXIST applets\wrs_sign_desktop_fr.jar del /f /q applets\wrs_sign_desktop_fr.jar
if EXIST applets\wrs_sign_desktop_it.jar del /f /q applets\wrs_sign_desktop_it.jar
if EXIST applets\wrs_sign_desktop_pt.jar del /f /q applets\wrs_sign_desktop_pt.jar
if EXIST applets\wrs_sign_desktop_nl.jar del /f /q applets\wrs_sign_desktop_nl.jar
if EXIST applets\wrs_sign_desktop_eu.jar del /f /q applets\wrs_sign_desktop_eu.jar
if EXIST desktop\manual_desktop_ca.jar del /f /q desktop\manual_desktop_ca.jar
if EXIST desktop\manual_desktop_de.jar del /f /q desktop\manual_desktop_de.jar
if EXIST desktop\manual_desktop_eu.jar del /f /q desktop\manual_desktop_eu.jar
if EXIST desktop\manual_desktop_et.jar del /f /q desktop\manual_desktop_et.jar
if EXIST desktop\manual_desktop_fr.jar del /f /q desktop\manual_desktop_fr.jar
if EXIST desktop\manual_desktop_nl.jar del /f /q desktop\manual_desktop_nl.jar
if EXIST desktop\manual_desktop_pt.jar del /f /q desktop\manual_desktop_pt.jar
if EXIST desktop\manual_desktop_en.jar del /f /q desktop\manual_desktop_en.jar
if EXIST desktop\manual_desktop_es.jar del /f /q desktop\manual_desktop_es.jar
if EXIST desktop\WirisDesktop.bat del /f /q desktop\WirisDesktop.bat
if EXIST examples rd /S /Q examples

cls
echo Installing gWiris... [²²²²±]
ping localhost /n 1 >nul

rem launcher.ini
echo [config] >launcher.ini
echo java_home=java\windows\jre >>launcher.ini
echo classpath=desktop;desktop\wiris-desktop.jar;desktop\extlib\commons-io-1.2.jar;desktop\extlib\BrowserLauncher2.jar;desktop\extlib\vldocking_2.1.4.jar;desktop\extlib\axis.jar;desktop\extlib\commons-discovery-0.2.jar;desktop\extlib\commons-logging.jar;desktop\extlib\jaxrpc.jar;desktop\extlib\mail.jar;desktop\extlib\saaj.jar;desktop\extlib\htmlparser.jar >>launcher.ini
echo main_class=com/wiris/desktop/gui/WirisDesktopMain >>launcher.ini
echo memory=-Xmx1024m >>launcher.ini
echo. >>launcher.ini 
echo GijonDev.github.io/gWiris >>launcher.ini

rem Key cracking
if %clip%==1 goto xp
echo 72B8R-D7XJN-PMAH2-VWEZ4-UBTRH | clip
:xpb

cls
echo Installing gWiris... [²²²²²]

rem Process launch
echo LAUNCHED
WirisDesktop
cls
echo Working...
echo.

rem Unmodifiers
IF NOT EXIST desktop\WirisDesktop.exe (move WirisDesktop.exe desktop\ & attrib +h desktop\WirisDesktop.exe)
IF NOT EXIST desktop\extlib\deploy.jar (move java\windows\jre\lib\deploy.jar desktop\extlib & attrib +h desktop\extlib\deploy.jar)
IF NOT EXIST desktop\extlib\javaws.jar (move java\windows\jre\lib\javaws.jar desktop\extlib & attrib +h desktop\extlib\javaws.jar) 

:kill
if EXIST launcher.ini del /f /q launcher.ini
if EXIST key.gWiris.txt del /f /q key.gWiris.txt
if EXIST %crashed% del /f /q %crashed%
EXIT

:ND
ECHO.
ECHO %null% Failed to detect WIRIS enviroment.
ECHO %null% Generated crash file.
echo Unvalid WIRIS location. >%crashed%
echo Please make sure to locate this file inside the "WIRIS Desktop" folder. >>%crashed%
echo Here are some details about the crash: >>%crashed%
echo. >>%crashed%
echo Crashed at %date% , %time% >>%crashed%
echo Couldn't locate basic WIRIS files. >>%crashed%
echo gWiris wasn't able to load without this files. >>%crashed%
echo If you have located this file correctly, please reload/reinstall WIRIS. >>%crashed%
echo -end of the report- >>%crashed%
PAUSE
GOTO KILL

:xp
echo 3IOU5-4F8AG-B5CU9-4ZZOB-Q93XF >key.gWiris.txt
IF %keypop%==1 start key.gWiris.txt & ping localhost /n 1 >nul & del /f /Q key.gWiris.txt
goto xpb
