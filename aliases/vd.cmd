@echo off
REM vagrant destroy -f
getme --exclude envscripts vagrant 1 destroy -f %*
