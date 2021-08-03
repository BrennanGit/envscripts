@echo off
REM git merge upstream/master
getme --exclude envscripts git 1 merge upstream/master %*
