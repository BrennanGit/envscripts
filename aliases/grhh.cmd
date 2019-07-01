@echo off
REM git reset --hard HEAD
getme --exclude envscripts git 1 reset --hard HEAD %*
