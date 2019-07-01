@echo off
REM grip
set FILE=%1
getme --exclude envscripts grip 1 --export %FILE%
%FILE:~0,-3%.html
