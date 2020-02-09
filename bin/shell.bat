@echo off


:home
cls
set /P id=<C:\Ushio\etc\id
set /P version=<C:\Ushio\etc\version
echo. 
echo. ID: %id%  Ver: %version%
echo. Welcome to Ushio Shell!! 
echo.
echo. Please select your action:
echo. 1. Clear Download 
echo. 2. Clear Cache
echo. 3. Restart Service
echo. 4. Update Service
echo. 5. Exit
echo. 
set /p a=Your select = 
if /i '%a%'=='1' goto :clear_download
if /i '%a%'=='2' goto :clear_cache
if /i '%a%'=='3' goto :restart_service
if /i '%a%'=='4' goto :update_service
if /i '%a%'=='5' exit
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

:update_service
cls
echo.
echo. Please wait to be updated..
echo.
wscript C:\Ushio\src\dist\update.vbs
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
start C:\Ushio\src\dist\check.vbs
echo.
echo. Service restarted successfully!!
echo.
pause
goto :home