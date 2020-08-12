@echo off
REM Run a git pull on a folder
call %~dp0..\set_dir_vars.cmd

if exist "%1" (
    echo Found in pwd
    gpull "%1" || exit /B
)
if exist "%scratch%\%1" (
    echo Found in scratch
    gpull "%scratch%\%1" || exit /B
)
if exist "%HOME%\%1" (
    echo found in home
    gpull "%HOME%\%1" || exit /B
)
