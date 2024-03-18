#Write-Verbose "SPICE TOOLS" "Installing..."
#Write-Verbose "SPICE TOOLS" "Importing Red Hat Certificate..."
certutil -AddStore "TrustedPublisher" "a:\redhat.cer"
Start-Process -FilePath "C:\Windows\Temp\spice-guest-tools.exe" -ArgumentList "/S" -Wait
#Write-Verbose "SPICE TOOLS" "Successfully Installed."
