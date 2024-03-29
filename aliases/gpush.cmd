@echo off
REM git push
call getme --exclude envscripts git 1 push %*
if %errorlevel%==0 (goto :eof)

echo Attempting to set upstream branch
FOR /F "tokens=* USEBACKQ" %%F IN (`git rev-parse --abbrev-ref HEAD`) DO (
    SET branch=%%F
)

set remote=%1
if "%remote%"=="" set remote=origin

git push --set-upstream %remote% %branch%
