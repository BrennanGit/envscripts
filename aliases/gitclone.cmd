@echo off
REM Attempt to clone from all the standard places
set GITUSER=BrennanGit
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
if not x%GITREPO:https=%==x%GITREPO% (goto BARE)
if not x%GITREPO:git@=%==x%GITREPO% (goto BARE)
goto CHECKS
 
:USAGE
echo Clone a git repo with priority (github fork ^> xmos github ^> gitweb)
echo usage:
echo   gitclone REPO         - Attempt to clone repo from each of the sources
echo   gitclone REPO REF     - Clone the repo and checkout REF
echo   gitclone -u USER REPO - Choose the github user to search for forks (default %GITUSER%)
echo   gitclone [-h^|--help]  - Show this help message
goto :eof

:BARE
echo - Cloning bare repo url ...
git clone %GITREPO% 2>NUL
for /f "delims=" %%i in ("%GITREPO:.git=%") do set "REPONAME=%%~nxi"
set GITREPO=%REPONAME%
if %errorlevel%==0 (goto CHECKOUT)
goto :eof
 
:CHECKS
if exist "%GITREPO%" (echo - "%GITREPO%" already exists in "%CD%" && goto :eof)

:FORK
echo - Trying fork (git@github.com:%GITUSER%/%GITREPO%) ...
git clone git@github.com:%GITUSER%/%GITREPO% 2>NUL
if %errorlevel%==0 (
	cd %GITREPO%
	git remote add upstream git@github.com:xmos/%GITREPO%
    git fetch upstream
	cd ..
)
if %errorlevel%==0 (goto CHECKOUT)
echo - Trying fork (git@srv-bri-github0.xmos.local:%GITENTUSER%/%GITREPO%) ...
git clone git@srv-bri-github0.xmos.local:%GITENTUSER%/%GITREPO% 2>NUL
if %errorlevel%==0 (
    cd %GITREPO%
    git remote add upstream git@srv-bri-github0.xmos.local:xmos/%GITREPO%
    git fetch upstream
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
set PIPENV_PIPFILE=C:\Users\brennan\envscripts\Pipfile
call get_all_repos | xargs pipenv run fuzzy_order.py -n 4 %GITREPO% | xargs -L 1 echo -- 
set PIPENV_PIPFILE=
exit /B 1