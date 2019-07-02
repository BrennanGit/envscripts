@echo off
REM vagrant box update
call getme --exclude envscripts vagrant 1 box update %*
