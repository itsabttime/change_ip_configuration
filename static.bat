setlocal enabledelayedexpansion
@echo off
set folder=%~dp0
tasklist /fi "windowtitle eq lame*" | find "cmd.exe"&&set /a var=0

if NOT EXIST config203982.conf (  goto check )
for /f "tokens=* delims= " %%i in (config203982.conf) do set interface=%%i
choice /c 12 /d 1 /t 1 >nul
 (if %errorlevel%==2 goto over)& color F
cls&for /l %%i in (1,1,10) do echo enter&echo.(1)DHCP &echo. (2)DYNM
color 5C&choice /c 12 /d 1 /t 1 >nul&
 (if %errorlevel%==2 (goto over))&color 5d&timeout 1 >nul & color F
color 5C
cls&for /l %%i in (1,1,10) do echo enter&echo.(1)DHCP &echo. (2)DYNM
timeout 1 >nul &color 5C&timeout 1 >nul&color 5d&timeout 1 >nul & color F
cls&for /l %%i in (1,1,10) do echo enter&echo.(1)DHCP &echo. (2)DYNM
color 5C&timeout 1 >nul&color 5d&timeout 1 >nul & color F&cls

ECHO WAITING FOR SUCCESSFUL TRANSFER...
netsh interface ip set address name="%interface%" static 192.168.1.12 255.255.255.0 192.168.1.1


timeout 5 >NUL
ipconfig
pause
:over
ipconfig & timeout 3 >nul
title lame
if "%var%"=="1"  exit
wscript "%folder%\static.vbs"
timeout 5

goto esof

:check
mode 30,10 &cls& echo Running Wizard....&TIMEOUT 2 >nul
start cmd /v:on /c "@echo off &if NOT EXIST str.bat (ECHO NOT FOUND STR.BAT & PAUSE) ELSE (str.bat)"
cls&echo.Run the program again.Please&PAUSE&exit

:esof
PAUSE
EXIT