@echo off
REM gco feature/
call getme --exclude envscripts git 1 checkout feature/%*
