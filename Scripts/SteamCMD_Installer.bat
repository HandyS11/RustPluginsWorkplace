@echo off
setlocal enabledelayedexpansion

:: Create the 'steamCMD' directory if it doesn't exist
if not exist %~dp0../steamCMD (
    md %~dp0../steamCMD
    if errorlevel 1 (
        echo Failed to create directory 'steamCMD'
        exit /b 1
    )
)

:: Download the steamcmd.zip file
powershell -Command "Invoke-WebRequest https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -OutFile %~dp0..\steamCMD\package.zip -UseBasicParsing"
if errorlevel 1 (
    echo Failed to download steamcmd.zip
    exit /b 1
)

:: Extract the steamcmd.zip file
powershell -command "Expand-Archive -Force %~dp0../steamCMD/package.zip %~dp0../steamCMD"
if errorlevel 1 (
    echo Failed to extract steamcmd.zip
    exit /b 1
)

:: Delete the steamcmd.zip file
if exist %~dp0..\steamCMD\package.zip (
    del %~dp0..\steamCMD\package.zip
    if errorlevel 1 (
        echo Failed to delete steamCMD\package.zip
        exit /b 1
    )
)

echo Script completed successfully
exit /b 0