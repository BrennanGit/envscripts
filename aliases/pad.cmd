@echo off
REM Pad a string to a fixed width
SetLocal EnableDelayedExpansion

if "%1"=="--help" (goto USAGE)
if "%1"=="-h" (goto USAGE)
if "%1"=="-f" (
    set FILL=%2
    shift
    shift
) else (
    set "FILL= "
)
set WIDTH=%1
set SEP=%2
set "FILL=%FILL:"=%"
set "SEP=%SEP:"=%"
set "CONTENT=%3"
set "CONTENT=%CONTENT:"=+%"

if "%CONTENT:~0,1%"=="+" (
    set "CONTENT=%CONTENT:+=%"
    goto PAD
) else (
    set "CONTENT="
)

:CONTENTLOOP
if "%3"=="" GOTO CONTENTLOOPEND
set "CONTENT=%CONTENT%%3 "
shift
goto CONTENTLOOP
:CONTENTLOOPEND
set "CONTENT=%CONTENT:~0,-1%"
goto PAD

:USAGE
echo Print a string with fixed width padding
echo usage:
echo   pad WIDTH SEP CONTENT
echo   pad -f FILL WIDTH SEP CONTENT
echo.
echo WIDTH   - The column width
echo FILL    - The character to fill in the gap, defaults to space
echo SEP     - The seperator right aligned in the gap
echo CONTENT - The string (including spaces) to left align within the column
goto :eof

:PAD
for /l %%n in (1,1,60) do set FILLED=!FILLED!%FILL%
set "OUTPUT= %CONTENT%!FILLED!"
set "OUTPUT=!OUTPUT:~0,%WIDTH%!!SEP!"
echo.|set /p=%OUTPUT%