@echo off
REM git checkout
call getme --exclude envscripts git 1 checkout %*
