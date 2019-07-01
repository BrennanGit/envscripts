@echo off
REM grip
set FILE=%1
getme --exclude cmd grip 1 --export %FILE%
%FILE:~0,-3%.html
