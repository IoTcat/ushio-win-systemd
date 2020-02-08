@echo off

set ushio=C:\Ushio
set src=%ushio%\src
if not exist %ushio% md %ushio%
if not exist %src% md %src%

xcopy /Y /Q /E . %src%

cls
echo.
echo. Ushio is installing!!
echo.
echo.             IoTcat(http://iotcat.me)
echo.
echo.

call %src%\bin\fix.bat

pause