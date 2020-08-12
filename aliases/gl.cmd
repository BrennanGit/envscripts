@echo off
REM git log
call getme --exclude envscripts git 1 log %*
