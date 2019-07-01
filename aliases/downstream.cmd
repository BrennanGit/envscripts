@echo off
REM git remote add upstream git@github.com:BrennanGit/$REPONAME
FOR /F "tokens=* USEBACKQ" %%F IN (`git remote get-url origin`) DO (SET url=%%F)
getme --exclude cmd git 1 remote add brennan %url:xmos=BrennanGit%
getme --exclude cmd git 1 fetch brennan
grv
