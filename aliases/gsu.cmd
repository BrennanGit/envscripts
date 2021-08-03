@echo off
REM git submodule update
getme --exclude envscripts git 1 submodule update %*
