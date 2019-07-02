@echo off
REM git reset --hard
call getme --exclude envscripts git 1 reset --hard %*
