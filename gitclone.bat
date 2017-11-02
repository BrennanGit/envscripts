@echo off
call start-ssh-agent.cmd
if %1==xgit (
	git clone git://git/xgit/.git
	GOTO END
)

if %1==autobuild (
	git clone git://git/autobuild/.git
	cd autobuild
	GOTO END
)

if %1==swdb (
	git clone git://git/swdb/.git
	cd swdb
	GOTO END
)

set GITUSER=brennangit
set GITREPO=%1
if not "%2"=="" (
	set GITUSER=%1
	set GITREPO=%2
)

git clone git@github.com:%GITUSER%/%GITREPO%
if %errorlevel%==0 (
	cd %GITREPO%
	git remote add upstream git@github.com:xmos/%GITREPO%
) 

if %errorlevel%==128 (
	git clone git@github.com:xmos/%GITREPO%
	cd %GITREPO%
)
echo(
echo(
git remote -v

:END
