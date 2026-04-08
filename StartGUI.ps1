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

# Predefine the OS index to restrict available options
$Global:OSDCloud.Index = @(
    @{
        OSName        = $OSName
        OSBuild       = '25H2'
        OSEdition     = $OSEdition
        OSLanguage    = $OSLanguage
        Architecture  = 'x64'
        OSActivation  = $OSActivation
    }
)

# Launch OSDCloud GUI with branding
Write-Host "Starting OSDCloud GUI with restricted options..." -ForegroundColor Green
Start-OSDCloudGUI -BrandName "NetApp IT" -BrandColor "#00ADEF"
