@echo off
REM git reset --hard HEAD
call getme --exclude envscripts git 1 reset --hard HEAD %*
