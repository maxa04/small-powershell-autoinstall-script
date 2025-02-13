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

# Categorized list of packages
$systemTools = @("gpu-z", "cpu-z", "hwinfo", "speecy", "openhardwaremonitor", "latencymon")
$diskAndFileManagement = @("linux-reader", "crystaldiskinfo", "victoria", "dmde", "photorec", "defraggler", "partition-assistant-standard", "diskgenius", "hdtune", "macrium-reflect-free", "ultraiso")
$dataRecoveryAndBackup = @("recuva", "backupper-standard", "registry-backup", "easeus-data-recovery")
$securityAndPrivacy = @("eraser", "veracrypt", "stinger", "wireshark", "keepass", "autoruns", "malwarebytes")
$fileAndTextEditors = @("fsviewer", "notepadplusplus", "winmerge", "vscode", "fiddler")
$mediaTools = @("vlc", "irfanview")
$storageAndISO = @("cdburnerxp", "rufus", "imageusb")
$developerAndSysAdmin = @("attributechanger", "dependencywalker", "regshot", "sysinternals", "powershell-core", "imdisk", "git")
$fileManagers = @("totalcommander", "treesizefree")
$browsers = @("googlechrome", "firefox", "brave")
$remoteAccessAndNetworking = @("anydesk.install", "winscp", "putty", "mobaxterm")

# Combine all packages
$allPackages = $systemTools + $diskAndFileManagement + $dataRecoveryAndBackup + $securityAndPrivacy + $fileAndTextEditors + $mediaTools + $storageAndISO + $developerAndSysAdmin + $fileManagers + $browsers + $remoteAccessAndNetworking

# Installation of packages
foreach ($pkg in $allPackages) {
    Write-Host "Installing $pkg ..."
    choco install $pkg -y --no-progress
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error installing $pkg!" -ForegroundColor Red
    }
    else {
        Write-Host "$pkg successfully installed." -ForegroundColor Green
    }
}
