@echo off
REM Run a command in a subdirectory, creating if it does not exist
SetLocal EnableDelayedExpansion
 
set "all=%*"
for /f "tokens=1,* delims= " %%a in ("!all!") do set cmd=%%b

if not exist "%1" mkdir %1

pushd %1
echo %CMD%
%cmd%
popd
