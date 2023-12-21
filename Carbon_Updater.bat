echo off

powershell -command "& { Invoke-WebRequest -Uri https://github.com/CarbonCommunity/Carbon/releases/download/production_build/Carbon.Windows.Release.zip -OutFile Modding\Carbon.Windows.Release.zip }"
powershell -command "& { Expand-Archive -Force '%~dp0Modding\Carbon.Windows.Release.zip' '%~dp0Modding\Carbon.Windows.Release' }"
del Modding\Carbon.Windows.Release.zip

powershell -command "& { Invoke-WebRequest -Uri https://chaoscode.io/oxide/Oxide.Ext.Chaos.dll -OutFile Modding\Oxide.Ext.Chaos.dll }"
powershell -command "& { Invoke-WebRequest -Uri https://umod.org/extensions/discord/download -OutFile Modding\Oxide.Ext.Discord.dll }"