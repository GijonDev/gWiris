@echo off

color 07
echo Installing Root... [�����]
ping localhost /n 1 >nul

rem Session installation
set /a id=%random% %% 10000
set version=15
set "crashed=crash#%stable%.txt"
title gWiris [b%version%] - %PROCESSOR_IDENTIFIER%
echo [%date% , %time%][w%patch%] Logged in. (%id%) >>%userprofile%\RootSessionsFile.inf

rem Wiris Enviroment Checker
IF NOT EXIST desktop\wiris-desktop.jar GOTO ND
IF NOT EXIST applets\wiris-codebase\wrs_desktop_en.jar GOTO ND
IF NOT EXIST applets\wiris-codebase\wrs_desktop_es.jar GOTO ND
IF NOT EXIST java\windows\jre\bin\javaw.exe GOTO ND

cls
echo Installing Root... [�����]
ping localhost /n 1 >nul

rem Avaiability
if EXIST desktop\extlib\deploy.jar attrib -h desktop\extlib\deploy.jar
if EXIST desktop\extlib\javaws.jar attrib -h desktop\extlib\javaws.jar
if EXIST desktop\WirisDesktop.exe attrib -h desktop\WirisDesktop.exe
if NOT EXIST java\windows\jre\lib\deploy.jar move desktop\extlib\deploy.jar java\windows\jre\lib\
if NOT EXIST java\windows\jre\lib\javaws.jar move desktop\extlib\javaws.jar java\windows\jre\lib\
if NOT EXIST WirisDesktop.exe move desktop\WirisDesktop.exe 


rem Windows XP Compatibility mode
if "%userprofile%" == "C:\Documents and Settings\%username%" (set clip=1) ELSE (set clip=0)

cls
echo Installing Root... [�����]
ping localhost /n 1 >nul

rem Legacy and outputs deletings
if EXIST *.txt del *.txt
if EXIST *.ini del *.ini
if EXIST Wz.flag.cmd del Wz.flag.cmd

cls
echo Installing Root... [�����]
ping localhost /n 1 >nul

rem Compression
if EXIST applets\locale.url del applets\locale.url
if EXIST license-de.txt del license-de.txt
if EXIST license-es.txt del license-es.txt
if EXIST license-en.txt del license-en.txt
if EXIST uninstall.exe del uninstall.exe
if EXIST java\windows\jre\COPYRIGHT del java\windows\jre\COPYRIGHT
if EXIST java\windows\jre\LICENSE del java\windows\jre\LICENSE
if EXIST java\windows\jre\Welcome.html del java\windows\jre\Welcome.html
if EXIST java\windows\jre\THIRDPARTYLICENSEREADME.txt del java\windows\jre\THIRDPARTYLICENSEREADME.txt
if EXIST java\windows\jre\lib\servicetag\jdk_header.png del java\windows\jre\lib\servicetag\jdk_header.png
if EXIST java\windows\jre\README.txt del java\windows\jre\README.txt
if EXIST applets\wiris-codebase\wrs_desktop_ca.jar del applets\wiris-codebase\wrs_desktop_ca.jar
if EXIST applets\wiris-codebase\wrs_desktop_de.jar del applets\wiris-codebase\wrs_desktop_de.jar
if EXIST applets\wiris-codebase\wrs_desktop_et.jar del applets\wiris-codebase\wrs_desktop_et.jar
if EXIST applets\wiris-codebase\wrs_desktop_fr.jar del applets\wiris-codebase\wrs_desktop_fr.jar
if EXIST applets\wiris-codebase\wrs_desktop_it.jar del applets\wiris-codebase\wrs_desktop_it.jar
if EXIST applets\wiris-codebase\wrs_desktop_pt.jar del applets\wiris-codebase\wrs_desktop_pt.jar
if EXIST applets\wiris-codebase\wrs_desktop_nl.jar del applets\wiris-codebase\wrs_desktop_nl.jar
if EXIST applets\wiris-codebase\wrs_desktop_eu.jar del applets\wiris-codebase\wrs_desktop_eu.jar
if EXIST desktop\manual_desktop_ca.jar del desktop\manual_desktop_ca.jar
if EXIST desktop\manual_desktop_de.jar del desktop\manual_desktop_de.jar
if EXIST desktop\manual_desktop_eu.jar del desktop\manual_desktop_eu.jar
if EXIST desktop\manual_desktop_et.jar del desktop\manual_desktop_et.jar
if EXIST desktop\manual_desktop_fr.jar del desktop\manual_desktop_fr.jar
if EXIST desktop\manual_desktop_nl.jar del desktop\manual_desktop_nl.jar
if EXIST desktop\manual_desktop_pt.jar del desktop\manual_desktop_pt.jar
if EXIST desktop\manual_desktop_en.jar del desktop\manual_desktop_en.jar
if EXIST desktop\manual_desktop_es.jar del desktop\manual_desktop_es.jar
if EXIST desktop\WirisDesktop.bat del desktop\WirisDesktop.bat
if EXIST examples rd /S /Q examples

cls
echo Installing Root... [�����]
ping localhost /n 1 >nul

rem launcher.ini
echo [config] >launcher.ini
echo java_home=java\windows\jre >>launcher.ini
echo classpath=desktop;desktop\wiris-desktop.jar;desktop\extlib\commons-io-1.2.jar;desktop\extlib\BrowserLauncher2.jar;desktop\extlib\vldocking_2.1.4.jar;desktop\extlib\axis.jar;desktop\extlib\commons-discovery-0.2.jar;desktop\extlib\commons-logging.jar;desktop\extlib\jaxrpc.jar;desktop\extlib\mail.jar;desktop\extlib\saaj.jar;desktop\extlib\htmlparser.jar >>launcher.ini
echo main_class=com/wiris/desktop/gui/WirisDesktopMain >>launcher.ini
echo memory=-Xmx1024m >>launcher.ini
echo. >>launcher.ini 
echo Last session key = [%username%:%stable%] >>launcher.ini
echo GijonDev.github.io >>launcher.ini

rem Key cracking
if "%clip%" == "1" goto xp
echo 72B8R-D7XJN-PMAH2-VWEZ4-UBTRH | clip
:xpb

cls
echo Installing Root... [�����]

rem Process launch
echo.
echo Launched Wiris
WirisDesktop
echo Closed Wiris
echo Killing...
echo.

rem Unmodifiers
set errorlevel=0
IF NOT EXIST desktop\WirisDesktop.exe move WirisDesktop.exe desktop\
IF NOT EXIST desktop\extlib\deploy.jar move java\windows\jre\lib\deploy.jar desktop\extlib
IF NOT EXIST desktop\extlib\javaws.jar move java\windows\jre\lib\javaws.jar desktop\extlib
IF EXIST desktop\extlib\deploy.jar attrib +h desktop\extlib\deploy.jar
IF EXIST desktop\extlib\javaws.jar attrib +h desktop\extlib\javaws.jar
IF EXIST desktop\WirisDesktop.exe attrib +h desktop\WirisDesktop.exe

:kill
if EXIST launcher.ini del launcher.ini
goto eof

rem -------------------------------------------------------------------------------------
:ND
ECHO.
ECHO %null% Failed to detect WIRIS enviroment.
ECHO %null% Generated crash file.
echo Unvalid WIRIS location. >%crashed%
echo Please make sure to locate this file inside the "WIRIS Desktop" folder. >>%crashed%
echo Here are some details about the crash: >>%crashed%
echo. >>%crashed%
echo Crashed at %date% , %time% local timezone. >>%crashed%
echo Couldn't locate basic WIRIS files. >>%crashed%
echo gWiris wasn't able to load without this files. >>%crashed%
echo If you have located this file correctly, please reload/reinstall gWiris. >>%crashed%
echo -end of the report- >>%crashed%
PAUSE
GOTO KILL

:xp
echo %null% [XP/2000] Key cracking: 3IOU5-4F8AG-B5CU9-4ZZOB-Q93XF
goto xpb

rem You may need admin rights to complete every compression string.
rem -------------------------------------------------------------------------------------
:eof
