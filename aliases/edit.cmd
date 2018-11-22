@echo off
setlocal enabledelayedexpansion
 
set scratch=C:\Users\brennan\OneDrive - Xmos\Documents\Scratch
set sb=C:\Users\brennan\sb
 
if "%1"=="" (goto USAGE)
if "%1"=="--help" (goto USAGE)
if "%1"=="-h" (goto USAGE)
if "%2"=="" (goto REPO)
if "%1"=="sb" (goto SANDBOX)
 
:USAGE
echo Open up a folder in an editor (%editor%)
echo usage:
echo   edit REPO        - Find repo in the pwd or scratch, if not found clone into scratch
echo   edit sb SBNAME   - Find a sandbox in sb, if not found view.py get it
echo   edit [-h^|--help] - Show this help message
goto :eof

:REPO
    set DIR=%1
    echo - Searching for %DIR% in pwd...
    if exist "%DIR%" (goto EDIT)
    echo - Searching for %DIR% in scratch...
    pushd "%scratch%"
    if not exist "%DIR%" (
        echo - Searching for %DIR% with git...
        call gitclone %DIR%
        if not !errorlevel!==0 (goto :eof)
        popd
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
 
:EDIT
echo - Found at %CD%\%DIR%
%EDITOR% "%DIR%"
goto :eof
