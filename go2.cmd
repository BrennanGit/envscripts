@echo off
call %~dp0\set_dir_vars.cmd
set TARGETS=base

if "%1"=="--help" (goto usage)
if "%1"=="-h" (goto usage)
if "%1"=="" (goto list)

set addname=%2
set addpath=
REM capture paths with spaces
for /f "tokens=2,* delims= " %%a in ("%*") do set addpath=%%b
CALL :%1 2>NUL
CALL %~dp0\go2targets\%TARGETS%.cmd %1 2>NUL
if not %errorlevel%==0 goto common
GOTO :eof

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
echo :%addname%>>%~dp0\go2targets\%TARGETS%.cmd
echo pushd "%addpath%">>%~dp0\go2targets\%TARGETS%.cmd
GOTO _addend

:_addend
echo EXIT /B>>%~dp0\go2targets\%TARGETS%.cmd
echo Added to targets: %addname% - %addpath%
GOTO :eof

:common
if exist "%scratch%\%1" (
    echo Found in scratch
    pushd %scratch%\%1
)
if exist "%sb%\%1" (
    echo found in sb
    pushd %sb%\%1
)
if exist "%HOME%\%1" (
    echo found in home
    pushd %HOME%\%1
)
GOTO :eof

:list
cat %~dp0\go2targets\%TARGETS%.cmd | sed "s/EXIT \/B//g" | sed "s/pushd//g"
GOTO :eof

:usage
echo Create and use commandline favourites
echo if destination not found in target list will also search for folder name in:
echo  - %scratch%
echo  - %sb%
echo  - %HOME%
echo usage:
echo   go2               - Print list of available destinations
echo   go2 add           - Add the current directory under a name matching the dirname
echo   go2 add NAME      - Add the current directory under a specified name
echo   go2 add NAME PATH - Add the specified directory under a specified name
echo   go2 [-h^|--help] - Show this help message
GOTO :eof
 