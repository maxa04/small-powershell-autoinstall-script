# Small PowerShell Auto-Install Script
A script that simplifies software installation using the Chocolatey package manager

## Prerequisites
- **Operating System:** Windows
- Administrator rights on the respective PC

## Software Selection
Ensure that the selected software can be installed with the "Chocolatey" package manager.
This can be easily verified on the [website](https://community.chocolatey.org/packages).

## Setting Up the Script
Download the [Script](https://raw.githubusercontent.com/maxa04/small-powershell-autoinstall-script/refs/heads/main/small-autoinstall-script.ps1) from Repository. 
After verifying the software availability, you can insert them one after another into the ***$packages*** array as follows:



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

Don't forget to save the script!

## Executing the Script
Start PowerShell as an administrator and run the script from the CLI.

## Troubleshooting

### Execution Policy

#### Cause
The error occurs because the execution of PowerShell scripts on your system is blocked by the **Execution Policy**.

#### Error Message
*...cannot be loaded because running scripts is disabled on this system. For more information, see about_Execution_Policies*

#### Solution

Execute the following command as an administrator in PowerShell:
```Powershell
Set-ExecutionPolicy RemoteSigned
```
