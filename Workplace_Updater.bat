@echo off
setlocal enabledelayedexpansion

:: Call the Carbon_Updater.bat script
call %~dp0Scripts/Carbon_Updater.bat
if errorlevel 1 (
    echo Failed to run Carbon_Updater.bat
    exit /b 1
)

:: Call the Oxide_Updater.bat script
call %~dp0Scripts/Oxide_Updater.bat
if errorlevel 1 (
    echo Failed to run Oxide_Updater.bat
    exit /b 1
)

:: Call the Extension_Updater.bat script
call %~dp0Scripts/Extension_Updater.bat
if errorlevel 1 (
    echo Failed to run Extension_Updater.bat
    exit /b 1
)

:: Check if steamcmd.exe exists, if not, run the SteamCMD_Installer.bat script
if not exist %~dp0steamCMD/steamcmd.exe (
    call %~dp0Scripts/SteamCMD_Installer.bat
    if errorlevel 1 (
        echo Failed to run SteamCMD_Installer.bat
        exit /b 1
    )
)

:: Call the Server_Updater.bat script
call %~dp0Scripts/Server_Updater.bat
if errorlevel 1 (
    echo Failed to run Server_Updater.bat
    exit /b 1
)

echo Script completed successfully
exit /b 0