@echo off
REM Print a list of all xmos repos found in xgit
cd C:\Users\brennan\sb\xgit\scripts
for %%f in (..\views\*.txt) do (
    type ..\views\%%~nf.txt | sed "s/#.*//" | awk "{ print $1 }" >> all_repos.txt
)
unique.py all_repos.txt
del all_repos.txt