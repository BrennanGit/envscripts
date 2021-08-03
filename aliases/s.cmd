@echo off
REM ssh USER@[PREFIX]SERVER
set "DEFAULT_PREFIX=srv-bri-"
set "SH_PREFIX=sw-hw-"
set "TH_PREFIX=tools-hw-"
set "SB_PREFIX=sw-bld-"
set "TB_PREFIX=tools-bld-"

if "%1"=="--help" (goto USAGE)
if "%1"=="-h" (goto USAGE)
if "%1"=="" (goto USAGE)

set S_USER=%1
set S_PREFIX_ID=%2
set S_PREFIX=

REM NO PREFIX PASSED
if not "%S_PREFIX_ID:~0,1%"=="-" (
    set S_SERVER=%2
    goto DOTHING
)
REM SET PREFIX
set S_SERVER=%3
if "%S_PREFIX_ID%"=="-" ( set "S_PREFIX=%DEFAULT_PREFIX%" )
if "%S_PREFIX_ID%"=="-sh" ( set "S_PREFIX=%SH_PREFIX%" )
if "%S_PREFIX_ID%"=="-th" ( set "S_PREFIX=%TH_PREFIX%" )
if "%S_PREFIX_ID%"=="-sb" ( set "S_PREFIX=%SB_PREFIX%" )
if "%S_PREFIX_ID%"=="-tb" ( set "S_PREFIX=%TB_PREFIX%" )
REM CHECK PREFIX
if "%S_PREFIX%"=="" (
    echo Unrecognised PREFIX_ID
    goto USAGE
)
goto DOTHING

:DOTHING
rem echo ssh %S_USER%@%S_PREFIX%%S_SERVER%
call getme --exclude envscripts ssh 1 %S_USER%@%S_PREFIX%%S_SERVER%
goto END
 
:USAGE
echo ssh to SERVER as USER and optionally add a prefix
echo usage:
echo   s USER SERVER        - ssh to server as USER
echo   s USER - SERVER      - add the default prefix   (%DEFAULT_PREFIX%)
echo   s USER -sh SERVER    - add the sw hw prefix     (%SH_PREFIX%)
echo   s USER -th SERVER    - add the tools hw prefix  (%TH_PREFIX%)
echo   s USER -sb SERVER    - add the sw bld prefix    (%SB_PREFIX%)
echo   s USER -tb SERVER    - add the tools bld prefix (%TB_PREFIX%)
echo   xmos [-h^|--help]     - Show this help message
goto END

:END
set DEFAULT_PREFIX=
set SH_PREFIX=
set TH_PREFIX=
set SB_PREFIX=
set TB_PREFIX=
set S_USER=
set S_PREFIX_ID=
set S_PREFIX=
set S_SERVER=
