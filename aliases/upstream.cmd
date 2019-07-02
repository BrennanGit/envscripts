@echo off
REM git remote add upstream git@github.com:xmos/$REPONAME
FOR /F "tokens=* USEBACKQ" %%F IN (`git remote get-url origin`) DO (SET url=%%F)
call getme --exclude envscripts git 1 remote add upstream %url:BrennanGit=xmos%
call getme --exclude envscripts git 1 fetch upstream
grv
