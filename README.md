# software-autoinstallation-via-powershell
Ein Script was es einfach ermöglicht Software mit dem Paketmanager chocolatey zu installieren

---
# Vorraussetzungen
- ***Betriebssystem:*** Windows
- Administratorrechte auf dem jeweilligen PC

# Softwareauswahl
Stellen Sie sicher das die ausgewählte Software auch mit dem Paketmanager "chocolatey" installiert werden kann.
Dies kann einfach auf der [Webseite](https://community.chocolatey.org/packages) überprüft werden.

# Skript einrichten
Wenn Sie geprüft haben ob die Software verfügbar ist können Sie diese nacheinander wie folgt in das Array ***$packages*** einfügen.

```Powershell
$packages = @(
    "crystaldiskinfo",
    "cpu-z",
    "gpu-z",
    "hwinfo",
    "winscp",
    "putty"
)
```

Nicht vergessen das Script zu speichern!

# Script ausführen
Powershell als Administrator starten und das Script vom CLI ausführen.

# Fehlerbehebung

## Execution Policy

### Ursache
Der Fehler tritt auf, weil die Ausführung von PowerShell-Skripten auf Ihrem System durch die **Execution Policy** blockiert ist.

### Fehlerbild
*...kann nicht geladen werden, da die Ausführung von Skripts auf diesem System deaktiviert ist. Weitere Informationen finden Sie unter "about_Execution_Policies"*

### Lösung

Folgenden Befehl als Administrator in Powershell ausführen
```Powershell
Set-ExecutionPolicy RemoteSigned
```




