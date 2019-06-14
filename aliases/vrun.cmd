@echo off
REM Run a command in a vagrant box similarly to how pipenv run works
call searchup.cmd Vagrantfile

for /F "delims=" %%i in ("%SEARCHUP_Vagrantfile%") do set dirname="%%~dpi"
pushd %dirname%
REM vagrant up >NUL || rem
if "%*"=="" (
    vagrant ssh
) else (
    vagrant ssh -c "%*"
)
popd
