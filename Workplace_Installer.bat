@echo off

call Workplace_Updater.bat

if not exist rustserver md rustserver

:: Carbon
>rustserver\Carbon_Installer.bat (
	echo @echo off
	echo xcopy "..\modding\Carbon.Windows.Release\*" "." /E /I /Y
)

>rustserver\Carbon_Extension_Installer.bat (
	echo @echo off
	echo xcopy "..\modding\*.dll" "carbon\extensions\" /Y
)

>rustserver\Carbon_Plugin_Loader.bat (
	echo @echo off
	echo xcopy "..\Carbon.Plugins\*cs" "carbon\plugins\" /Y
	echo xcopy "..\Oxide.Plugins\*cs" "carbon\plugins\" /Y
)

:: Oxide
>rustserver\Oxide_Installer.bat (
	echo @echo off
	echo xcopy "..\modding\Oxide.Rust\*" "." /E /I /Y
)

>rustserver\Oxide_Extension_Installer.bat (
	echo @echo off
	echo xcopy "..\modding\Oxide.Ext.*.dll" "RustDedicated_Data\Managed\" /Y
)

>rustserver\Oxide_Plugin_Loader.bat (
	echo @echo off
	echo xcopy "..\Oxide.Plugins\*cs" "RustDedicated_Data\Managed\" /Y
)

:: Rust
>rustserver\Server_Launcher.bat (
	echo @echo off
	echo :: "====== Check For Updates ======"
	echo :start 
	echo "..\steamCMD\steamcmd.exe" +force_install_dir "..\rustserver" +login anonymous +app_update 258550 +quit
	echo :: "======== Launch Server ========"
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