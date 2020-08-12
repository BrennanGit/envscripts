@echo off
rem REM Remove url from known hosts file

call %~dp0\..\set_dir_vars.cmd
set kh_file=%HOME%\.ssh\known_hosts

if "%1"=="" (goto USAGE)

type %kh_file% | findstr %1
SET /P AREYOUSURE=Remove these lines (Y/[N])? 
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
type %kh_file% | findstr -v %1 > %kh_file%.tmp
del %kh_file%
mv %kh_file%.tmp %kh_file%
goto END

:USAGE
echo Remove a line from the known hosts file
echo usage:
echo   rmkh [URL^|IP]         - Remove lines containing string from known hosts file
goto END

:END
set kh_file=
set AREYOUSURE=