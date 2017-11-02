@echo off
REM Moves up directories until infr_scripts_pl is found
call getispl.bat
pushd %ISPL%
call SetupEnv.bat
popd