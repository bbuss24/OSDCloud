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

    # Restrict OS options
    OSVersion             = 'Windows 11'       # Restrict to Windows 11
    OSBuild               = '25H2'             # Restrict to 25H2 build
    OSEdition             = 'Enterprise'       # Restrict to Enterprise edition
    OSLanguage            = 'en-us'            # Restrict to en-us language
    OSArchitecture        = 'x64'              # Restrict to x64 architecture
}

# Launch OSDCloud GUI with branding
Write-Host "Starting OSDCloud GUI..." -ForegroundColor Green
Start-OSDCloudGUI -OSVersion "Windows 11" -OSBuild "25H2" -OSEdition "Enterprise" -OSLanguage "en-us" -OSArchitecture "x64" -BrandName "NetApp IT" -BrandColor "#00ADEF"
