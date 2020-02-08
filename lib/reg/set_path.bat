set command=reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH
call %lib%\utilities\exec_command.bat
set res=%res:~29,800%

echo %res% | findstr /c:"%bin%">nul
if %errorlevel% equ 0 goto :end_path
set /a errorlevel=0
echo %PATH% | findstr /c:"%res:~0,15%">nul
if %errorlevel% equ 1 goto :end_path

set res=%res%;%bin%
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f /v Path /t REG_EXPAND_SZ /d "%res%"

:end_path