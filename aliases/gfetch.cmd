@echo off
REM Run a git pull on a folder
set "PULLREPO=%1"
if exist %PULLREPO%\.git (
    pushd %PULLREPO%
    git fetch --all -v
    popd
    exit /B
) else (
    echo Not a git repo
)
