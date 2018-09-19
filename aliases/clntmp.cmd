@echo off
if %1==xgit (
	set TO_REMOVE=C:\Users\brennan\sb\xgit\xgit_tmp
) else (
	set TO_REMOVE=C:\Users\brennan\sb\%1_TMP
)
echo Removing %TO_REMOVE%
rm -rf %TO_REMOVE%