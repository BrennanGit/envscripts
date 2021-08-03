@echo off
GOTO %1
:ispl
call getispl.cmd
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
pushd "C:\Users\brennan\xgit"
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
:aliases
pushd "C:\Users\brennan\envscripts\aliases"
EXIT /B
:releases
pushd "C:\Users\brennan\DevOps\RELEASES"
EXIT /B:regressions
pushd "C:\Users\brennan\DevOps\regressions"
EXIT /B
:junit
pushd "C:\Users\brennan\DevOps\regressions\junit"
EXIT /B
:regressions
pushd "C:\Users\brennan\DevOps\regressions"
EXIT /B
:esx_packer
pushd "C:\Users\brennan\DevOps\esx_packer"
EXIT /B
:brew
pushd "C:\Users\brennan\DevOps\packaging\homebrew"
EXIT /B
:ansible
pushd "C:\Users\brennan\DevOps\ansible"
EXIT /B
:clockify
pushd "X:\Brennan\clockicom"
EXIT /B
:dscratch
pushd "C:\Users\brennan\OneDrive - Xmos\Documents\Scratch\doublescratch"
EXIT /B
:gdrive
pushd "C:\Users\brennan\Google Drive"
EXIT /B
:space
pushd "C:\Users\brennan\Google Drive\scratch\spaCe"
EXIT /B
:share
pushd "X:\Brennan"
EXIT /B
:xroot
pushd "C:\Users\brennan\xmos-root"
EXIT /B
:migration
pushd "C:\Users\brennan\DevOps\migration"
EXIT /B
:xlfs
pushd "C:\Users\brennan\DevOps\XLFS"
EXIT /B
:sandboxes
pushd "C:\Users\brennan\sb"
EXIT /B
:xjsl
pushd "C:\Users\brennan\OneDrive - Xmos\Documents\Scratch\xmos_jenkins_shared_library"
EXIT /B
:ispys
pushd "C:\Users\brennan\OneDrive - Xmos\Documents\Scratch\infr_scripts_py"
EXIT /B
:certs
pushd "C:\Users\brennan\DevOps\certs"
EXIT /B
:prodtest
pushd "C:\Users\brennan\DevOps\production_testing"
EXIT /B
