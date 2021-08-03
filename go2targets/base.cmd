@echo off
GOTO %1
:pf
pushd "c:\Program Files"
EXIT /B
:pfx86
pushd "c:\Program Files (x86)"
EXIT /B
