@echo off
REM vagrant box update
getme --exclude envscripts vagrant 1 box update %*
