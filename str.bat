@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
:back
echo Choose (1) Wi-Fi (2) Ethernet
set /p option=
if "!option!"=="1" goto wifi
if "!option!"=="2" goto ethernet
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


PAUSE
