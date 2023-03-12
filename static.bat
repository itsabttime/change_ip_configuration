setlocal enabledelayedexpansion
@echo off
color f
cls
echo. &echo.
echo ----IP SETTINGS----
ECHO Press 2 to change
choice /c 12 /d 1 /t 1 >nul
 (if %errorlevel% NEQ 2 goto next)
echo on
set /p ip_addr=
set /p subn_=
set /p getaway=
echo off
goto skip
:next
set ip_addr=192.168.1.12
set subn_=255.255.255.0
set getaway=192.168.1.1
:skip
echo.  IP Address...=%ip_addr%
echo. Subnet.......=%subn_%
echo. Gateway......=%getaway%
timeout 1 >NUL
color 5c
set folder=%~dp0
tasklist /fi "windowtitle eq lame*" | find "cmd.exe"&&set /a var=0

if NOT EXIST config203982.conf (  goto check )
for /f "tokens=* delims= " %%i in (config203982.conf) do set interface=%%i
choice /c 12 /d 1 /t 1 >nul
 (if %errorlevel%==2 goto over)& color F
cls&for /l %%i in (1,1,30) do echo static address   IP=%ip_addr%
color 5C&choice /c 12 /d 1 /t 1 >nul&
 (if %errorlevel%==2 (goto over))&color 5d&timeout 1 >nul & color F
color 5C
cls&for /l %%i in (1,1,20) do echo.  static address SB=%subn_%
timeout 1 >nul &color 5C&timeout 1 >nul&color 5d&timeout 1 >nul & color F
cls&for /l %%i in (1,1,50) do echo static address
color 5C&timeout 1 >nul&color 5d&timeout 1 >nul & color F&cls

ECHO WAITING FOR SUCCESSFUL TRANSFER...
netsh interface ip set address name="%interface%" static %ip_addr% %subn_% %getaway%


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