@echo off
REM VisualStudio compilation environment

set ver=%1
if "%ver%"=="" (set ver=17)
if "%ver%"=="14" goto vc14
if "%ver%"=="2014" goto vc14
if "%ver%"=="17" goto vc17
if "%ver%"=="2017" goto vc17

:vc14
echo - setup env for VS 2014
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64\vcvars64.bat" %*
goto :eof

:vc17
echo - setup env for VS 2017
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat" %*
goto :eof
