@echo off
REM Moves up directories until a path is found and set SEARCHUP_$name env var to location
set MAX_DEPTH=4
if not "%SEARCHUPMAXDEPTH%"=="" (set MAX_DEPTH=%SEARCHUPMAXDEPTH%)
set cwd=%cd%
set TO_FIND=%1
set SUBFOLDER=%2
if "%TO_FIND%"=="" (
    echo Unable to search for a folder whose name I dont know
    exit /B
)
set SEARCHUP_VARNAME=SEARCHUP_%TO_FIND%
 
:LOOP
if %MAX_DEPTH%==0 echo %TO_FIND% not found && GOTO END
if exist "%TO_FIND%" GOTO FOUND
cd ..
set /A MAX_DEPTH=MAX_DEPTH-1
GOTO LOOP
 
:FOUND
set "%SEARCHUP_VARNAME%=%cd%\%TO_FIND%"
if "%SUBFOLDER%"=="" (
    set "%SEARCHUP_VARNAME%=%cd%\%TO_FIND%"
) else (
    set "%SEARCHUP_VARNAME%=%cd%\%TO_FIND%\%SUBFOLDER"
)


:END
cd %cwd%
set MAX_DEPTH=
set cwd=
set TO_FIND=
set SUBFOLDER=
set SEARCHUP_VARNAME=