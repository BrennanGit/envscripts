@echo off
REM git merge upstream/develop
call getme --exclude envscripts git 1 merge upstream/develop %*
