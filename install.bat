@echo off

set ushio=C:\Ushio
if not exist %ushio% md %ushio%

xcopy /Y /Q /E . %ushio%

call %ushio%\dist\install.bat

cls
echo.
echo. Ushio install finished!!
echo.
echo.             IoTcat(http://iotcat.me)
echo.
echo.
pause