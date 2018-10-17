@echo off
REM Moves up directories until infr_scripts_pl is found
call getispl.cmd
pushd %ISPL%
call SetupEnv.bat
popd