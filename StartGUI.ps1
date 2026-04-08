#Requires -RunAsAdministrator
[CmdletBinding()]
param()

# Set PowerShell window title (optional)
$host.UI.RawUI.WindowTitle = "NetApp IT - OSDCloud Deployment"

# Console branding
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "              NetApp IT Deployment           " -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# Variables for Windows OS / Edition
$OSName = 'Windows 11 25H2 x64'
$OSEdition = 'Enterprise'
$OSActivation = 'Volume'
$OSLanguage = 'en-us'

# Set OSDCloud Variables
$Global:MyOSDCloud = [ordered]@{
    Restart               = $false
    RecoveryPartition     = $true
    OEMActivation         = $true
    WindowsUpdate         = $true
    WindowsUpdateDrivers  = $true
    WindowsDefenderUpdate = $true
    SetTimeZone           = $true
    ClearDiskConfirm      = $true
    ShutdownSetupComplete = $true
    SyncMSUpCatDriverUSB  = $true
    CheckSHA1             = $true
}

# Directly deploy the desired OS
Write-Host "Starting OSDCloud deployment for Windows 11 25H2 x64 Enterprise en-us..." -ForegroundColor Green
Start-OSDCloud -OSName $OSName -OSEdition $OSEdition -OSActivation $OSActivation -OSLanguage $OSLanguage
