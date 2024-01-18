@echo off

:: Install everything
call Workplace_Updater.bat

:: Check if the rustserver directory exists, if not create it
if not exist "%RUSTSERVER_PATH%" md "%RUSTSERVER_PATH%"

:: Define variables for paths used multiple times
set "RUSTSERVER_PATH=rustserver"
set "CARBON_PATH=..\modding\Carbon.Windows.Release\*"
set "OXIDE_PATH=..\modding\Oxide.Rust\*"
set "CARBON_PLUGINS_PATH=..\Carbon.Plugins\*cs"
set "OXIDE_PLUGINS_PATH=..\Oxide.Plugins\*cs"
set "OXIDE_EXT_PATH=..\modding\Oxide.Ext.*.dll"

:: Specify the file names
set "frameworkFile=%RUSTSERVER_PATH%\Frameworks_Installer.bat"
set "pluginFile=%RUSTSERVER_PATH%\Plugin_Loader.bat"
set "serverFile=%RUSTSERVER_PATH%\Server_Launcher.bat"

:: Framework Installer
echo @echo off >> %frameworkFile%
echo echo ## MENU ## >> %frameworkFile%
echo echo 1 - Install Carbon >> %frameworkFile%
echo echo 2 - Install Oxide >> %frameworkFile%
echo set /p version=Enter your choice (1-3): >> %frameworkFile%
echo if "%%version%%"=="1" ( >> %frameworkFile%
echo    xcopy "%CARBON_PATH%" "." /E /I /Y >> %frameworkFile%
echo    xcopy "%OXIDE_EXT_PATH%" "carbon\extensions\" /Y >> %frameworkFile%
echo ) else if "%%version%%"=="2" ( >> %frameworkFile%
echo    xcopy "%OXIDE_PATH%" "." /E /I /Y >> %frameworkFile%
echo    xcopy "%OXIDE_EXT_PATH%" "RustDedicated_Data\Managed\" /Y >> %frameworkFile%
echo ) else ( >> %frameworkFile%
echo    echo Invalid choice. Please enter 1 or 2. >> %frameworkFile%
echo    exit /b 1 >> %frameworkFile%
echo ) >> %frameworkFile%

echo File created successfully: %frameworkFile%

:: Plugin Loader
echo @echo off >> %pluginFile%
echo echo ## MENU ## >> %pluginFile%
echo echo 1 - Load on Carbon >> %pluginFile%
echo echo 2 - Load on Oxide >> %pluginFile%
echo set /p version=Enter your choice (1-2): >> %pluginFile%
echo if "%version%"=="1" ( >> %pluginFile%
echo    xcopy "%CARBON_PLUGINS_PATH%" "carbon\plugins\" /Y >> %pluginFile%
echo    xcopy "%OXIDE_PLUGINS_PATH%" "carbon\plugins\" /Y >> %pluginFile%
echo ) else if "%version%"=="2" ( >> %pluginFile%
echo    xcopy "%CARBON_PLUGINS_PATH%" "RustDedicated_Data\Managed\" /Y >> %pluginFile%
echo    xcopy "%OXIDE_PLUGINS_PATH%" "RustDedicated_Data\Managed\" /Y >> %pluginFile%
echo ) else ( >> %pluginFile%
echo    echo Invalid choice. Please enter 1 or 2. >> %pluginFile%
echo    exit /b 1 >> %pluginFile%
echo ) >> %pluginFile%

echo File created successfully: %pluginFile%

:: Rust Server Launcher
echo @echo off >> %serverFile%
echo echo "====== Check For Updates ======" >> %serverFile%
echo :start  >> %serverFile%
echo "..\steamCMD\steamcmd.exe" +force_install_dir "..\%RUSTSERVER_PATH%" +login anonymous +app_update 258550 +quit >> %serverFile%
echo echo "======== Launch Server ========" >> %serverFile%
echo :start  >> %serverFile%
echo RustDedicated.exe -batchmode ^ >> %serverFile%
echo +server.level "Procedural Map" ^ >> %serverFile%
echo +server.maxplayers 5 ^ >> %serverFile%
echo +server.worldsize 1000 ^ >> %serverFile%
echo +server.seed 123456789 ^ >> %serverFile%
echo +server.hostname "Test Server" ^ >> %serverFile%
echo +server.description "Test Server description" ^ >> %serverFile%
echo +server.queryport 27017 ^ >> %serverFile%
echo +server.port 28015 ^ >> %serverFile%
echo +rcon.port 28016 ^ >> %serverFile%
echo +app.port 28082 ^ >> %serverFile%
echo +rcon.password somePassword ^ >> %serverFile%
echo +rcon.web 1 ^ >> %serverFile%
echo goto start >> %serverFile%

echo File created successfully: %serverFile%

echo Workplace_Installer completed successfully
exit /b 0