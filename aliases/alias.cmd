:: asdvjhbsdv

@echo off
SetLocal EnableDelayedExpansion

set "all=%*"
set name=%1
for /f "tokens=1,* delims= " %%a in ("!all!") do set cmd=%%b
if "%name%"=="--help" (goto USAGE)
if "%name%"=="-h" (goto USAGE)
if "%name%"=="--rm" (goto REMOVE)
if "%name%"=="" (goto SHOWALL)
if "%cmd%"=="" (goto SHOWONE)
goto NEW

:USAGE
echo usage:
echo   alias             - Print list of available aliases
echo   alias NAME        - Type the contents of an alias file
echo   alias NAME CMD    - Add a new alias, cmd can contain spaces
echo   alias --rm NAME   - Remove an alias
echo   alias [-h^|--help] - Show this help message
goto :eof

:SHOWALL
echo Available aliases:
for %%a in ("%~dp0*.cmd") do echo   - %%~na
goto :eof

:SHOWONE
if not exist "%~dp0%name%.cmd" (echo Can't find alias "%name%") else (
    type "%~dp0%name%.cmd")
goto :eof

:REMOVE
if "%cmd%"=="" (goto USAGE) else (
    echo Deleting "%~dp0%cmd%.cmd"
    del "%~dp0%cmd%.cmd")
goto :eof

:NEW
if exist "%~dp0%name%.cmd" (
    echo Alias "%name%" already exists, remove with "alias --rm %name%"
    goto :eof)
echo @echo off> "%~dp0%name%.cmd"
echo %cmd% %%*>> "%~dp0%name%.cmd"
echo Alias set:
echo %name%          %cmd%
goto :eof