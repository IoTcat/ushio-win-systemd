@echo off
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f /v ushio /t REG_SZ /d "%ushio%\dist\startup.vbs"