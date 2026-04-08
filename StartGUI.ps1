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

# Override OSDCloud Values to restrict OS options
$Global:OSDModuleResource.OSDCloud.Values.OSNameValues = @($OSName)
$Global:OSDModuleResource.OSDCloud.Values.OSReleaseIDValues = @('25H2')
$Global:OSDModuleResource.OSDCloud.Values.OSEditionValues = @($OSEdition)
$Global:OSDModuleResource.OSDCloud.Values.OSLanguageValues = @($OSLanguage)
$Global:OSDModuleResource.OSDCloud.Values.OSVersionValues = @('Windows 11')

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

# Launch OSDCloud GUI with restricted options
Write-Host "Starting OSDCloud GUI with restricted options..." -ForegroundColor Green
Start-OSDCloudGUI -BrandName "NetApp IT" -BrandColor "#00ADEF"
