@echo off
setlocal enabledelayedexpansion
if NOT EXIST config203982.conf (  goto check )
set folder=%~dp0
rem christian logic' software
mode 60,25
tasklist /fi "windowtitle eq lame*" | find "cmd.exe"&&set /a var=1
for /f "tokens=* delims= " %%i in (config203982.conf) do set interface=%%i
choice /c 12 /d 1 /t 1 >nul
 (if %errorlevel%==2 goto over)& color F
cls&for /l %%i in (1,1,20) do echo. Enable DHCP      Manager for         IP ADDRESS CONFIGURATION
color F
cls&for /l %%i in (1,1,20) do echo.  Enable DHCP     Manager for         IP ADDRESS CONFIGURATION
color 5C&choice /c 12 /d 1 /t 1 >nul&
 (if %errorlevel%==2 (goto over))&color 5d&timeout 1 >nul & color F
color 5C
cls&for /l %%i in (1,1,20) do echo. Enable DHCP      Manager for         IP ADDRESS CONFIGURATION
timeout 1 >nul &color 5C&timeout 1 >nul&color 5d&timeout 1 >nul & color F
cls&for /l %%i in (1,1,20) do echo.  Enable DHCP     Manager for         IP ADDRESS CONFIGURATION
cls&for /l %%i in (1,1,20) do echo. Enable DHCP      Manager for         IP ADDRESS CONFIGURATION

ECHO WAITING FOR SUCCESSFUL TRANSFER...
netsh interface ip set address "%interface%" dhcp


timeout 5 >NUL
ipconfig
pause
:over

ipconfig & timeout 3 >nul
title lame

if "%var%"=="1"  exit
wscript "%folder%\dhcp.vbs"
timeout 5


goto esof

:check
mode 30,10 &cls& echo Running Wizard....&TIMEOUT 2 >nul
start cmd /v:on /c "@echo off &if NOT EXIST str.bat (ECHO NOT FOUND STR.BAT & PAUSE) ELSE (str.bat)"
cls&echo.Run the program again.Please&PAUSE&exit

:esof
PAUSE
EXIT
REM PLEASE KEEP SPACE BELOW
