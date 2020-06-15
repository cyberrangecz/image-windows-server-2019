# Enable UAC
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 1 -Force

# Create folder location
New-Item -Path c:\ -Name temp -ItemType Directory
# Download openssh
(New-Object System.Net.WebClient).DownloadFile('https://github.com/PowerShell/Win32-OpenSSH/releases/download/v8.1.0.0p1-Beta/OpenSSH-Win64.zip','C:\temp\OpenSSH-Win64.zip')
# Unzip the files
Expand-Archive -Path "c:\temp\OpenSSH-Win64.Zip" -DestinationPath "C:\Program Files\OpenSSH"
# Install service
. "C:\Program Files\OpenSSH\OpenSSH-Win64\install-sshd.ps1"
# Set firewall permissions
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

# Set service startup
Set-Service sshd -StartupType Automatic
Start-Service sshd

# Set Authentication to public key
((Get-Content -path C:\ProgramData\ssh\sshd_config -Raw) `
-replace '#PubkeyAuthentication yes','PubkeyAuthentication yes' `
-replace '#PasswordAuthentication yes','PasswordAuthentication no' `
-replace 'Match Group administrators','#Match Group administrators' `
-replace 'AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys','#AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys') | Set-Content -Path C:\ProgramData\ssh\sshd_config

# Restart after changes
Restart-Service sshd


# force file creation
New-item -Path $env:USERPROFILE -Name .ssh -ItemType Directory -force

# Copy key
Write-Output "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNANQ4GnFqkwZ7YPuOkqcgRSaXkNdHQge4lgXUU1eaDn3GISQFK/hjxdX73PyQwSo/mEm0y3JKxo6/GredC8X6n1pSQ+61VGBg1bRzn8oiREZYZ4568mzgRVn8O70XPTZUzctI4FvgmwUi1oIXvXize0lXSMOXuKogXuwAjiqMQb1c+NnXdXJ7wpITg8Bdvl8Th+aYB8Utb3vAf5yGDHViq+cjXaHrvuTqpwV7s+3wwYOJxc0jckqqWiV2/yhqV5Wy5zYyJu+r9gvY9jXRKe1UTFdNaznGPCF3rfqqo+mVA1dY5gFsV7sFtpoq5YbGgm8vNrb025172kANXp6KDoq/hTnRN5Ph1liYmpwn9UkckK6ddMPmz3w4uWDy4ow8/bR+1nwuf/uW8tdy9cKgIBMtYcpxEJXpEBVYKb2+8X3NY809ar0p0xwrMqPwmizNz5z4cq2SkJPvT9frBoW6/itTiZtxeOeiI9qXPHQ4ZK3yfGx2veBYL0uLrDxvZErCfs8= build-key" | Out-File $env:USERPROFILE\.ssh\authorized_keys -Encoding ascii

