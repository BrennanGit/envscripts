;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
ls=ls --show-control-chars -F --color $*
pwd=cd
clear=cls
history=cat "%CMDER_ROOT%\config\.history"
unalias=alias /d $1
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"
execmaster=docker exec -it buildbot_master_apps $*
execworker=docker exec -it buildbot_worker_apps $*
rlbb=pushd C:\Users\brennan\DevOps\Testing\xmos_docker $T docker ps -q|xargs docker rm -f $T make animo_buildbot_master_apps $T sleep 5 $T make animo_apps_buildbot_workers $T docker ps $T popd
s.v=="%CMDER_ROOT%\vendor\Sublime Text 3\sublime_text.exe" $1 -new_console:s75V
s.h=="%CMDER_ROOT%\vendor\Sublime Text 3\sublime_text.exe" $1 -new_console:s50H
s.f=="%CMDER_ROOT%\vendor\Sublime Text 3\sublime_text.exe" $1 -new_console
checkout=git checkout  
