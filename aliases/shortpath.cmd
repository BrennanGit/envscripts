@ECHO OFF
REM Print the short version of a Windows path
if '%1'=='' (%0 .) else echo %~s1
