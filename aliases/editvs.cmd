@echo off
REM code
set _OLDEDITOR=%EDITOR%
set EDITOR=C:\Program Files\Microsoft VS Code\bin\code
edit %*
set EDITOR=%_OLDEDITOR%
set _OLDEDITOR=
