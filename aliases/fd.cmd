@echo off
SET VAR=
SET HERE=%~dp0
REM start /WAIT C:\msys64\usr\bin\bash.exe -c "fuzzyD.sh %* > %HERE%/fd_dir.txt ; exit"
C:\msys64\usr\bin\bash.exe -c "fuzzyD.sh %* > %HERE%/fd_dir.txt"


rem :WAITLOOP
rem tasklist /FI "IMAGENAME eq bash.exe" 2>NUL | find /I /N "C:\msys64\usr\bin\bash.exe">NUL
rem if "%ERRORLEVEL%"=="0" goto RUNNING
rem goto NOTRUNNING

rem :RUNNING
rem goto WAITLOOP

rem :NOTRUNNING

rem timeout 5


TYPE  %~dp0\fd_dir.txt
FOR /f "tokens=* USEBACKQ" %%x in (`TYPE  %~dp0\fd_dir.txt`) do SET "VAR=%%x"
DEL /Q %~dp0\fd_dir.txt
CD %VAR%
