@echo off
REM vagrant box update
getme --exclude cmd vagrant 1 box update %*
