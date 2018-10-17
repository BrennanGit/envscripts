@echo off
call start-ssh-agent.cmd
if %1==xgit (
	git clone git://git/xgit
	cd xgit
	if not "%2"=="" (
		git checkout %2
	)
	cd ..
	GOTO END
)
 
if %1==autobuild (
	git clone git://git/autobuild
	cd autobuild
	if not "%2"=="" (
		git checkout %2
	)
	GOTO END
)
 
set GITUSER=brennangit
set GITREPO=%1
if not "%2"=="" (
	set GITUSER=%1
	set GITREPO=%2
)
if not "%3"=="" (
	set GITBRANCH=%3
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
 
if not '%GITBRANCH%'=='' (
	git checkout %GITBRANCH%
)
 
:END
