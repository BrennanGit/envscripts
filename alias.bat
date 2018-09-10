@echo off
SetLocal EnableDelayedExpansion

set "all=%*"
REM set all=%all:"='%

REM PRINT ALL ALIASES
if "%all%"=="" (
    for %%a in (%~dp0*) do echo %%~na
    exit /b
)

REM COLLECT ARGS
set name=%1
for /f "tokens=1,* delims= " %%a in ("!all!") do set cmd=%%b

REM PRINT CONTENTS OF ALIAS
if "%cmd%"=="" (
    type %~dp0\%name%.bat
    exit /b
)

REM CREATE NEW ALIAS
echo @echo off> %~dp0\%name%.bat
echo %cmd% %%*>> %~dp0\%name%.bat
echo Alias set:
echo %name%          %cmd%