@echo off
REM grep --color
call getme --exclude envscripts grep 1 --color %*
