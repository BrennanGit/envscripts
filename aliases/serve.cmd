@echo off
REM python -m SimpleHTTPServer
echo Actual IP:
route PRINT 0.0.0.0 | findstr 0.0.0.0 | awk '{print $4};'
getme --exclude envscripts python 1 -m SimpleHTTPServer %*
