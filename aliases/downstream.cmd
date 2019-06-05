@echo off
REM git remote add upstream git@github.com:BrennanGit/$REPONAME
FOR /F "tokens=* USEBACKQ" %%F IN (`git remote get-url origin`) DO (SET url=%%F)
"C:\Program Files (x86)\Git\cmd\git.exe" remote add brennan %url:xmos=BrennanGit%
"C:\Program Files (x86)\Git\cmd\git.exe" fetch brennan
grv
