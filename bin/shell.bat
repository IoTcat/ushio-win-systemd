@echo off


:home
cls
set /P id=<C:\Ushio\etc\id
echo. 
echo. ID: %id% 
echo. Welcome to Ushio Shell!!
echo.
echo. Please select your action:
echo. 1. Clear Download 
echo. 2. Clear Cache
echo. 3. Restart Service
echo. 4. Exit
echo. 
set /p a=Your select = 
if /i '%a%'=='1' goto :clear_download
if /i '%a%'=='2' goto :clear_cache
if /i '%a%'=='3' goto :restart_service
if /i '%a%'=='4' exit
echo. Unknown Input....
goto home

:clear_download
cls
echo.
echo. Please wait...
del /F /S /Q C:\Ushio\var\download>nul
echo.
echo. Download Cleared!!
pause
goto :home

:clear_cache
cls
echo.
echo. Please wait...
del /F /S /Q C:\Ushio\var\cache>nul
echo.
echo. Cache Cleared!!
pause
goto :home

:restart_service
cls
echo.
echo. Stop service...
taskkill /F /IM wscript.exe
echo.
echo. Start service..
start C:\Ushio\src\dist\startup.vbs
echo.
echo. Service restarted successfully!!
echo.
pause
goto :home