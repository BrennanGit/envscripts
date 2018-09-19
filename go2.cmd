@echo off
set TARGETS=base
set addname=%2
set addpath=
REM capture paths with spaces
for /f "tokens=2,* delims= " %%a in ("%*") do set addpath=%%b
CALL :%1 2>NUL
CALL %~dp0\go2targets\%TARGETS%.cmd %1 2>NUL
EXIT /B

:add
REM DEFAULT: go2 add <name> <path>

:_addcheckname
REM go2 add
if "%addname%"=="" GOTO _addcwdname
REM go2 add .
if "%addname%"=="." GOTO _addcwdname
GOTO :_addcheckpath

:_addcheckpath
REM go2 add <name>
if "%addpath%"=="" GOTO _addcwdpath
REM go2 add <name> .
if "%addpath%"=="." GOTO _addcwdpath
GOTO :_write

:_addcwdname
for %%I in (.) do set addname=%%~nxI
GOTO _addcheckpath

:_addcwdpath
set addpath=%CD%
GOTO _write

:_write
echo :%addname%>>%~dp0\go2targets\%TARGETS%.bat
echo pushd "%addpath%">>%~dp0\go2targets\%TARGETS%.bat
GOTO _addend

:_addend
echo EXIT /B>>%~dp0\go2targets\%TARGETS%.bat
echo Added to targets: %addname% - %addpath%
EXIT /B