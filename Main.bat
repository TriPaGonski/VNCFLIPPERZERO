@echo off
timeout /t 1 >nul
start winvnc.exe -connect 192.168.68.50::6666
