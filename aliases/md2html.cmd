@echo off
REM grip
set FILE=%1
"C:\Python27\Scripts\grip.exe" --export %FILE%
%FILE:~0,-3%.html
