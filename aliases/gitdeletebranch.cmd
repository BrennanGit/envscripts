@echo off
REM Delete a local and remote branch

setlocal enableDelayedExpansion

set protected=master develop

REM Collect info
set branch=%1
for /F "tokens=* USEBACKQ" %%F IN (`git rev-parse --abbrev-ref HEAD`) do ( set this_branch=%%F )
set remotes=
for /F "tokens=* USEBACKQ" %%F IN (`git remote`) do ( set remotes=%%F,!remotes! )
if "%branch%"=="" ( set branch=%this_branch% )

REM Strip whitespace
set branch=%branch: =%
set this_branch=%this_branch: =%

REM protected branches
for %%s in (%protected%) do (
    if "%branch%"=="%%s" (
        echo Don't delete %%s, it's protected
        goto :eof
    )
)

REM Make sure were not on branch to be deleted
if "%branch%"=="%this_branch%" (
    echo - Checking out master
    git checkout master && echo  - Success
)

REM delete the local branch
echo - Removing local branch
git branch -D %branch% > NUL && echo  - Success

REM delete the remote branch where we have push access
for %%s in (%remotes%) do (
    echo - Removing remote branch from %%s
    git push --delete %%s %branch% 2> NUL && goto SUCCESS
    echo   - Failed to remove branch from %%s
)
goto :eof


:Success
echo   - Success