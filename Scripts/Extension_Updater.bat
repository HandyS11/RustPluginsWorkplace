@echo off

cd /d %~dp0..
if not exist modding md modding

cd /d modding
powershell -command "& { Invoke-WebRequest -Uri https://chaoscode.io/oxide/Oxide.Ext.Chaos.dll -OutFile Oxide.Ext.Chaos.dll }"
powershell -command "& { Invoke-WebRequest -Uri https://umod.org/extensions/discord/download -OutFile Oxide.Ext.Discord.dll }"
powershell -command "& { Invoke-WebRequest -Uri https://github.com/k1lly0u/Oxide.Ext.RustEdit/raw/master/Oxide.Ext.RustEdit.dll -OutFile Oxide.Ext.RustEdit.dll }"