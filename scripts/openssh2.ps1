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

# Set Powershell as default line
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force

# Restart after changes
Restart-Service sshd

<#
# force file creation
New-item -Path $env:USERPROFILE -Name .ssh -ItemType Directory -force

# Copy key
Write-Output "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpFkwlOKVUVO99xD9NwptycMLHYwm6DEfAxtI7AzNcJhyZ8ME88+viwDK6FE5t9p0X6bCxC7zkxfVGeabrIjEK+mQgIY5vuW7diuCwztdeTyqqOcotCx9SyNOJwotqaVGEEbjkzAXQNWHivkoyBnTB0nMg5rCfXD9zYUsT6OBI9SU7GG1c0skYkNUJpPqo+mwUIU1ZPa8cZBOfg/SprSxTS+lKzU6567ZDkcGjK3dRycKXDYauci5M/7MiCZijzJtGQDjMa0iXCgUZt0ypiUax/bw0JmUN9sC1a+/H40SpVtkUbQzmziFfv7Wg34WxFUyA9wupLf/I0K3oWnQahZ19 ucn\143208@kotlik-pc" | Out-File $env:USERPROFILE\.ssh\authorized_keys -Encoding ascii
#>