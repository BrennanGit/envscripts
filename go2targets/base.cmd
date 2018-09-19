@echo off
GOTO %1
:ispl
call getispl.bat
pushd "%ISPL%"
EXIT /B
:docker
pushd "C:\Users\brennan\sb\docker\xmos_docker"
EXIT /B
:home
pushd "C:\Users\brennan"
EXIT /B
:devops
pushd "C:\Users\brennan\DevOps"
EXIT /B
:venvs
pushd "C:\Users\brennan\DevOps\virtualenvs"
EXIT /B
:scratch
pushd "C:\Users\brennan\OneDrive - Xmos\Documents\Scratch"
EXIT /B
:sb
pushd "C:\Users\brennan\sb"
EXIT /B
:envscripts
pushd "C:\Users\brennan\envscripts"
EXIT /B
:docs
pushd "C:\Users\brennan\OneDrive - Xmos\Documents"
EXIT /B
:pf
pushd "c:\Program Files"
EXIT /B
:pfx86
pushd "c:\Program Files (x86)"
EXIT /B
:jirabugs
pushd "C:\Users\brennan\OneDrive - Xmos\Documents\Scratch\jirabugs"
EXIT /B
:downloads
pushd "C:\Users\brennan\Downloads"
EXIT /B
:ssh
pushd "C:\Users\brennan\.ssh"
EXIT /B
:desktop
pushd "C:\Users\brennan\Desktop"
EXIT /B
:utilities
pushd "C:\Users\brennan\Desktop\Utilities"
EXIT /B
:vagrant
pushd "C:\Users\brennan\DevOps\vagrant\xmos_vagrant"
EXIT /B
:centos-vagrant
pushd "C:\Users\brennan\DevOps\vagrant\xmos_vagrant\builders\tools\Linux\centos6.9\64"
EXIT /B
:xgit
pushd "C:\Users\brennan\sb\xgit"
EXIT /B
:centos-vm-pkgs
pushd "C:\Users\brennan\DevOps\vagrant\xmos_vagrant\builders\packages\rpm\centos"
EXIT /B
:rpm-builder
pushd "C:\Users\brennan\DevOps\vagrant\xmos_vagrant\builders\packages\rpm"
EXIT /B
:packages
pushd "C:\Users\brennan\DevOps\packaging"
EXIT /B
:rust
pushd "C:\Users\brennan\OneDrive - Xmos\Documents\Scratch\rust"
EXIT /B
:xpm
pushd "C:\Users\brennan\.xpm"
EXIT /B
