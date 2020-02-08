@echo off
for /F "delims=" %%i in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH') do ( set commitid=%%i)
rem echo %commitid%
set t=%commitid:~29,800%
echo %t%This is ENDD
pause