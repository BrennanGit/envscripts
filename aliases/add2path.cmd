@echo off
set DIR=%CD%
if NOT "%1"=="" set DIR=%1
set PATH=%DIR%;%PATH% %*
