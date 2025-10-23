@echo off
echo ------------------------------------
echo  🛑  Stopping local server...
echo ------------------------------------
powershell -ExecutionPolicy Bypass -File "%~dp0stop_server.ps1"
pause
