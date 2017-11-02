@echo off
REM Moves up directories until infr_scripts_pl is found
set MAX_DEPTH=4
set cwd=%cd%

:LOOP
if %MAX_DEPTH%==0 GOTO END
if exist "infr_scripts_pl\" GOTO FOUND
cd ..
set /A MAX_DEPTH=MAX_DEPTH-1
GOTO LOOP

:FOUND
set ISPL=%cd%\infr_scripts_pl\build

:END
cd %cwd%
set MAX_DEPTH=
set cwd=