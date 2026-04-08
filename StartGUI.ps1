#Requires -RunAsAdministrator
[CmdletBinding()]
param()

# Set PowerShell window title (optional)
$host.UI.RawUI.WindowTitle = "NetApp IT - OSDCloud Deployment"

# Console branding
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "              NetApp IT Deployment           " -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# Path to the JSON configuration file
$JsonFile = "$env:LOCALAPPDATA\Temp\Start-OSDCloudGUI.json"

# Define the restricted configuration
$JsonContent = @{
    BrandName         = "NetApp IT"
    BrandColor        = "#00ADEF"
    OSActivation      = "Volume"
    OSEdition         = "Enterprise"
    OSLanguage        = "en-us"
    OSName            = "Windows 11 25H2 x64"
    OSReleaseID       = "25H2"
    OSVersion         = "Windows 11"
}

# Convert to JSON and export
$JsonContent | ConvertTo-Json -Depth 10 | Set-Content -Path $JsonFile -Force

Write-Host "Exported restricted configuration to $JsonFile" -ForegroundColor Green

# Launch OSDCloud GUI with JSON configuration
Write-Host "Starting OSDCloud GUI with restricted options..." -ForegroundColor Green
Start-OSDCloudGUI -AutomateJsonFile $JsonFile
