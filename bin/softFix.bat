@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0" && cd ..

echo Set ENV
set ushio=C:\Ushio
set ushio_bck=C:\Windows\Ushio
set src=%ushio%\src
set var=%ushio%\var
set etc=%ushio%\etc
set bin=%ushio%\bin
set opt=%ushio%\opt
set log=%var%\log
set cache=%var%\cache
set download=%var%\download
set lib=%src%\lib

echo Build files...
:md_ushio
if '%~dp0'=='%src%\bin' goto :md_ushio_bck
if not exist %ushio% md %ushio%
if not exist %var% md %var%
if not exist %etc% md %etc%
if not exist %bin% md %bin%
if not exist %opt% md %opt%
if not exist %log% md %log%
if not exist %cache% md %cache%
if not exist %download% md %download%
if not exist %src% md %src%
if not exist %userprofile%\ubin md %userprofile%\ubin
xcopy /Y /Q /E . %ushio%\src>nul
xcopy /Y /Q /E %ushio%\src\boot %bin%>nul
xcopy /Y /Q /E %ushio%\src\boot %userprofile%\ubin>nul
xcopy /Y /Q /E %ushio%\src\etc %etc%>nul

rd /S /Q %temp%\ushio-win-systemd-master>nul