#Requires -RunAsAdministrator
[CmdletBinding()]
param()

Write-Host "OSDCloud: Restricted GUI mode - NetApp IT" -ForegroundColor Cyan

# --- Hard lock the OS choice you want
# These values are the intent; depending on OSDCloud build you may need to adjust naming
$OSDCloudParams = @{
    OSVersion    = 'Windows 11'
    OSBuild      = '24H2'
    OSEdition    = 'Enterprise'
    OSLanguage   = 'en-us'
    OSArchitecture = 'x64'
}

# --- Reduce / remove optional UI surfaces (best-effort across OSDCloud v1 variants)
# Some of these flags exist in many v1 builds; if one isn't recognized, remove it.
$GUIParams = @{
    # If supported, this prevents browsing other OSes/cats and hides optional pages
    HideOptionalPages = $true
    HideDrivers       = $true
    HideOptions       = $true
    HideLanguage      = $true
    HideEdition       = $true
    HideBuild         = $true
    HideArchitecture  = $true

    # Some builds use "Branding" or "Title" parameters
    Title             = 'Windows 11 Enterprise 24H2 (en-us)'
}

# --- Start OSDCloud GUI with forced selection
# Common pattern in v1: Start-OSDCloudGUI then it uses defaults; others accept direct parameters.
try {
    Start-OSDCloudGUI @OSDCloudParams @GUIParams
}
catch {
    Write-Warning "Start-OSDCloudGUI parameters not accepted in this build. Falling back to preselection + GUI."
    # Fallback: set globals/config then start GUI
    if ($null -eq $Global:OSDCloud) { $Global:OSDCloud = @{} }
    $Global:OSDCloud.OSVersion      = $OSDCloudParams.OSVersion
    $Global:OSDCloud.OSBuild        = $OSDCloudParams.OSBuild
    $Global:OSDCloud.OSEdition      = $OSDCloudParams.OSEdition
    $Global:OSDCloud.OSLanguage     = $OSDCloudParams.OSLanguage
    $Global:OSDCloud.OSArchitecture = $OSDCloudParams.OSArchitecture

    # Attempt to set UI suppression flags as config
    $Global:OSDCloud.HideOptionalPages = $true
    $Global:OSDCloud.HideDrivers       = $true
    $Global:OSDCloud.HideOptions       = $true

    Start-OSDCloudGUI
}
