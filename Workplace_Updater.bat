@echo off
setlocal enabledelayedexpansion

:: Check and execute Carbon_Updater.bat
call Scripts\Carbon_Updater.bat

:: Check and execute Oxide_Updater.bat
call Scripts\Oxide_Updater.bat

:: Check and execute Extension_Updater.bat
call Scripts\Extension_Updater.bat

:: Check if steamcmd.exe exists, if not, run SteamCMD_Installer.bat
if not exist "%~dp0steamCMD\steamcmd.exe" (
    call Scripts\SteamCMD_Installer.bat
)

:: Check and execute Server_Updater.bat with parameter 1
call Scripts\Server_Updater.bat 1

echo Workplace_Updater completed successfully
exit /b 0
