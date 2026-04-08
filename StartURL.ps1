#Requires -RunAsAdministrator
[CmdletBinding()]
param()

# Set PowerShell window title (optional)
$host.UI.RawUI.WindowTitle = "NetApp IT - OSDCloud Deployment"

# Console branding
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "              NetApp IT Deployment           " -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# Display a warning prompt
$WarningMessage = "WARNING: Click OK to proceed. This action will repartition the primary system drive and is NOT reversible."
$PromptResult = [System.Windows.Forms.MessageBox]::Show($WarningMessage, "OSDCloud Deployment Warning", [System.Windows.Forms.MessageBoxButtons]::OKCancel, [System.Windows.Forms.MessageBoxIcon]::Warning)

# If the user clicks "Cancel", exit the script
if ($PromptResult -ne [System.Windows.Forms.DialogResult]::OK) {
    Write-Host "Deployment canceled by the technician." -ForegroundColor Yellow
    exit
}

# Variables for Windows OS / Edition
$OSName = 'Windows 11 25H2 x64'
$OSEdition = 'Enterprise'
$OSActivation = 'Volume'
$OSLanguage = 'en-us'

# Suppress CLI confirmation by automating the input
Write-Host "Starting OSDCloud deployment for Windows 11 25H2 x64 Enterprise en-us..." -ForegroundColor Green
"Y" | Start-OSDCloudCLI -OSName $OSName `
                        -OSLanguage $OSLanguage `
                        -OSEdition $OSEdition `
                        -OSActivation $OSActivation `
                        -Shutdown
