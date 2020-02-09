%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0" && cd ..

echo Set ENV...
set ushio=C:\Ushio
set ushio_bck=C:\Windows\Ushio
set src=%ushio%\src
set var=%ushio%\var
set etc=%ushio%\etc
set bin=%ushio%\bin
set opt=%ushio%\opt
set log=%var%\log
set cache=%var%\cache
set lib=%src%\lib

echo Remove reg...
call %lib%\reg\startup_del.bat>nul
call %lib%\reg\right_key_del.bat>nul

echo Stop service..
taskkill /F /IM wscript.exe
taskkill /F /IM wscript.exe

echo Remove files...
del /F /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\ushioCK.vbs">nul
rd /S /Q %ushio_bck% %src%>nul