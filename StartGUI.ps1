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
$OSName = 'Windows 11 24H2 x64'
$OSEdition = 'Enterprise'
$OSActivation = 'Volume'
$OSLanguage = 'en-us'

# Set OSDCloud Variables
$Global:MyOSDCloud = [ordered]@{
    Restart               = [bool]$False
    RecoveryPartition     = [bool]$true
    OEMActivation         = [bool]$True
    WindowsUpdate         = [bool]$true
    WindowsUpdateDrivers  = [bool]$true
    WindowsDefenderUpdate = [bool]$true
    SetTimeZone           = [bool]$true
    ClearDiskConfirm      = [bool]$true
    ShutdownSetupComplete = [bool]$true
    SyncMSUpCatDriverUSB  = [bool]$true
    CheckSHA1             = [bool]$true

        # Restrict OS options
    OSVersion             = 'Windows 11'       # Restrict to Windows 11
    OSBuild               = '24H2'             # Restrict to 24H2 build
    OSEdition             = 'Enterprise'       # Restrict to Enterprise edition
    OSLanguage            = 'en-us'            # Restrict to en-us language
    OSArchitecture        = 'x64'              # Restrict to x64 architecture
}

# Launch OSDCloud GUI with branding
Write-Host "Starting OSDCloud GUI..." -ForegroundColor Green
Start-OSDCloudGUI -BrandName "NetApp IT" -BrandColor "#00ADEF"
