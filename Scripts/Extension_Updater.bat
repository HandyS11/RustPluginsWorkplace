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

:: Define a list of extensions and their download URLs
set "extensions=Oxide.Ext.Chaos.dll=https://chaoscode.io/oxide/Oxide.Ext.Chaos.dll Oxide.Ext.Discord.dll=https://umod.org/extensions/discord/download Oxide.Ext.RustEdit.dll=https://github.com/k1lly0u/Oxide.Ext.RustEdit/raw/master/Oxide.Ext.RustEdit.dll"

:: Loop over the extensions
for %%i in (%extensions%) do (
    for /f "tokens=1,2 delims==" %%a in ("%%i") do (
        :: Download the extension
        powershell -command "& { Invoke-WebRequest -Uri '%%b' -OutFile '%~dp0../modding/%%a' }"
        if errorlevel 1 (
            echo Failed to download %%a
            exit /b 1
        )
    )
)

echo Script completed successfully
exit /b 0