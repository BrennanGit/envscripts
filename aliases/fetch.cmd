@echo off
REM pull
if exist "%1" (
    echo Found in pwd
    gfetch "%1" || exit /B
)
if exist "%scratch%\%1" (
    echo Found in scratch
    gfetch "%scratch%\%1" || exit /B
)
if exist "%HOME%\%1" (
    echo found in home
    gfetch "%HOME%\%1" || exit /B
)
