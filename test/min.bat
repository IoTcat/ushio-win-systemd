@if "%~1"=="y" goto begin
start /min cmd /c "%~f0" y&exit
:begin
@echo off
pause