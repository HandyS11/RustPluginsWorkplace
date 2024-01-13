@echo off

cd /d %~dp0..
if not exist modding md modding

cd /d modding
powershell -command "& { Invoke-WebRequest -Uri https://github.com/CarbonCommunity/Carbon/releases/download/production_build/Carbon.Windows.Release.zip -OutFile Carbon.Windows.Release.zip }"
powershell -command "& { Expand-Archive -Force Carbon.Windows.Release.zip Carbon.Windows.Release }"
if exist Carbon.Windows.Release.zip del Carbon.Windows.Release.zip