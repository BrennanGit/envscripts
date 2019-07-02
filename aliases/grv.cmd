@echo off
REM git remote -v
call getme --exclude envscripts git 1 remote -v %*
