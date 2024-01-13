@echo off

cd /d %~dp0..
if not exist modding md modding

cd /d modding
powershell -command "& { Invoke-WebRequest -Uri https://umod.org/games/rust/download -OutFile Oxide.Rust.zip }"
powershell -command "& { Expand-Archive -Force Oxide.Rust.zip Oxide.Rust }"
if exist Oxide.Rust.zip del Oxide.Rust.zip
