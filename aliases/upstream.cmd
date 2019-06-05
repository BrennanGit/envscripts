@echo off
REM git remote add upstream git@github.com:xmos/$REPONAME
FOR /F "tokens=* USEBACKQ" %%F IN (`git remote get-url origin`) DO (SET url=%%F)
"C:\Program Files (x86)\Git\cmd\git.exe" remote add upstream %url:BrennanGit=xmos%
"C:\Program Files (x86)\Git\cmd\git.exe" fetch upstream
grv
