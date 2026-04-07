#Requires -RunAsAdministrator
[CmdletBinding()]
param()

Write-Host "OSDCloud: Restricted GUI mode - NetApp IT" -ForegroundColor Cyan


###### --- David Segura Code ----######
#Variables to define the Windows OS / Edition etc to be applied during OSDCloud
$OSName = 'Windows 11 23H2 x64'
$OSEdition = 'Pro'
$OSActivation = 'Retail'
$OSLanguage = 'en-us'

#Set OSDCloud Vars
$Global:MyOSDCloud = [ordered]@{
    Restart = [bool]$False
    RecoveryPartition = [bool]$true
    OEMActivation = [bool]$True
    WindowsUpdate = [bool]$true
    WindowsUpdateDrivers = [bool]$true
    WindowsDefenderUpdate = [bool]$true
    SetTimeZone = [bool]$true
    ClearDiskConfirm = [bool]$False
    ShutdownSetupComplete = [bool]$false
    SyncMSUpCatDriverUSB = [bool]$true
    CheckSHA1 = [bool]$true
}

#Launch OSDCloud
Write-Host "Starting OSDCloud" -ForegroundColor Green
write-host "Start-OSDCloud -OSName $OSName -OSEdition $OSEdition -OSActivation $OSActivation -OSLanguage $OSLanguage"

Start-OSDCloud -OSName $OSName -OSEdition $OSEdition -OSActivation $OSActivation -OSLanguage $OSLanguage


# --- Hard lock the OS choice you want
# These values are the intent; depending on OSDCloud build you may need to adjust naming
<#
$OSDCloudParams = @{
    OSVersion    = 'Windows 11'
    OSBuild      = '24H2'
    OSEdition    = 'Enterprise'
    OSLanguage   = 'en-us'
    OSArchitecture = 'x64'
}
#>
