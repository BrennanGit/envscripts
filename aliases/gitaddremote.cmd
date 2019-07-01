@echo off
REM Change origin to my fork and upstream to origin

setlocal enableDelayedExpansion

set remotes=
for /F "tokens=* USEBACKQ" %%F IN (`git remote`) do (set remotes=%%F,!remotes!)

if x%remotes:upstream=%==x%remotes% (
    rem git remote rename origin upstream
    for /f "tokens=*" %%i in ('git ls-remote --get-url ^') do (set US_URL=%%i)
    rem for /F "tokens=* USEBACKQ" %%F IN (`git remote get-url origin`) do ( 
    rem     set TMP_URL=%%F
    rem     set US_URL=%TMP_URL%
    rem     echo F: %%F
    rem     echo tmp: %TMP_URL%
    rem     echo us: %US_URL%
    rem )

    echo %US_URL%
)
