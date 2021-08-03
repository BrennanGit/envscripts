@echo off
REM ssh xmos@[PREFIX]SERVER
set SELF=xmos

if "%1"=="--help" (goto USAGE)
if "%1"=="-h" (goto USAGE)
if "%1"=="" (goto USAGE)

s %SELF% %*
goto END
 
:USAGE
echo ssh as user %SELF% and optionally add a prefix (check "s -h")
echo usage:
echo   %SELF% SERVER                - ssh to server as %SELF%
echo   %SELF% [PREFIX_ID] SERVER    - add a prefix from the s alias
echo   %SELF% [-h^|--help]           - Show this help message
goto END

:END
set SELF=
