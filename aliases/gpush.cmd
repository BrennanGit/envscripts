@echo off
REM git push
"C:\Program Files (x86)\Git\cmd\git.exe" push %*
if %errorlevel%==0 (goto :eof)

echo Attempting to set upstream branch
FOR /F "tokens=* USEBACKQ" %%F IN (`git rev-parse --abbrev-ref HEAD`) DO (
    SET branch=%%F
)

set remote=%1
if "%remote%"=="" set remote=origin

gpush --set-upstream %remote% %branch%
