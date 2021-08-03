@echo off
REM Select an executable to run when multiple exist on the path
setlocal enableextensions enabledelayedexpansion

set "_args=%*"
set _find=None
set _num=None
set _exclude=None

if "%1"=="" goto USAGE
if "%1"=="-h" goto USAGE
if "%1"=="--help" goto USAGE
if "%1"=="--exclude" (
    set _exclude=%2
    set "_args=!_args:*%1 =!"
    set "_args=!_args:*%2 =!"
    set _find=%3
    if not "%4"=="" (
        set _num=%4
    )
) else (
    set _find=%1
    if not "%2"=="" (
        set _num=%2
    )
)

set "_args=%_args:"=""%"

if not "%2"=="" (
    for /f "tokens=2,* delims= " %%a in ("%_args%") do set ARGS=%%b
)

:LOOP
set /a count = 1
for /f "tokens=* delims= " %%a in ('where %_find%') do (
    set _found_on_path=%%a
    if "x!_found_on_path:%_exclude%=!"=="x!_found_on_path!" ( 
        if "%_num%"=="None" (
            echo !count!: !_found_on_path!
        ) else (
            if "!count!"=="%_num%" (
                set CMD=!_found_on_path!
                goto RUN
            )
        )
        set /a count += 1
    )
)
goto :EOF


:USAGE
echo usage:
echo   getme CMD            - Print all available binaries with numbers
echo   getme CMD NUM [ARGS] - Select binary and run with ARGS
goto :EOF


:RUN
"%CMD%" %ARGS:""="%
exit /b %ERRORLEVEL%
