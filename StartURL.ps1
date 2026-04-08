#These settings will download Windows 11 24H2 x64 and install the Enterprise Volume License version.
Start-OSDCloudCLI -OSName 'Windows 11 24H2 x64' -OSLanguage en-us -OSEdition Enterprise -OSActivation Volume -Shutdown
