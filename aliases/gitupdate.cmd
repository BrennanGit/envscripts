@echo off
REM Pull changes from upstream and push to origin

set branch=%1
for /F "tokens=* USEBACKQ" %%F IN (`git rev-parse --abbrev-ref HEAD`) do ( set this_branch=%%F )
if "%branch%"=="" ( set branch=%this_branch% )


REM Make sure were not on branch to be deleted
if not "%branch%"=="%this_branch%" (
    git checkout %branch%
)

git pull upstream %branch%
git push origin

git checkout %this_branch%
