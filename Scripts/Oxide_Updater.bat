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

:: Download the Oxide zip file
powershell -command "& { try { Invoke-WebRequest -Uri 'https://github.com/OxideMod/Oxide.Rust/releases/latest/download/Oxide.Rust.zip' -OutFile '%~dp0..\modding\Oxide.Rust.zip' -ErrorAction Stop } catch { exit 1 } }"
if %errorlevel% neq 0 (
    echo Failed to download Oxide.Rust.zip
    exit /b 1
)

:: Extract the Oxide zip file
powershell -command "& { try { Expand-Archive -Force '%~dp0..\modding\Oxide.Rust.zip' -DestinationPath '%~dp0..\modding\Oxide.Rust' -ErrorAction Stop } catch { exit 1 } }"
if %errorlevel% neq 0 (
    echo Failed to extract Oxide.Rust.zip
    exit /b 1
)

:: Delete the Oxide zip file
if exist %~dp0..\modding\Oxide.Rust.zip (
    del %~dp0..\modding\Oxide.Rust.zip
    if errorlevel 1 (
        echo Failed to delete Oxide.Rust.zip
        exit /b 1
    )
)

echo Oxide_Updater completed successfully
exit /b 0
