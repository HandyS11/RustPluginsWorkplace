@echo off

cd /d %~dp0Scripts
call Carbon_Updater.bat

cd /d %~dp0Scripts
call Oxide_Updater.bat

cd /d %~dp0Scripts
call Extension_Updater.bat

cd /d %~dp0
if not exist steamCMD/steamcmd.exe call Scripts/SteamCMD_Installer.bat

cd /d %~dp0
call Scripts/Server_Updater.bat