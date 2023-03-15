@echo off
:lang 
if EXIST  config203982.conf for /f "delims=" %%i in (config203982.conf) do for /f "delims=*" %%a in ('echo %%i ^| find "lang:" ') do for /f "tokens=1,2 delims=:" %%j in ("%%a") do set lang=%%k


set script=%~nx0
if DEFINED lang (goto returnskip)
echo (1)English(2)Portuguese(3)Russian(4)Spanish
set /p lang=
:returnskip
if "%lang%"=="" (set lang=1)
if "%lang%"=="1" (goto enlish)
if "%lang%"=="2" (goto por2ges)
if "%lang%"=="3" (goto russian)
if "%lang%"=="4" (goto espanol)

REM TRANSLATION SECTION
:enlish
chcp 437
set string1=checking conf
set string2=NOT FOUND conf file
set string3=Script will restart once to run with Admin priveleges.
set string4=1. static 2. dynamic 3. set interface 4. language
set string6=Reading from conf file               config203982.conf
set string7=Please delete the file to change the interface setting.
set string8=SCRIPT WILL START AGAIN IN FEW SECONDS.......THANK YOU!
set string9=----IP SETTINGS----
set string10=Press 2 to Manually Enter Details
set string11=Choose (1) Wi-Fi (2) Ethernet (3) Manual (4) Auto (uses powershell)
set string12=Enter VALID:::
set string13=Option
set string14=GENERATED config203982.conf 
set string15=Please delete the file to reset interface settings.
set string16=conf file not generated
set string17=Press 2 to register this interface ....or wait to skip
set string20=INTERFACE name found
set string21=Press 3 to Load Configuration
set string22=Press 2 to Save Configuration
goto return
:por2ges
chcp 65001
set string1=verificando conf
set string2=arquivo conf NÃO ENCONTRADO
set string3=O script será reiniciado uma vez para executar com privilégios de administrador.
set string4=1. estático 2. dinâmico 3. interface definida 4. idioma
set string6=Lendo do arquivo conf config203982.conf
set string7=Por favor, exclua o arquivo para alterar a configuração da interface.
set string8=O SCRIPT COMEÇARÁ NOVAMENTE EM ALGUNS SEGUNDOS.......OBRIGADO!
set string9=----CONFIGURAÇÕES DE IP----
set string10=Pressione 2 para mudar
set string11=Escolha (1) Wi-Fi (2) Ethernet (3) Manual (4) Auto (usa powershell)
set string12=Digite VÁLIDO:::
set string13=Opção
set string14=GERADO config203982.conf
set string15=Por favor, exclua o arquivo para redefinir as configurações da interface.
set string16=arquivo conf não gerado
set string17=Pressione 2 para registrar esta interface ....ou espere para pular
set string20=Nome da INTERFACE encontrado
goto return
:russian
chcp 855
set string1=проверка конфига
set string2 = НЕ НАЙДЕН файл конфигурации
set string3=Сценарий будет перезапущен один раз для запуска с правами администратора.
set string4=1. статический 2. динамический 3. установить интерфейс 4. язык
set string6= Чтение из файла конфигурации config203982.conf
set string7=Удалите файл, чтобы изменить настройки интерфейса.
set string8=СЦЕНАРИЙ ЗАПУСТИТСЯ СНОВА ЧЕРЕЗ НЕСКОЛЬКО СЕКУНД ....... СПАСИБО!
set string9=----НАСТРОЙКИ IP----
set string10=Нажмите 2, чтобы изменить
set string11= Выберите (1) Wi-Fi (2) Ethernet (3) Вручную (4) Авто (использует powershell)
set string12=Введите ДЕЙСТВИТЕЛЬНО:::
set string13= опция
set string14= ГЕНЕРИРОВАННЫЙ config203982.conf
set string15=Удалите файл, чтобы сбросить настройки интерфейса.
set string16= файл conf не создан
set string17=Нажмите 2, чтобы зарегистрировать этот интерфейс ....или подождите, чтобы пропустить
set string20=Имя ИНТЕРФЕЙСА найдено
goto return
:espanol
chcp 65001
set string1=comprobando conf
set string2=NO ENCONTRADO archivo conf
set string3=El script se reiniciará una vez para ejecutarse con privilegios de administrador.
set string4=1. estático 2. dinámico 3. establecer interfaz 4. idioma
set string6=Leyendo del archivo conf config203982.conf
set string7=Elimine el archivo para cambiar la configuración de la interfaz.
set string8=EL GUIÓN COMENZARÁ DE NUEVO EN POCOS SEGUNDOS... ¡MUCHAS GRACIAS!
set string9=----CONFIGURACIÓN DE IP----
set string10=Presione 2 para cambiar
set string11=Elegir (1) Wi-Fi (2) Ethernet (3) Manual (4) Automático (usa powershell)
set string12=Ingrese VÁLIDO:::
set string13=Opción
set string14=GENERATED config203982.conf
set string15=Elimine el archivo para restablecer la configuración de la interfaz.
set string16=archivo conf no generado
set string17=Presione 2 para registrar esta interfaz....o espere para omitir
set string20=Nombre de INTERFAZ encontrado
goto return
:return
setlocal
echo %string1%
if NOT EXIST config203982.conf (  echo %string2% )
type config203982.conf
:back
set strone=%1
set ip_addr=%2
set subn_=%3
set getaway=%4
if "%strone%"=="9009" goto wizard
if "%strone%"=="1" if "%ip_addr%" NEQ "" title Admin&CALL :static %ip_addr% %subn_% %getaway%
if "%strone%"=="2" title Admin&goto dynamic
echo.%string3%
echo %string4%
set /p enter=
if %enter%==1 goto static
if %enter%==2 goto dynamic
if %enter%==3 goto delcon
if %enter%==4 goto lang1
goto back
:lang1
echo Enter lang 1.english2.portugese3.russia4.spain &set /p lang=

if "%lang%"=="1" (for /f "delims=" %%i in ('type config203982.conf ^| find /v "lang:"') do echo %%i>>config203982temp.conf)&echo.lang:1:>>config203982temp.conf&del config203982.conf& rename config203982temp.conf config203982.conf
if "%lang%"=="2" (for /f "delims=" %%i in ('type config203982.conf ^| find /v "lang:"') do echo %%i>>config203982temp.conf)&echo.lang:2:>>config203982temp.conf&del config203982.conf& rename config203982temp.conf config203982.conf
if "%lang%"=="3" (for /f "delims=" %%i in ('type config203982.conf ^| find /v "lang:"') do echo %%i>>config203982temp.conf)&echo.lang:3:>>config203982temp.conf&del config203982.conf& rename config203982temp.conf config203982.conf
if "%lang%"=="4" (for /f "delims=" %%i in ('type config203982.conf ^| find /v "lang:"') do echo %%i>>config203982temp.conf)&echo.lang:4:>>config203982temp.conf&del config203982.conf& rename config203982temp.conf config203982.conf
if "%lang%"=="" ((for /f "delims=" %%i in ('type config203982.conf ^| find /v "lang:"') do echo %%i>>config203982temp.conf)&echo.lang:1:>>config203982temp.conf&del config203982.conf& rename config203982temp.conf config203982.conf)
echo Language Set
goto returnskip
:delcon
goto check
:dynamic
@echo off
setlocal enabledelayedexpansion
if NOT EXIST config203982.conf (  goto check )
set folder=%~dp0
rem christian logic' software
mode 60,25
tasklist /fi "windowtitle eq lame*" | find "cmd.exe"&&set /a var=1
cls 
echo %string6%
echo %string7%
echo.&echo. %string8%&echo.
for /f "tokens=1,2 delims=:" %%i in ('type config203982.conf ^| find "interface:"') do set interface=%%j
set str=!interface!
for /f "delims=" %%i in ('powershell -c "\"!interface!\".replace(\" \",\"`n\")"') do set ptr=%%i&goto nextproc
:nextproc
for /f "tokens=* delims= " %%i in ('powershell -c "$str = \"!str!\";$str.indexof(\"!ptr!\")"') do set ptrnum=%%i
set interface=!str:~%ptrnum%,250!



echo netsh interface ip set address name="!interface!" source=dhcp
netsh interface ip set address "!interface!" source=dhcp

timeout 5 >NUL
echo Ipconfig:
timeout 1 >NUL
ipconfig


title lame

if "%var%"=="1"  exit
echo 'output of combined.bat file https://github.com/xtremblorx/change_ip_configuration/blob/main/combined.bat >temp302923.vbs
echo Set objShell = CreateObject("Shell.Application") >>temp302923.vbs
echo Set FSO = CreateObject("Scripting.FileSystemObject") >>temp302923.vbs 
echo strPath = FSO.GetParentFolderName (WScript.ScriptFullName) >>temp302923.vbs 
echo extra = "cd " ^& Chr(34) ^& strPath ^& Chr(34) ^& " & "  >>temp302923.vbs 
echo objShell.ShellExecute "cmd", "/c " ^& Chr(34) ^& extra ^& " .\%script% 2" ^& Chr(34), "", "runas" >>temp302923.vbs 
wscript "%folder%\temp302923.vbs"
del temp302923.vbs


timeout 10
goto esof

exit

:esof
EXIT
REM PLEASE KEEP SPACE BELOW
:static
endlocal









setlocal enabledelayedexpansion
@echo off
tasklist /fi "windowtitle eq lame*" | find "cmd.exe"&&set /a var=1
set ip_addr=%~1
set subn_=%~2
set getaway=%~3
color f
cls
echo. &echo.
echo %string9%
ECHO %string10%
ECHO %string21%
if defined ip_addr ( if NOT DEFINED subn_ set subn_=255.255.255.0 )&( if NOT DEFINED getaway goto nekst )& goto skip
choice /c 123 /d 1 /t 2 >nul
 (if !errorlevel!==3 goto load )
 (if %errorlevel% NEQ 2 goto next)
:READER
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
goto skip
:load
set ip_addr=
if EXIST  config203982.conf for /f "delims=" %%i in (config203982.conf) do for /f "delims=*" %%a in ('echo %%i ^| find "IPAddr:" ') do for /f "tokens=1,2 delims=:" %%j in ("%%a") do set ip_addr=%%k
if EXIST  config203982.conf for /f "delims=" %%i in (config203982.conf) do for /f "delims=*" %%a in ('echo %%i ^| find "Subn:" ') do for /f "tokens=1,2 delims=:" %%j in ("%%a") do set subn_=%%k
if EXIST  config203982.conf for /f "delims=" %%i in (config203982.conf) do for /f "delims=*" %%a in ('echo %%i ^| find "GT:" ') do for /f "tokens=1,2 delims=:" %%j in ("%%a") do set getaway=%%k
if "!ip_addr!"=="" ECHO NO CONFIGURATION FOUND!&ECHO.PLEASE ENTER:&GOTO READER
:skip
echo.  IP Address...=%ip_addr%
echo. Subnet.......=%subn_%
echo. Gateway......=%getaway%

choice /c 12 /d 1 /t 5 /m "%string22%"
if !errorlevel!==2 ((for /f "delims=" %%i in ('type config203982.conf ^| find /v "IPAddr:"') do echo %%i>>config203982temp.conf)&echo.IPAddr:%ip_addr%:>>config203982temp.conf&del config203982.conf& rename config203982temp.conf config203982.conf&(for /f "delims=" %%i in ('type config203982.conf ^| find /v "Subn:"') do echo %%i>>config203982temp.conf)&echo.Subn:%subn_%:>>config203982temp.conf&del config203982.conf& rename config203982temp.conf config203982.conf&(for /f "delims=" %%i in ('type config203982.conf ^| find /v "GT:"') do echo %%i>>config203982temp.conf)&echo.GT:%getaway%:>>config203982temp.conf&del config203982.conf&rename config203982temp.conf config203982.conf)

set folder=%~dp0


if NOT EXIST config203982.conf (  goto check )
cls
echo %string6%
echo %string7%
echo.&echo. %string8%&echo.
for /f "tokens=1,2 delims=:" %%i in ('type config203982.conf ^| find "interface:"') do set interface=%%j
set str=!interface!
for /f "delims=" %%i in ('powershell -c "\"!interface!\".replace(\" \",\"`n\")"') do set ptr=%%i&goto nextprocto
:nextprocto
for /f "tokens=* delims= " %%i in ('powershell -c "$str = \"!str!\";$str.indexof(\"!ptr!\")"') do set ptrnum=%%i
set interface=!str:~%ptrnum%,250!


echo netsh interface ip set address name=!interface! static %ip_addr% %subn_% %getaway%
netsh interface ip set address name="!interface!" static %ip_addr% %subn_% %getaway%
timeout 5 >NUL
echo Ipconfig:
timeout 2 >NUL
ipconfig


title lame
if "%var%"=="1"  exit
echo 'output of combined.bat file https://github.com/xtremblorx/change_ip_configuration/blob/main/combined.bat >temp302923.vbs
echo Set objShell = CreateObject("Shell.Application") >>temp302923.vbs
echo Set FSO = CreateObject("Scripting.FileSystemObject") >>temp302923.vbs 
echo strPath = FSO.GetParentFolderName (WScript.ScriptFullName) >>temp302923.vbs 
echo extra = "cd " ^& Chr(34) ^& strPath ^& Chr(34) ^& " & "  >>temp302923.vbs 
echo objShell.ShellExecute "cmd", "/c " ^& Chr(34) ^& extra ^& " .\%script% 1 %ip_addr% %subn_% %getaway%" ^& Chr(34), "", "runas" >>temp302923.vbs 
wscript "%folder%\temp302923.vbs"
del temp302923.vbs
timeout 12
exit
:esof

EXIT
:wizard
:check
endlocal

@echo off
title config generator
SETLOCAL ENABLEDELAYEDEXPANSION
:back
echo %string11%
set /p option=
if "!option!"=="1" goto wifi
if "!option!"=="2" goto ethernet
if "!option!"=="3" goto auto
if "!option!"=="4" goto autotwo
goto back 
:wifi

set /a counter=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Wireless Lan adapter" ^| findstr /r ":$"') DO set /a counter+=1 & echo !counter!..%%i
echo %string12%
for /l %%i in (1,1,%counter%) do echo|set /p=%string13% (%%i)
echo.&echo| set /p=">>>>>>>>>>>
set /p option=
set /a counter=0
set /a option=!option!
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Wireless Lan adapter"') DO set /a counter+=1 & if !counter!==!option! set str=%%i
set str=%str::=%
echo !str!
echo on
for /f "delims=" %%i in ('type config203982.conf ^| find /v "interface:"') do echo %%i>>config203982temp.conf
powershell -c "$str=\"!str!\";$str = $str.replace('Wireless LAN adapter','');write-host interface:${str}:">>config203982temp.conf
del config203982.conf
rename config203982temp.conf config203982.conf

GOTO NEXTeleven
:Ethernet

set /a counter=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Ethernet adapter" ^| findstr /r ":$"') DO set /a counter+=1 & echo !counter!..%%i
echo Enter VALID:::
for /l %%i in (1,1,%counter%) do echo|set /p=%string13% (%%i)
echo.&echo| set /p=">>>>>>>>>>>
set /p option=
set /a counter=0
set /a option=!option!
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Ethernet adapter"') DO set /a counter+=1 & if !counter!==!option! set str=%%i
set str=%str::=%
echo !str!
for /f "delims=" %%i in ('type config203982.conf ^| find /v "interface:"') do echo %%i>>config203982temp.conf
powershell -c "$str=\"!str!\";$str = $str.replace('Ethernet adapter','');write-host interface:${str}:">>config203982temp.conf
del config203982.conf
rename config203982temp.conf config203982.conf

:NEXTeleven

echo !str!

@echo off
timeout 1 >NUL
cls
echo.&echo.%string14% 

echo %string15%
echo.&PAUSE&Exit

:Auto
Endlocal
Setlocal enabledelayedexpansion

set /a counter=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Ethernet adapter" ^| findstr /r ":$"') DO set /a counter+=1 
set /a count=0
:loopone
set /a count+=1
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Ethernet adapter" ^| findstr /r ":$"') DO set /a strcount+=1 & set str=%%i& if !strcount!==!count! goto two
:two
for /f "delims=*" %%i in ('powershell -c "$str=\"!str!\";$str.replace(\"Ethernet adapter\",\"\")"') do ( set str=%%i& set str=!str::=!& echo %str20%....!str!. )
echo.
if !counter! LSS !count! goto there
choice /c 12 /d 1 /t 5 /m "%string17%"
if !errorlevel!==2 ( ((for /f "delims=" %%i in ('type config203982.conf ^| find /v "interface:"') do echo %%i>>config203982temp.conf)&echo.interface:!str!:>>config203982temp.conf&del config203982.conf& rename config203982temp.conf config203982.conf)&EXIT )
cls
if !counter! LEQ !count! ( Goto there ) else ( Goto loopone )
:there
set /a counter=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Wireless LAN adapter" ^| findstr /r ":$"') DO set /a counter+=1 
set /a count=0
:looptoo
set /a count+=1
set /a strcount=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Wireless LAN adapter" ^| findstr /r ":$"') DO set /a strcount+=1 & set str=%%i& if !strcount!==!count! goto two
:two
for /f "delims=*" %%i in ('powershell -c "$str=\"!str!\";$str.replace(\"Wireless LAN adapter \",\"\")"') do ( set str=%%i& set str=!str::=!& echo %str20%....!str!. )
echo.
if !counter! LSS !count! goto fere
choice /c 12 /d 1 /t 5 /m "%string17%"
if !errorlevel!==2 ( ((for /f "delims=" %%i in ('type config203982.conf ^| find /v "interface:"') do echo %%i>>config203982temp.conf)&echo.interface:!str!:>>config203982temp.conf&del config203982.conf& rename config203982temp.conf config203982.conf)&EXIT )
cls
if !counter! LEQ !count! ( Goto fere ) else ( Goto looptoo )
:fere
echo %string16%&pause&exit
:Autotwo

endlocal
setlocal enabledelayedexpansion

set /a counter=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Ethernet adapter" ^| findstr /r ":$"') DO set /a counter+=1 
set /a count=0
:looponetwo
set /a count+=1
set /a strcount=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Ethernet adapter" ^| findstr /r ":$"') DO set /a strcount+=1 & set str=%%i& if !strcount!==!count! goto twotwo
:twotwo
for /f "tokens=*" %%i in ('powershell -c "$str=\"!str!\";$str.replace(\"Ethernet adapter \",\"\")"') do ( set str=%%i& set str=!str::=!& echo !str! )
netsh interface show interface !str! | find "Connected"&&((for /f "delims=" %%i in ('type config203982.conf ^| find /v "interface:"') do echo %%i>>config203982temp.conf)&echo.interface:!str!:>>config203982temp.conf&del config203982.conf& rename config203982temp.conf config203982.conf)
if !counter! LEQ !count! ( Goto theretwo ) else ( Goto looponetwo )
:theretwo
set /a counter=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Wireless LAN adapter" ^| findstr /r ":$"') DO set /a counter+=1 
set /a count=0
:looptoothree

set /a count+=1
set /a strcount=0
for /f "delims=" %%i in ('ipconfig /all ^| find /i "Wireless LAN adapter" ^| findstr /r ":$"') DO set /a strcount+=1 & set str=%%i& if !strcount!==!count! goto twothree
:twothree
for /f "tokens=*" %%i in ('powershell -c "$str=\"!str!\";$str.replace(\"Wireless LAN adapter \",\"\")"') do ( set str=%%i& set str=!str::=!& echo !str!)& netsh interface show interface !str! |Find "Connected"&&((for /f "delims=" %%i in ('type config203982.conf ^| find /v "interface:"') do echo %%i>>config203982temp.conf)&echo.interface:!str!:>>config203982temp.conf&del config203982.conf& rename config203982temp.conf config203982.conf)
if !counter! LEQ !count! ( Goto ferethree ) else ( Goto looptoothree )
:ferethree

pause