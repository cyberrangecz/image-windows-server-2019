#Write-Verbose "SPICE TOOLS" "Installing..."
#Write-Verbose "SPICE TOOLS" "Importing Red Hat Certificate..."
$cert = Import-Certificate "a:\redhat.cer" -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher" -ErrorAction SilentlyContinue
Start-Process -FilePath "C:\Windows\Temp\spice-guest-tools.exe" -ArgumentList "/S" -Wait -ErrorAction SilentlyContinue
#Write-Verbose "SPICE TOOLS" "Removing Red Hat Certificate..."
Get-childitem "Cert:\LocalMachine\TrustedPublisher" -ErrorAction SilentlyContinue | Where-Object -Property Thumbprint -eq $cert.Thumbprint -ErrorAction SilentlyContinue | Remove-Item -ErrorAction SilentlyContinue
#Write-Verbose "SPICE TOOLS" "Successfully Installed."
