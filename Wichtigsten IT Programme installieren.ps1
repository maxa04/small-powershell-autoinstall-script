# Skriptstart – Stelle sicher, dass das Skript als Administrator ausgeführt wird!
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole] "Administrator"))
{
    Write-Host "Bitte dieses Skript als Administrator ausführen." -ForegroundColor Red
    Exit
}

# Änderung der Execution Policy für den aktuellen Benutzer auf RemoteSigned (permanent)
Write-Host "Ändere Execution Policy auf RemoteSigned für den aktuellen Benutzer..."
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force

# Überprüfen, ob Chocolatey installiert ist. Falls nicht, wird es installiert.
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey ist nicht installiert. Die Installation wird gestartet..."
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Liste der zu installierenden Pakete (immer die neueste Version)
$packages = @(
    "bootice",
    "easybcd",
    "checkdiskgui",
    "lazesoft-data-recovery",
    "puran-data-recovery",
    "puran-file-recovery",
    "recuva",
    "dmde",
    "reclaime",
    "photorec",
    "unstoppable-copier",
    "victoria",
    "diskinternals-linux-reader",
    "paragon-applefs",
    "defraggler",
    "gsmartcontrol",
    "hddscan",
    "hdtune",
    "wd-data-lifeguard-diagnostics",
    "crystaldiskinfo",
    "testdisk",
    "acronis-cyber-protect",
    "aomei-backupper",
    "lazesoft-disk-image-and-clone",
    "macrium-reflect-pe",
    "runtime-driveimage-xml",
    "drive-snapshot",
    "aomei-partition-assistant",
    "macrorit-partition-extender",
    "macrorit-partition-expert",
    "diskgenius",
    "easeus-partition-master",
    "hdd-low-level-format-tool",
    "eraser",
    "veracrypt",
    "lazesoft-windows-recovery",
    "fsviewer",
    "free-office",
    "sumatrapdf",
    "7zip",
    "examdiff-pro",
    "hxd",
    "notepadplusplus",
    "winmerge",
    "vlc",
    "treesize-free",
    "irfanview",
    "nvda",
    "cdburnerxp",
    "rufus",
    "imageusb",
    "eset-online-scanner",
    "mcafee-stinger",
    "showkeyplus",
    "lazesoft-password-recovery",
    "nt-password-edit",
    "windows-login-unlocker",
    "cpu-z",
    "gpu-z",
    "hwinfo",
    "speccy",
    "wintntsetup",
    "attribute-changer",
    "change-keyboard-layout",
    "dependency-walker",
    "registry-backup",
    "regshot",
    "sysinternals",
    "powershell-core",
    "aqua-key-test",
    "imdisk",
    "total-commander",
    "aero-admin",
    "googlechrome",
    "firefox-esr",
    "penetwork",
    "anydesk",
    "winscp",
    "putty"
)

# Installation der Pakete
foreach ($pkg in $packages) {
    Write-Host "Installiere $pkg ..."
    choco install $pkg -y --no-progress
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Fehler bei der Installation von $pkg!" -ForegroundColor Red
    }
    else {
        Write-Host "$pkg erfolgreich installiert." -ForegroundColor Green
    }
}
