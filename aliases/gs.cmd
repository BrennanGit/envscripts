@echo off
REM git status
call getme --exclude envscripts git 1 status %*
