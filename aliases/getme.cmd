@echo off
REM Select an executable to run when multiple exist on the path
setlocal enableextensions enabledelayedexpansion

if "%1"=="" goto USAGE
if "%2"=="" goto LOOP

for /f "tokens=2,* delims= " %%a in ("%*") do set ARGS=%%b

:LOOP
set /a count = 1
for /f "tokens=* delims= " %%a in ('where %1') do (
    if "%2"=="" (
        echo !count!: %%a
    ) else (
        if "!count!"=="%2" (
            set CMD=%%a
            goto RUN
        )
    )
    set /a count += 1
)
goto :EOF

:RUN
"%CMD%" %ARGS%
goto :EOF

:USAGE
echo usage:
echo   getme CMD            - Print all available binaries with numbers
echo   getme CMD NUM [ARGS] - Select binary and run with ARGS
goto :eof
