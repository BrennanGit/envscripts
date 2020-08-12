@echo off
REM git merge origin/develop
call getme --exclude envscripts git 1 merge origin/develop %*
