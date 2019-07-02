@echo off
REM Moves up directories until infr_scripts_pl is found
call searchup.cmd infr_scripts_pl Build
pushd %SEARCHUP_infr_scripts_pl%
call SetupEnv.bat
popd