@echo off
REM Manage command line shortcuts in Windows
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
if "%cmd%"=="" (goto SHOWONE)
if "%cmd:~0,2%"=="-d" (
    set cmd=%cmd:~3%
    set DESCRIPTION=1
)
goto NEW
 
:USAGE
echo Create/Remove/Edit cmd files to act as aliases
echo usage:
echo   alias             - Print list of available aliases
echo   alias NAME        - Type the contents of an alias file
echo   alias NAME CMD    - Add a new alias, cmd can contain spaces
echo   alias NAME -d CMD - Add a new alias, will prompt for description
echo   alias --rm NAME   - Remove an alias
echo   alias --edit NAME - Open an alias for editing
echo   alias [-h^|--help] - Show this help message
goto :eof
 
:SHOWALL
echo alias -h to show usage
echo Available aliases:
where pad > NUL
if not ERRORLEVEL 1 (
    set PADAVAIL=1
) else (
    set PADAVAIL=0
)
for %%a in ("%~dp0*.cmd") do (
    set NAME=%%~na
    set "LINE="
    for /F "skip=1 delims=" %%l in (%%a) do if not defined LINE set "LINE=%%l"
    if "%PADAVAIL%"=="1" (
        call pad -f "-" 25 ": " "* !NAME! "
        if "!LINE:~0,3!"=="REM" (
            echo !LINE:~4!
        ) else (
            echo.
        )
    ) else (
        if "!LINE:~0,3!"=="REM" (
            echo * !NAME! : !LINE:REM=!
        ) else (
            echo * !NAME!
        )
    )
)
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
    set exe=%%a
)
 
:WRITE
echo @echo off> "%~dp0%name%.cmd"
if "%DESCRIPTION%"=="1" (
    set /p desc="Enter description: "
    echo REM !desc!>> "%~dp0%name%.cmd"
) else (
    echo REM %cmd%>> "%~dp0%name%.cmd"
)
echo getme --exclude envscripts %exe% 1 %args% %%*>> "%~dp0%name%.cmd"
echo Alias set:
echo %name%          %exe% %args%
goto :eof
 