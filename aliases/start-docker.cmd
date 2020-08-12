@echo off
REM Run this command to configure your shell to use vbox docker machine:

docker-machine status default | find "Running" || docker-machine create -d virtualbox default
docker-machine active | find "default" || FOR /f "tokens=*" %%i IN ('docker-machine env default') DO %%i
