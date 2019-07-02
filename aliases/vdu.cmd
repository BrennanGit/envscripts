@echo off
REM vagrant destroy -f && vagrant up
call getme --exclude envscripts vagrant 1 destroy -f && getme --exclude envscripts vagrant 1 up
