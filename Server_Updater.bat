echo off

:start 
"steamCMD\steamcmd.exe" +force_install_dir "..\rustserver" +login anonymous +app_update 258550 +quit
:: +app_update 258550 -beta staging | +app_update 258550 -beta prerelease"