@echo off
REM Attempt to clone from all the standard places
set GITUSER=brennangit
set GITENTUSER=brennan
set GITBRANCH=
 
if "%1"=="--help" (goto USAGE)
if "%1"=="-h" (goto USAGE)
if "%1"=="-u" (
	set GITUSER=%2
	shift
	shift
)
if "%1"=="" (goto USAGE)
set GITREPO=%1
if not "%2"=="" (set GITBRANCH=%2)
goto CHECKS
 
:USAGE
echo Clone a git repo with priority (github fork ^> xmos github ^> gitweb)
echo usage:
echo   gitclone REPO         - Attempt to clone repo from each of the sources
echo   gitclone REPO REF     - Clone the repo and checkout REF
echo   gitclone -u USER REPO - Choose the github user to search for forks (default %GITUSER%)
echo   gitclone [-h^|--help]  - Show this help message
goto :eof
 
:CHECKS
if exist "%GITREPO%" (echo - "%GITREPO%" already exists in "%CD%" && goto :eof)
 
:FORK
echo - Trying fork (git@github.com:%GITUSER%/%GITREPO%) ...
git clone git@github.com:%GITUSER%/%GITREPO% 2>NUL
if %errorlevel%==0 (
	cd %GITREPO%
	git remote add upstream git@github.com:xmos/%GITREPO%
	cd ..
)
if %errorlevel%==0 (goto CHECKOUT)
echo - Trying fork (git@srv-bri-github0.xmos.local:%GITENTUSER%/%GITREPO%) ...
git clone git@srv-bri-github0.xmos.local:%GITENTUSER%/%GITREPO% 2>NUL
if %errorlevel%==0 (
    cd %GITREPO%
    git remote add upstream git@srv-bri-github0.xmos.local:xmos/%GITREPO%
    cd ..
)
if %errorlevel%==0 (goto CHECKOUT)
 
:XMOS
echo - Trying xmos (git@github.com:xmos/%GITREPO%) ...
git clone git@github.com:xmos/%GITREPO% 2>NUL
if %errorlevel%==0 (goto CHECKOUT)
echo - Trying xmos (git@srv-bri-github0.xmos.local:xmos/%GITREPO%) ...
git clone git@srv-bri-github0.xmos.local:xmos/%GITREPO% 2>NUL
if %errorlevel%==0 (goto CHECKOUT)
 
:GITWEB
echo - Trying gitweb (git://git/%GITREPO%) ...
git clone git://git/%GITREPO% 2>NUL
if not %errorlevel%==0 (goto FAIL)
  
:CHECKOUT
cd %GITREPO%
if not "%GITBRANCH%"=="" (
	echo - Checking out %GITBRANCH% ...
	git checkout %GITBRANCH% 2>NUL
)
 
:SHOW
git remote -v
cd ..
goto :eof
 
:FAIL
echo - Unable to find the repo ...
echo - Did you mean?
call get_all_repos | xargs fuzzy_order.py -n 3 %GITREPO% | xargs -L 1 echo -- 
exit /B 1