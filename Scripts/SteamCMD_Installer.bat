@echo off

cd /d %~dp0..
if not exist steamCMD md steamCMD

powershell -Command "Invoke-WebRequest https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -OutFile steamCMD\package.zip -UseBasicParsing"
powershell -command "Expand-Archive -Force steamCMD/package.zip steamCMD"
if exist steamCMD\package.zip del steamCMD\package.zip