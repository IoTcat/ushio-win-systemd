%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

set ushio=C:\Ushio
set ushio_bck=C:\Windows\Ushio


:md_ushio
if '%~dp0'=='%ushio%' goto :md_ushio_bck
if not exist %ushio% md %ushio%
xcopy /Y /Q /E ..\. %ushio%
if '%~dp0'=='%ushio_bck%' goto :reg

:md_ushio_bck
if not exist %ushio_bck% md %ushio_bck%
xcopy /Y /Q /E ..\. %ushio_bck%
goto :reg




:reg
call %ushio%\src\reg.bat

