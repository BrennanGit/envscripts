@echo off
set /P prog_name=Please enter the program name: 
set /P prog_path=Please enter the program path (and command without terminating folder ref): 
set /P prog_ext=Please enter the file extension (* for all files): 
call :unquote prog_name %prog_name%
call :unquote prog_path %prog_path%
call :unquote prog_ext %prog_ext%
echo Setting context menu items for %prog_name% at %prog_path%
echo Adding keys at:
echo HKEY_CLASSES_ROOT\%prog_ext%\shell\%prog_name%

set /P c=Are you sure you want to continue[y/n]? 
if /I "%c%" EQU "n" (echo Aborted && exit /B)

rem add it for all file types
@reg add "HKEY_CLASSES_ROOT\%prog_ext%\shell\%prog_name%"         /t REG_SZ /v "" /d "Open with %prog_name%"   /f
@reg add "HKEY_CLASSES_ROOT\%prog_ext%\shell\%prog_name%"         /t REG_EXPAND_SZ /v "Icon" /d "%prog_path%,0" /f
@reg add "HKEY_CLASSES_ROOT\%prog_ext%\shell\%prog_name%\command" /t REG_SZ /v "" /d "%prog_path% \"%%1\"" /f
 goto :EOF

:unquote
  set %1=%~2
  goto :EOF
