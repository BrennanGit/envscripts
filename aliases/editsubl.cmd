@echo off
REM code
set _OLDEDITOR=%EDITOR%
set EDITOR=C:\Program Files\Sublime Text 3\subl.exe
edit %*
set EDITOR=%_OLDEDITOR%
set _OLDEDITOR=
