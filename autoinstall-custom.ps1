# Script Start - Ensure the script is run as Administrator!
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole] "Administrator"))
{
    Write-Host "Please run this script as Administrator." -ForegroundColor Red
    Exit
}

# Change Execution Policy for the current user to RemoteSigned (permanent)
Write-Host "Changing Execution Policy to RemoteSigned for the current user..."
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force

# Check if Chocolatey is installed. If not, install it.
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey is not installed. Starting installation..."
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# List of packages to install (always the latest version)
$packages = @(
    "software1",
    "software2"
)

# Installation of packages
foreach ($pkg in $packages) {
    Write-Host "Installing $pkg ..."
    choco install $pkg -y --no-progress
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error installing $pkg!" -ForegroundColor Red
    }
    else {
        Write-Host "$pkg successfully installed." -ForegroundColor Green
    }
}
