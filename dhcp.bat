@echo off
set folder=%~dp0
rem christian logic' software
mode 60,25
tasklist /fi "windowtitle eq lame*" | find "cmd.exe"&&set /a var=1
choice /c 12 /d 1 /t 1 >nul
 (if %errorlevel%==2 goto over)& color F
cls&for /l %%i in (1,1,20) do echo. (1)DHCP &echo. (2)DYNM.      Manager for         IP ADDRESS CONFIGURATION
color F
cls&for /l %%i in (1,1,20) do echo. (2)DYNM&echo. (1)DHCP.       Manager for         IP ADDRESS CONFIGURATION
color 5C&choice /c 12 /d 1 /t 1 >nul&
 (if %errorlevel%==2 (goto over))&color 5d&timeout 1 >nul & color F
color 5C
cls&for /l %%i in (1,1,20) do echo. (1)DHCP &echo. (2)DYNM.      Manager for         IP ADDRESS CONFIGURATION
timeout 1 >nul &color 5C&timeout 1 >nul&color 5d&timeout 1 >nul & color F
cls&for /l %%i in (1,1,20) do echo. (2)DYNM&echo. (1)DHCP.       Manager for         IP ADDRESS CONFIGURATION
cls&for /l %%i in (1,1,20) do echo. (1)DHCP. &echo. (2)DYNM      Manager for         IP ADDRESS CONFIGURATION
color 5C&timeout 1 >nul&color 5d&timeout 1 >nul & color F&cls

ECHO WAITING FOR SUCCESSFUL TRANSFER...
netsh interface ip set address "Ethernet" dhcp


timeout 5 >NUL
ipconfig
pause
:over

ipconfig & timeout 3 >nul
title lame

if "%var%"=="1"  exit
wscript "%folder%\dhcp.vbs"
timeout 5