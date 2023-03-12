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

GOTO NEXT
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

:NEXT

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