@echo off
REM vagrant destroy -f
getme --exclude cmd vagrant 1 destroy -f %*
