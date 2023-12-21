echo off

powershell -command "& { Invoke-WebRequest -Uri https://umod.org/games/rust/download -OutFile Modding\Oxide.Rust.zip }"
powershell -command "& { Expand-Archive -Force '%~dp0Modding\Oxide.Rust.zip' '%~dp0Modding\Oxide.Rust' }"
del Modding\Oxide.Rust.zip

powershell -command "& { Invoke-WebRequest -Uri https://chaoscode.io/oxide/Oxide.Ext.Chaos.dll -OutFile Modding\Oxide.Ext.Chaos.dll }"
powershell -command "& { Invoke-WebRequest -Uri https://umod.org/extensions/discord/download -OutFile Modding\Oxide.Ext.Discord.dll }"