%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
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
xcopy /Y /Q /E . %ushio%\src>nul
xcopy /Y /Q /E %ushio%\src\boot %bin%>nul
xcopy /Y /Q /E %ushio%\src\boot %userprofile%\ubin>nul
xcopy /Y /Q /E %ushio%\src\etc %etc%>nul
if '%~dp0'=='%ushio_bck%\bin' goto :reg

:md_ushio_bck
if not exist %ushio_bck% md %ushio_bck%
xcopy /Y /Q /E . %ushio_bck%>nul
goto :reg

echo Set reg...
:reg
call %lib%\reg\startup.bat>nul
call %lib%\reg\right_key.bat>nul
call %lib%\reg\set_path.bat>nul
copy /y %src%\dist\check.vbs "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\ushioCK.vbs"

echo Start service..
start %src%\dist\startup.vbs