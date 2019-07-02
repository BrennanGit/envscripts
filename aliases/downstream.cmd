@echo off
REM git remote add upstream git@github.com:BrennanGit/$REPONAME
FOR /F "tokens=* USEBACKQ" %%F IN (`git remote get-url origin`) DO (SET url=%%F)
call getme --exclude envscripts git 1 remote add brennan %url:xmos=BrennanGit%
call getme --exclude envscripts git 1 fetch brennan
grv
