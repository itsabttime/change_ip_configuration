@echo off
setlocal
echo checking conf
if NOT EXIST config203982.conf (  echo NOT FOUND conf file )
type config203982.conf
:back
set strone=%1
if "%strone%"=="9009" goto wizard
if "%strone%"=="1" title Admin&goto static
if "%strone%"=="2" title Admin&goto dynamic
echo.Script will restart once to run with Admin priveleges.
echo 1. static 2. dynamic 3. Reset start over
set /p enter=
if %enter%==1 goto static
if %enter%==2 goto dynamic
if %enter%==3 goto delcon
goto back
:delcon
del config203982.conf
:dynamic
@echo off
setlocal enabledelayedexpansion
if NOT EXIST config203982.conf (  goto check )
set folder=%~dp0
rem christian logic' software
mode 60,25
tasklist /fi "windowtitle eq lame*" | find "cmd.exe"&&set /a var=1
cls 
echo Reading from conf file               config203982.conf
echo Please delete the file to change the interface setting.
echo IF YOU RAN INTO ERRORS, CHECK THE INTERFACE NAME IN THE CONF FILE
for /f "tokens=* delims= " %%i in (config203982.conf) do set interface=%%i




ECHO WAITING FOR SUCCESSFUL TRANSFER...

echo netsh interface ip set address x%interface%x dhcp
netsh interface ip set address %interface% dhcp


timeout 5 >NUL
ipconfig
pause
:overone

ipconfig & timeout 3 >nul
title lame

if "%var%"=="1"  exit
echo 'output of combined.bat file https://github.com/xtremblorx/change_ip_configuration/blob/main/combined.bat >temp302923.vbs
echo Set objShell = CreateObject("Shell.Application") >>temp302923.vbs
echo Set FSO = CreateObject("Scripting.FileSystemObject") >>temp302923.vbs 
echo strPath = FSO.GetParentFolderName (WScript.ScriptFullName) >>temp302923.vbs 
echo extra = "cd " ^& Chr(34) ^& strPath ^& Chr(34) ^& " & "  >>temp302923.vbs 
echo objShell.ShellExecute "cmd", "/c " ^& Chr(34) ^& extra ^& " .\combined.bat 2" ^& Chr(34), "", "runas" >>temp302923.vbs 
wscript "%folder%\temp302923.vbs"
REM temp302923.vbs
cls
echo Ipconfig:
timeout 5 >NUL


goto esof

:check
mode 30,10 &cls&echo.config203982.conf missing.&echo. Please generate it
echo Running Conf Wizard....&TIMEOUT 2 >nul
start cmd /v:on /c "@echo off &if NOT EXIST str.bat (ECHO NOT FOUND STR.BAT & PAUSE) ELSE (str.bat)"
exit

:esof
PAUSE
EXIT
REM PLEASE KEEP SPACE BELOW
:static
endlocal









setlocal enabledelayedexpansion
@echo off
color f
cls
echo. &echo.
echo ----IP SETTINGS----
ECHO Press 2 to change
choice /c 12 /d 1 /t 2 >nul
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
timeout 2 >NUL

set folder=%~dp0
tasklist /fi "windowtitle eq lame*" | find "cmd.exe"&&set /a var=0

if NOT EXIST config203982.conf (  goto check )
cls
echo Reading from conf file               config203982.conf
echo Please delete the file to change the interface setting.
echo IF YOU RAN INTO ERRORS, CHECK THE INTERFACE NAME IN THE CONF FILE
for /f "tokens=* delims= " %%i in (config203982.conf) do set interface=%%i


ECHO WAITING FOR SUCCESSFUL TRANSFER...
echo netsh interface ip set address name=%interface% static %ip_addr% %subn_% %getaway%
netsh interface ip set address name=%interface% static %ip_addr% %subn_% %getaway%
cls
echo Ipconfig:
timeout 5 >NUL
ipconfig
pause
:over

title lame
if "%var%"=="1"  exit
echo 'output of combined.bat file https://github.com/xtremblorx/change_ip_configuration/blob/main/combined.bat >temp302923.vbs
echo Set objShell = CreateObject("Shell.Application") >>temp302923.vbs
echo Set FSO = CreateObject("Scripting.FileSystemObject") >>temp302923.vbs 
echo strPath = FSO.GetParentFolderName (WScript.ScriptFullName) >>temp302923.vbs 
echo extra = "cd " ^& Chr(34) ^& strPath ^& Chr(34) ^& " & "  >>temp302923.vbs 
echo objShell.ShellExecute "cmd", "/c " ^& Chr(34) ^& extra ^& " .\combined.bat 1" ^& Chr(34), "", "runas" >>temp302923.vbs 
wscript "%folder%\temp302923.vbs"
REM del temp302923.vbs
timeout 5

goto esof

:check
mode 30,10 &cls&echo.config203982.conf missing.&echo. Please generate it
echo Running Conf Wizard....&TIMEOUT 2 >nul
start cmd /v:on /c "@echo off &if NOT EXIST str.bat (ECHO NOT FOUND STR.BAT & PAUSE) ELSE (str.bat)"
exit
:esof
PAUSE
EXIT
:wizard
endlocal

@echo off
title config generator
SETLOCAL ENABLEDELAYEDEXPANSION
:back
echo Choose (1) Wi-Fi (2) Ethernet (3) Manual (4) Auto (uses powershell)
set /p option=
if "!option!"=="1" goto wifi
if "!option!"=="2" goto ethernet
if "!option!"=="3" goto auto
if "!option!"=="4" goto autotwo
goto back 
:wifi
set /a counter=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Wireless Lan adapter" ^| findstr /r ":$"') DO set /a counter+=1 & echo !counter!..%%i
echo Enter VALID:::
for /l %%i in (1,1,%counter%) do echo|set /p=Option (%%i)
echo.&echo| set /p=">>>>>>>>>>>
set /p option=
set /a counter=0
set /a option=!option!
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Wireless Lan adapter"') DO set /a counter+=1 & if !counter!==!option! set str=%%i
set str=%str::=%
echo !str!
echo on
powershell -c "$str=\"!str!\";$str.replace('Wireless LAN adapter','')" >config203982.conf

GOTO NEXTeleven
:Ethernet

set /a counter=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Ethernet adapter" ^| findstr /r ":$"') DO set /a counter+=1 & echo !counter!..%%i
echo Enter VALID:::
for /l %%i in (1,1,%counter%) do echo|set /p=Option (%%i)
echo.&echo| set /p=">>>>>>>>>>>
set /p option=
set /a counter=0
set /a option=!option!
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Ethernet adapter"') DO set /a counter+=1 & if !counter!==!option! set str=%%i
set str=%str::=%
echo !str!
powershell -c "$str=\"!str!\";$str.replace('Ethernet adapter','')" >config203982.conf

:NEXTeleven

echo !str!

@echo off
timeout 1 >NUL
cls
echo.&echo.GENERATED config203982.conf 

echo Please delete the file to reset interface settings.
echo.&PAUSE&Exit

:Auto
Endlocal
Setlocal enabledelayedexpansion
set /a counter=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Ethernet adapter" ^| findstr /r ":$"') DO set /a counter+=1 
set /a count=0
:loopone
set /a count+=1
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Ethernet adapter" ^| findstr /r ":$"') DO set /a strcount+=1 & set str=%%i & if !strcount!==!count! goto two
:two
for /f "delims=*" %%i in ('powershell -c "$str=\"!str!\";$str.replace(\"Ethernet adapter\",\"\")"') do ( set str=%%i & set str=!str::=! & echo INTERFACE name found....!str!. )
echo.
if !counter! LSS !count! goto there
choice /c 12 /d 1 /t 5 /m "Press 2 to register this interface ....or wait to skip"
if !errorlevel!==2 ( echo "!str!">config203982.conf&EXIT )
cls
if !counter! LEQ !count! ( Goto there ) else ( Goto loopone )
:there
set /a counter=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Wireless LAN adapter" ^| findstr /r ":$"') DO set /a counter+=1 
set /a count=0
:looptoo
set /a count+=1
set /a strcount=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Wireless LAN adapter" ^| findstr /r ":$"') DO set /a strcount+=1 & set str=%%i & if !strcount!==!count! goto two
:two
for /f "delims=*" %%i in ('powershell -c "$str=\"!str!\";$str.replace(\"Wireless LAN adapter\",\"\")"') do ( set str=%%i & set str=!str::=! & echo INTERFACE name found....!str!. )
echo.
if !counter! LSS !count! goto fere
choice /c 12 /d 1 /t 5 /m "Press 2 to register this interface ....or wait to skip"
if !errorlevel!==2 ( echo "!str!">config203982.conf&EXIT )
cls
if !counter! LEQ !count! ( Goto fere ) else ( Goto looptoo )
:fere
echo conf file not generated&pause&exit
:Autotwo
endlocal
setlocal enabledelayedexpansion
set /a counter=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Ethernet adapter" ^| findstr /r ":$"') DO set /a counter+=1 
set /a count=0
:looponetwo
set /a count+=1
set /a strcount=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Ethernet adapter" ^| findstr /r ":$"') DO set /a strcount+=1 & set str=%%i & if !strcount!==!count! goto twotwo
:twotwo
for /f "delims=*" %%i in ('powershell -c "$str=\"!str!\";$str.replace(\"Ethernet adapter\",\"\")"') do ( set str=%%i & set str=!str::=! & echo !str! )
netsh interface show interface !str! | find "Connected"&&echo !str!>config203982.conf
if !counter! LEQ !count! ( Goto theretwo ) else ( Goto looponetwo )
:theretwo
set /a counter=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Wireless LAN adapter" ^| findstr /r ":$"') DO set /a counter+=1 
set /a count=0
:looptoothree

set /a count+=1
set /a strcount=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Wireless LAN adapter" ^| findstr /r ":$"') DO set /a strcount+=1 & set str=%%i & if !strcount!==!count! goto twothree
:twothree
for /f "delims=*" %%i in ('powershell -c "$str=\"!str!\";$str.replace(\"Wireless LAN adapter\",\"\")"') do ( set str=%%i & set str=!str::=! & echo !str!)& netsh interface show interface !str! |Find "Connected"&&echo !str!>config203982.conf
if !counter! LEQ !count! ( Goto ferethree ) else ( Goto looptoothree )
:ferethree

pause