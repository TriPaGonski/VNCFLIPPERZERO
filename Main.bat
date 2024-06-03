@echo
start winvnc.exe -run
timeout /t 10 >nul
start winvnc.exe -connect 192.168.68.50::6666
