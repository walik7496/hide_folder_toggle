@echo off
title=Hide Folder Toggle
set "vf=folder name"
attrib "%vf%" | find "S" > nul
attrib "%vf%" | find "H" > nul
if %errorlevel%==0 (
attrib -S -H "%vf%"
echo Hide.
) else (
attrib +S +H "%vf%"
echo Show.
)