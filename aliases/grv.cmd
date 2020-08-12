@echo off
REM git remote -v
getme --exclude envscripts git 1 remote -v %*
