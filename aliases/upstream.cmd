@echo off
REM git remote add upstream git@github.com:xmos/$REPONAME
FOR /F "tokens=* USEBACKQ" %%F IN (`git remote get-url origin`) DO (SET url=%%F)
getme --exclude cmd git 1 remote add upstream %url:BrennanGit=xmos%
getme --exclude cmd git 1 fetch upstream
grv
