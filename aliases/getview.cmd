@echo off
REM updates xgit and if failure, creates tmp xgit
REM Usage ___
REM getview swapps (creates swapps or swapps_TMP)
REM getview update swapps (update /swapps or updates .)
set XGIT_REPO=C:\Users\brennan\sb\xgit
set XGIT_TMP=0
set DO_UPDATE=0
set REPO=%1
pushd %XGIT_REPO%
git pull || mkdir xgit_tmp && cd xgit_tmp && git clone git://git/xgit/.git && set XGIT_REPO=%XGIT_REPO%\xgit_tmp\xgit&&set XGIT_TMP=1
popd
echo %XGIT_REPO%
if "%1"=="update" (
	set DO_UPDATE=1
	set REPO=%2
	"%XGIT_REPO%\scripts\view.py" update -v=%2 -b=%2 --strict || %XGIT_REPO%\scripts\view.py update --strict && set REPO=%cd%
) 
if %DO_UPDATE%==0 (
	%XGIT_REPO%\scripts\view.py get -v=%1 -b=%1 || %XGIT_REPO%\scripts\view.py get -v=%1 -b=%1_TMP && set REPO=%1_TMP
)
if %XGIT_TMP%==1 (rm -rf C:\Users\brennan\sb\xgit\xgit_tmp)
cd %REPO%