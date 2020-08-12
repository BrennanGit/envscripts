@echo off
REM git branch -a
call getme --exclude envscripts git 1 branch -a %*
