@echo off
REM git diff
call getme --exclude envscripts git 1 diff %*
