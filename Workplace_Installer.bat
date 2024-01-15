@echo off

:: Define variables for paths used multiple times
set CARBON_PATH="..\modding\Carbon.Windows.Release\*"
set OXIDE_PATH="..\modding\Oxide.Rust\*"
set RUSTSERVER_PATH="..\rustserver"
set CARBON_PLUGINS_PATH="..\Carbon.Plugins\*cs"
set OXIDE_PLUGINS_PATH="..\Oxide.Plugins\*cs"
set OXIDE_EXT_PATH="..\modding\Oxide.Ext.*.dll"

:: Call the updater script
call Workplace_Updater.bat

:: Check if the rustserver directory exists, if not create it
if not exist rustserver md rustserver

:: Installers
:: Installs the frameworks and extensions
>rustserver\Frameworks_Installers.bat (
	echo @echo off
	echo echo 
	echo echo 1 - Install Carbon
	echo echo 2 - Install Oxide
	echo set /p version=Enter your choice (1-3):
	echo if "%version%"=="1" (
	echo    xcopy %CARBON_PATH% "." /E /I /Y
	echo    xcopy %OXIDE_EXT_PATH% "carbon\extensions\" /Y
	echo ) else if "%version%"=="2" (
	echo    xcopy %OXIDE_PATH% "." /E /I /Y
	echo    xcopy %OXIDE_EXT_PATH% "RustDedicated_Data\Managed\" /Y
	echo ) else (
	echo	echo Invalid choice. Please enter 1 or 2.
	echo	exit /b 1
	echo )
)


>rustserver\Carbon_Plugin_Loader.bat (
	echo @echo off
	echo echo 
	echo echo 1 - Load on Carbon
	echo echo 2 - Load on Oxide
	echo set /p version=Enter your choice (1-2):
	echo if "%version%"=="1" (
	echo    xcopy %CARBON_PLUGINS_PATH% "carbon\plugins\" /Y
	echo    xcopy %OXIDE_PLUGINS_PATH% "carbon\plugins\" /Y
	echo ) else if "%version%"=="2" (
	echo    xcopy %CARBON_PLUGINS_PATH% "RustDedicated_Data\Managed\" /Y
	echo    xcopy %OXIDE_PLUGINS_PATH% "RustDedicated_Data\Managed\" /Y
	echo ) else (
	echo	echo Invalid choice. Please enter 1 or 2.
	echo	exit /b 1
	echo )
)

:: Rust
:: Check if the required files and directories exist before trying to copy them
if exist %RUSTSERVER_PATH% (
    >rustserver\Server_Launcher.bat (
        echo @echo off
        echo echo "====== Check For Updates ======"
        echo :start 
        echo "..\steamCMD\steamcmd.exe" +force_install_dir %RUSTSERVER_PATH% +login anonymous +app_update 258550 +quit
        echo echo "======== Launch Server ========"
        echo :start 
        echo RustDedicated.exe -batchmode ^^
        echo +server.level "Procedural Map" ^^
        echo +server.maxplayers 5 ^^
        echo +server.worldsize 1000 ^^
        echo +server.seed 123456789 ^^
        echo +server.hostname "Test Server"" ^^
        echo +server.description "Test Server description" ^^
        echo +server.queryport 27017 ^^
        echo +server.port 28015 ^^
        echo +rcon.port 28016 ^^
        echo +app.port 28082 ^^
        echo +rcon.password somePassword ^^
        echo +rcon.web 1 ^^
        echo goto start
    )
)