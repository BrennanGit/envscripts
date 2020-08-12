@echo off
REM git fetch --all
call getme --exclude envscripts git 1 fetch --all %*
