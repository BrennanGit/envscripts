@echo off
setlocal enabledelayedexpansion
 
call %~dp0\..\set_dir_vars.cmd
 
if "%1"=="" (goto USAGE)
if "%1"=="--help" (goto USAGE)
if "%1"=="-h" (goto USAGE)
if "%2"=="" (goto PREREPO)
if "%1"=="sb" (goto SANDBOX)
if "%1"=="alias" (goto ALIAS)
 
:USAGE
echo Open up a folder in an editor (%editor%)
echo usage:
echo   edit REPO         - Find repo in the pwd or scratch, if not found clone into scratch
echo   edit sb SBNAME    - Find a sandbox in sb, if not found view.py get it
echo   edit alias SBNAME - Find an alias in aliases
echo   edit [-h^|--help]  - Show this help message
goto :eof

:PREREPO
    set BARE=0
    set DIR=%1
    if not x%DIR:https=%==x%DIR% (goto BARE)
    if not x%DIR:git@=%==x%DIR% (goto BARE)
    goto REPO

:BARE
    set BARE=1
    for /f "delims=" %%i in ("%DIR:.git=%") do set "REPONAME=%%~nxi"
    set REPO=%DIR%
    set DIR=%REPONAME%
    set REPONAME=

:REPO
    set "DIR=%DIR:@=" & set "REF=%"
    IF %DIR:~-1%==\ SET DIR=%DIR:~0,-1%
    echo - Searching for %DIR% in pwd...
    if exist "%DIR%" (goto EDIT)
    echo - Searching for %DIR% in home...
    pushd "%home%"
    if exist "%DIR%" (goto EDIT)
    popd
    echo - Searching for %DIR% in scratch...
    pushd "%scratch%"
    if not exist "%DIR%" (
        echo - Searching for %DIR% with git...
        if "%BARE%"=="0" (call gitclone %DIR%)
        if "%BARE%"=="1" (call gitclone %REPO%)
        if not !errorlevel!==0 (goto :eof)
    )
    if not "%REF%"=="" (
        cd %DIR%
        git checkout %REF%
        cd ..
    )
    goto EDIT
goto :eof
 
:SANDBOX
    if "%2"=="" (goto USAGE)
    set DIR=%2
    echo Searching for %DIR% in sb
    pushd "%sb%"
    if not exist "%DIR%" (
        view.py get -v %DIR% -b %DIR%
    )
    goto EDIT
goto :eof

:ALIAS
    if "%2"=="" (goto USAGE)
    set DIR=%2.cmd
    echo Searching for %DIR% in aliases
    pushd "%alias%"
    goto EDIT
goto :eof
 
:EDIT
echo - Found at %CD%\%DIR%
%EDITOR% "%DIR%"
popd
goto :eof
