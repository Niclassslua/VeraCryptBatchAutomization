@ECHO OFF

SET tcexec="%PROGRAMFILES%\VeraCrypt\VeraCrypt.exe"

REM CHANGE THIS
SET mountdrive=a
SET volumename=\Device\Harddisk1\Partition1

REM CONFIGURATION
REM Set this to true if the Desktop is on the encrypted volume, false otherwise.
SET desktop_on_encrypted_drive=true

REM Mount volume
cd %volumefolder%
%tcexec% /q /v %volumename% /l %mountdrive%
echo %ERRORLEVEL%
if ERRORLEVEL 1 GOTO mountfail
if ERRORLEVEL 0 GOTO checkdesktopflag

:checkdesktopflag
REM ******************************
REM ** Check if Desktop check is needed **
REM ******************************
if "%desktop_on_encrypted_drive%" == "true" GOTO checkpath
if "%desktop_on_encrypted_drive%" == "false" GOTO skipdesktopcheck

:checkpath
REM ******************************
REM ** Check if Desktop is ready **
REM ******************************

:checkdesktop
if exist %mountdrive%:\Desktop (
    echo Drive mounted and Desktop found. Restarting Explorer...
    GOTO startprograms
) else (
    echo Waiting for the drive and Desktop path...
    timeout /t 5 >nul
    GOTO checkdesktop
)

:skipdesktopcheck
REM ********************************
REM ** Skipping desktop check as configured **
REM ********************************
echo Skipping desktop check as per configuration. Proceeding to start programs...
GOTO startprograms

:startprograms
REM ********************************
REM ** Start your programs here   **
REM ********************************

taskkill /im explorer.exe /f
start explorer.exe

REM ********************************
REM ** END of Program Start block **
REM ********************************

exit

:mountfail
echo VeraCrypt failed to mount the drive. Please check your settings.
exit
