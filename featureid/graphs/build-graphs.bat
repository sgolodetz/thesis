@echo off

REM #############
REM Output graphs
REM #############

FOR %%f IN (*.gv) DO (
neato -Tpng:gdiplus %%f -o %%~nf.png
)