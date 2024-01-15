@echo off
setlocal enabledelayedexpansion

:: Create the 'modding' directory if it doesn't exist
if not exist %~dp0../modding (
    md %~dp0../modding
    if errorlevel 1 (
        echo Failed to create directory 'modding'
        exit /b 1
    )
)

:: Download the Oxide zip file
powershell -command "& { Invoke-WebRequest -Uri https://umod.org/games/rust/download -OutFile %~dp0../modding/Oxide.Rust.zip }"
if errorlevel 1 (
    echo Failed to download Oxide.Rust.zip
    exit /b 1
)

:: Extract the Oxide zip file
powershell -command "& { Expand-Archive -Force %~dp0../modding/Oxide.Rust.zip %~dp0../modding/Oxide.Rust }"
if errorlevel 1 (
    echo Failed to extract Oxide.Rust.zip
    exit /b 1
)

:: Delete the Oxide zip file
if exist %~dp0../modding/Oxide.Rust.zip (
    del %~dp0../modding/Oxide.Rust.zip
    if errorlevel 1 (
        echo Failed to delete Oxide.Rust.zip
        exit /b 1
    )
)

echo Script completed successfully
exit /b 0