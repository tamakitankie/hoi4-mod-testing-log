# System Specifications

## Hardware Configuration
**CPU:** Intel(R) Core(TM) i9-9980HK
**GPU:** NVIDIA GeForce RTX 3060
**RAM:** 16 GB
**Storage:** NVMe SSD
**Display:** 1920x1080 @ 144Hz

## Software Environment
**Operating System:** Windows 11 Pro 23H2
**Build Number:** 26200.7623
**Windows Features:** All default, clean install
**Antivirus:** Windows Defender (with Paradox exclusions)

## Dependencies Installed
- **DirectX:** End-User Runtime (June 2025)
- **Visual C++:** 2015-2022 Redistributable (x86 & x64)
- **.NET Framework:** 4.8.1
- **.NET Desktop Runtime:** 6.0.25
- **Windows Updates:** Fully updated as of 2026-02-09

## HOI4 Installation Details
**Version:** 1.17.3
**Checksum:** f303
**Full Version String:** Musketeer v1.17.3.0.3a95 (f303)
**Install Path:** `C:\Program Files (x86)\Steam\steamapps\common\Hearts of Iron IV`
**Documents Path:** `C:\Users\[Username]\Documents\Paradox Interactive\Hearts of Iron IV`
**Steam Path:** `C:\Program Files (x86)\Steam`

## Mod Testing Locations
**Mod Storage:** `Documents\Paradox Interactive\Hearts of Iron IV\mod\`
**Launcher Database:** `AppData\Local\Programs\Paradox Interactive\`
**Game Logs:** `Documents\Paradox Interactive\Hearts of Iron IV\logs\`

## File System Permissions
- Full control granted to all Paradox folders
- Windows Defender exclusions for game directories
- User Account Control: Default settings
- File permissions verified via PowerShell: `Get-Acl`

## Network Configuration
- Standard home network
- No VPN or proxy
- Windows Firewall with game exceptions
- Steam in online mode

## Verification Commands
```powershell
# System verification commands run
dxdiag /t dxdiag.txt
systeminfo > systeminfo.txt
Get-WindowsUpdateLog
