reg add HKEY_CLASSES_ROOT\Directory\Background\shell\ushio /f /ve /t REG_SZ /d "Ushio Shell"
reg add HKEY_CLASSES_ROOT\Directory\Background\shell\ushio /f /v icon /t REG_SZ /d "%ushio%\src\media\img\head3r.ico"
reg add HKEY_CLASSES_ROOT\Directory\Background\shell\ushio\command /f /ve /t REG_SZ /d "%ushio%\src\bin\shell.bat"