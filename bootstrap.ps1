#Requires -RunAsAdministrator

# Install software
Write-Output "Installing 'Microsoft.PowerShell' using winget."
winget install --silent Microsoft.PowerShell
Write-Output "Installing 'Write-Output 'Microsoft.VisualStudioCode' using winget."
winget install --silent Microsoft.VisualStudioCode
Write-Output "Installing 'Spotify.Spotify' using winget."
winget install --silent Spotify.Spotify
Write-Output "Installing 'GoLang.Go.1.19' using winget."
winget install --silent GoLang.Go.1.19

# Setup OpenSSH client/server
Write-Output "Fetching 'OpenSSH*' Windows capabilities."
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'
Write-Output "Enabling 'OpenSSH.Client' Windows capability."
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
Write-Output "Enabling 'OpenSSH.Server' Windows capability."
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Write-Output "Starting 'sshd' service."
Start-Service sshd
Write-Output "Setting startupType to 'Automatic' for 'sshd' service."
Set-Service -Name sshd -StartupType 'Automatic'

# Firewall settings
#
# Allow incoming 22/tcp
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}
# Allow incoming ICMPv4
if (!(Get-NetFirewallRule -Name "ICMPv4-In" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'ICMPv4-In' does not exist, creating it..."
    New-NetFirewallRule -Name 'ICMPv4-In' -DisplayName 'ICMPv4 (ping)' -Enabled True -Direction Inbound -Protocol ICMPv4 -Action Allow
} else {
    Write-Output "Firewall rule 'ICMPv4-In' has been created and exists."
}

# Setup WSL
Write-Output "Installing WSL (Ubuntu)."
wsl --install Ubuntu
@'
[wsl2]
guiApplications=false
'@>$env:USERPROFILE\.wslconfig
