@echo off
REM vagrant destroy -f
call getme --exclude envscripts vagrant 1 destroy -f %*
