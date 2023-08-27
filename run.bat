@ECHO OFF

SET tcexec="%PROGRAMFILES%\VeraCrypt\VeraCrypt.exe"

@REM CHANGE THIS
SET mountdrive=a
SET volumename=\Device\Harddisk1\Partition1

REM Mount volume
cd %volumefolder%
%tcexec% /q /v %volumename% /l %mountdrive%
echo %ERRORLEVEL%
if ERRORLEVEL 1 GOTO mountfail
if ERRORLEVEL 0 GOTO startprograms

:startprograms
REM ******************************
REM ** Start your programs here **
REM ******************************

taskkill /im explorer.exe /f
start explorer.exe

REM ********************************
REM ** END of Program Start block **
REM ********************************
