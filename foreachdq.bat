@echo off

set OGDIR=%CD%

if "%*"=="" ( echo Please enter a command to run && exit /B)

for /d %%d in (*) do (
cd %%d
%*
cd %OGDIR%
)

cd %OGDIR%
set OGDIR=
