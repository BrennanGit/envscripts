@echo off
SetLocal EnableDelayedExpansion
 
set "all=%*"
set name=%1
for /f "tokens=1,* delims= " %%a in ("!all!") do set cmd=%%b
if "%name%"=="--help" (goto USAGE)
if "%name%"=="-h" (goto USAGE)
if "%name%"=="--rm" (goto REMOVE)
if "%name%"=="--edit" (goto EDIT)
if "%name%"=="" (goto SHOWALL)
if "%cmd%"=="" (goto SHOWONE)
goto NEW
 
:USAGE
echo Create/Remove/Edit cmd files to act as aliases
echo usage:
echo   alias             - Print list of available aliases
echo   alias NAME        - Type the contents of an alias file
echo   alias NAME CMD    - Add a new alias, cmd can contain spaces
echo   alias --rm NAME   - Remove an alias
echo   alias --edit NAME - Open an alias for editing
echo   alias [-h^|--help] - Show this help message
goto :eof
 
:SHOWALL
echo Available aliases:
for %%a in ("%~dp0*.cmd") do echo   - %%~na
goto :eof
 
:SHOWONE
if not exist "%~dp0%name%.cmd" (echo Can't find alias "%name%") else (
    for /f "delims= tokens=* skip=1" %%i in (%~dp0%name%.cmd) do (
        echo  ^>  %%i
    )
)
goto :eof
 
:REMOVE
if "%cmd%"=="" (goto USAGE) else (
    echo Deleting "%~dp0%cmd%.cmd"
    del "%~dp0%cmd%.cmd"
)
goto :eof
 
:EDIT
if "%cmd%"=="" (goto USAGE) else (
    echo Opening "%~dp0%cmd%.cmd" for editing
    IF "%EDITOR%" == "" (
        notepad "%~dp0%cmd%.cmd"
    ) ELSE (
        %EDITOR% "%~dp0%cmd%.cmd"
    )
)
goto :eof
 
:NEW
if exist "%~dp0%name%.cmd" (
    echo Alias "%name%" already exists, remove with "alias --rm %name%"
    goto :eof
)
for /F "tokens=1,*" %%a IN ("%cmd%") do (
    set args=%%b
    for /F "tokens=* USEBACKQ" %%c IN (`where %%a`) do (
        set exe="%%c"
        goto WRITE
    )
    set exe=%%a
)
 
:WRITE
echo @echo off> "%~dp0%name%.cmd"
echo %exe% %args% %%*>> "%~dp0%name%.cmd"
echo Alias set:
echo %name%          %exe% %args%
goto :eof
 