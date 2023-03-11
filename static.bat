@echo off
tasklist /fi "windowtitle eq lame*" | find "cmd.exe"&&set /a var=0
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
netsh interface ip set address name="Ethernet" static 192.168.1.12 255.255.255.0 192.168.1.1


timeout 5 >NUL
ipconfig
pause
:over
ipconfig & timeout 3 >nul
title lame
if "%var%"=="1"  exit
wscript "C:\Users\Anil Bapna\Desktop\New folder\static.vbs"
timeout 5