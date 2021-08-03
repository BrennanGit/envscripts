@echo off
REM update develop and create a feature branch
gco develop && gfa && gmud && gco -b feature/%1
