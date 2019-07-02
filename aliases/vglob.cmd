@echo off
REM vagrant global-status
call getme --exclude envscripts vagrant 1 global-status %*
