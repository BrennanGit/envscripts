@echo off
REM pipenv run
call getme --exclude envscripts pipenv 1 run %*
