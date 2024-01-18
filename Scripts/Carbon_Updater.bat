@echo off
setlocal enabledelayedexpansion

:: Create the 'modding' directory if it doesn't exist
if not exist %~dp0..\modding (
    md %~dp0..\modding
    if errorlevel 1 (
        echo Failed to create directory 'modding'
        exit /b 1
    )
)

:: Download the zip file
powershell -command "& { Invoke-WebRequest -Uri https://github.com/CarbonCommunity/Carbon/releases/download/production_build/Carbon.Windows.Release.zip -OutFile %~dp0..\modding\Carbon.Windows.Release.zip }" -ErrorAction Stop
if %errorlevel% neq 0 (
    echo Failed to download Carbon.Windows.Release.zip
    exit /b 1
)

:: Extract the zip file
powershell -command "& { Expand-Archive -Force %~dp0..\modding\Carbon.Windows.Release.zip %~dp0..\modding\Carbon.Windows.Release }" -ErrorAction Stop
if %errorlevel% neq 0 (
    echo Failed to extract Carbon.Windows.Release.zip
    exit /b 1
)

:: Delete the zip file
if exist %~dp0..\modding\Carbon.Windows.Release.zip (
    del %~dp0..\modding\Carbon.Windows.Release.zip
    if errorlevel 1 (
        echo Failed to delete Carbon.Windows.Release.zip
        exit /b 1
    )
)

echo Carbon_Updater completed successfully
exit /b 0
