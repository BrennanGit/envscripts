@echo off
REM git reset --hard
getme --exclude envscripts git 1 reset --hard %*
