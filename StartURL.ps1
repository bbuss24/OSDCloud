#Requires -RunAsAdministrator
[CmdletBinding()]
param()

# Set PowerShell window title (optional)
$host.UI.RawUI.WindowTitle = "NetApp IT - OSDCloud Deployment"

# Console branding
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "              NetApp IT Deployment           " -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# Directly deploy the desired OS using OSDCloudCLI
Write-Host "Starting OSDCloud deployment for Windows 11 24H2 x64 Enterprise en-us..." -ForegroundColor Green

Start-OSDCloudCLI -OSName 'Windows 11 24H2 x64' `
                  -OSLanguage en-us `
                  -OSEdition Enterprise `
                  -OSActivation Volume `
                  -Shutdown
