@echo off
REM vagrant destroy -f && vagrant up
getme --exclude cmd vagrant 1 destroy -f && getme --exclude cmd vagrant 1 up
