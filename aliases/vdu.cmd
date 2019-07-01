@echo off
REM vagrant destroy -f && vagrant up
getme --exclude envscripts vagrant 1 destroy -f && getme --exclude envscripts vagrant 1 up
