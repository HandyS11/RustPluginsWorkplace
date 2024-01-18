@echo off
setlocal enabledelayedexpansion

:: Create the 'modding' directory if it doesn't exist
if not exist "%~dp0..\modding" (
    md "%~dp0..\modding"
    if errorlevel 1 (
        echo Failed to create directory 'modding'
        exit /b 1
    )
)

:: Define the file containing extensions and URLs
set "extensionFile=%~dp0Extensions.txt"

:: Check if the extension file exists
if not exist "%extensionFile%" (
    echo Extension file not found: %extensionFile%
    exit /b 1
)

:: Loop over the extensions from the file
for /f "tokens=1,2" %%a in (%extensionFile%) do (
    :: Download the extension
    powershell -command "& { try { Invoke-WebRequest -Uri '%%b' -OutFile '%~dp0..\modding\%%a' } catch { exit 1 } }"
    if !errorlevel! neq 0 (
        echo Failed to download %%a
        exit /b 1
    ) else (
        echo Successfully downloaded %%a
    )
)

echo Extension_Updater completed successfully
exit /b 0
