echo off

:: 
:: SteamCMD
:: 
md steamCMD
powershell -Command "Invoke-WebRequest https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -OutFile steamCMD\package.zip"
powershell -command "Expand-Archive -Force '%~dp0steamCMD\package.zip' '%~dp0steamCMD\'"
del steamCMD\package.zip

:: 
:: Modding
:: 
md Modding

call Carbon_Updater.bat
call Oxide_Updater.bat

:: 
:: Rust Server
:: 
call Server_Updater.bat

:: 
:: Scripts
:: 
>rustserver\Carbon_Installer.bat (
	echo echo off
	echo call ..\Carbon_Updater.bat
	echo xcopy "..\Modding\Carbon.Windows.Release\*" "." /E /I /Y
	echo xcopy "..\Modding\Oxide.Ext.Chaos.dll" "carbon\extensions\" /E /I /Y
	echo xcopy "..\Modding\Oxide.Ext.Chaos.dll" "carbon\extensions\" /E /I /Y
)

>rustserver\Oxide_Installer.bat (
	echo echo off
	echo call ..\Oxide_Updater.bat
	echo xcopy "..\Modding\Oxide.Rust\*" "." /E /I /Y
	echo xcopy "..\Modding\Oxide.Ext.Chaos.dll" "RustDedicated_Data\Managed\" /E /I /Y
	echo xcopy "..\Modding\Oxide.Ext.Chaos.dll" "RustDedicated_Data\Managed\" /E /I /Y
)

>rustserver\Server_Launcher.bat (
	echo :: "====== Check For Updates ======"
	echo echo off
	echo :start 
	echo "..\steamCMD\steamcmd.exe" +force_install_dir "..\rustserver" +login anonymous +app_update 258550 +quit
	echo :: "======== Launch Server ========"
	echo echo off
	echo :start 
	echo RustDedicated.exe -batchmode ^^
	echo +server.level "Procedural Map" ^^
	echo +server.maxplayers 5 ^^
	echo +server.worldsize 1000 ^^
	echo +server.seed 123456789 ^^
	echo +server.hostname "Test Server"" ^^
	echo +server.description "Test Server description ^^
	echo +server.queryport 27017 ^^
	echo +server.port 28015 ^^
	echo +rcon.port 28016 ^^
	echo +app.port 28082 ^^
	echo +rcon.password somePassword ^^
	echo +rcon.web 1 ^^
	echo goto start
)