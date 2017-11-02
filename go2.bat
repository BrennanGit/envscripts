@echo off
set addname=%2
set addpath=%3

CALL :%1 2>NUL
call %~dp0\go2targets.bat %1 2>NUL
EXIT /B

:add
echo :%addname%>>%~dp0\go2targets.bat
if "%addpath%"=="." GOTO _addcwd
if "%addpath%"=="" GOTO _addcwd
echo pushd "%addpath%">>%~dp0\go2targets.bat
GOTO _addend

:_addcwd
echo pushd "%CD%">>%~dp0\go2targets.bat
GOTO _addend

:_addend
echo EXIT /B>>%~dp0\go2targets.bat
echo Added to targets: %addname% - %addpath%
EXIT /B