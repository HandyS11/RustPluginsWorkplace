@echo off
setlocal enabledelayedexpansion

:: Check if a parameter was provided
if not "%~1"=="" (
    set version=%~1
) else (
    :askUser
    :: Ask the user to choose the version
    echo Please choose the version:
    echo 1. Stable (default)
    echo 2. Staging
    echo 3. Prerelease
    set /p version=Enter your choice (1-3): 

    :: Validate the user's choice
    if %version% lss 1 if %version% gtr 3 (
        echo Invalid choice. Please enter 1, 2, or 3.
        goto askUser
    )
)

:: Update the server based on the user's choice
set betaFlag=
if "%version%"=="2" set betaFlag=-beta staging
if "%version%"=="3" set betaFlag=-beta prerelease

"%~dp0..\steamCMD\steamcmd.exe" +force_install_dir "..\rustserver" +login anonymous +app_update 258550 %betaFlag% +quit

if errorlevel 1 (
    echo Failed to update Rust server.
    exit /b 1
)

echo Server_Updater completed successfully
exit /b 0
