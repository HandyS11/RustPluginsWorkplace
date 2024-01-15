@echo off
setlocal enabledelayedexpansion

:: Change directory to the parent of the script's directory
cd /d %~dp0..

:: Check if a parameter was provided
if "%~1"=="" (
    :: Ask the user to choose the version
    echo Please choose the version:
    echo 1. Stable
    echo 2. Staging
    echo 3. Prerelease
    set /p version=Enter your choice (1-3): 
) else (
    set version=%~1
)

:: Update the server based on the user's choice or the provided parameter
if "%version%"=="1" (
    "steamCMD\steamcmd.exe" +force_install_dir "..\rustserver" +login anonymous +app_update 258550 +quit
) else if "%version%"=="2" (
    "steamCMD\steamcmd.exe" +force_install_dir "..\rustserver" +login anonymous +app_update 258550 -beta staging +quit
) else if "%version%"=="3" (
    "steamCMD\steamcmd.exe" +force_install_dir "..\rustserver" +login anonymous +app_update 258550 -beta prerelease +quit
) else (
    echo Invalid choice. Please enter 1, 2, or 3.
    exit /b 1
)

echo Script completed successfully
exit /b 0