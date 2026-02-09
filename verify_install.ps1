# HOI4 Installation Verification Script

Write-Host "=== HOI4 Installation Verification ===" -ForegroundColor Cyan
Write-Host "Verifies all dependencies and game files" -ForegroundColor Gray
Write-Host "`n"

# Check 1: Game Installation
Write-Host "[1/5] Checking HOI4 installation..." -ForegroundColor Yellow
$hoi4Path = "C:\Program Files (x86)\Steam\steamapps\common\Hearts of Iron IV"
if (Test-Path $hoi4Path) {
    $versionFile = Join-Path $hoi4Path "launcher-settings.json"
    if (Test-Path $versionFile) {
        try {
            $versionInfo = Get-Content $versionFile | ConvertFrom-Json
            Write-Host "  ✓ HOI4 installed at: $hoi4Path" -ForegroundColor Green
            Write-Host "  Version: $($versionInfo.rawVersion)" -ForegroundColor Gray
        } catch {
            Write-Host "  ⚠ Version file exists but cannot be parsed" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  ⚠ HOI4 found but version info missing" -ForegroundColor Yellow
    }
} else {
    Write-Host "  ✗ HOI4 not found in default location" -ForegroundColor Red
}

# Check 2: Dependencies (FIXED VERSION)
Write-Host "`n[2/5] Checking system dependencies..." -ForegroundColor Yellow

function Test-DirectX {
    Test-Path "C:\Windows\System32\d3d11.dll" -ErrorAction SilentlyContinue
}

function Test-VCRedist {
    $paths = @(
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
    )
    foreach ($path in $paths) {
        if (Test-Path $path) {
            $items = Get-ItemProperty $path -ErrorAction SilentlyContinue
            if ($items.DisplayName -like "*Visual C++*2015-2022*") {
                return $true
            }
        }
    }
    return $false
}

function Test-DotNet {
    $dotNetPath = "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full"
    if (Test-Path $dotNetPath) {
        $netInfo = Get-ItemProperty $dotNetPath -ErrorAction SilentlyContinue
        if ($netInfo -and $netInfo.Release -ge 528040) {
            return $true
        }
    }
    return $false
}

# Run dependency checks
if (Test-DirectX) {
    Write-Host "  ✓ DirectX" -ForegroundColor Green
} else {
    Write-Host "  ✗ DirectX (missing or outdated)" -ForegroundColor Red
}

if (Test-VCRedist) {
    Write-Host "  ✓ Visual C++ 2015-2022" -ForegroundColor Green
} else {
    Write-Host "  ✗ Visual C++ 2015-2022 (missing)" -ForegroundColor Red
}

if (Test-DotNet) {
    Write-Host "  ✓ .NET Framework 4.8+" -ForegroundColor Green
} else {
    Write-Host "  ✗ .NET Framework 4.8+ (missing)" -ForegroundColor Red
}

# Check 3: File Permissions
Write-Host "`n[3/5] Checking file permissions..." -ForegroundColor Yellow
$parDocsPath = "$env:USERPROFILE\Documents\Paradox Interactive"
if (Test-Path $parDocsPath) {
    try {
        $acl = Get-Acl $parDocsPath -ErrorAction Stop
        $access = $acl.Access | Where-Object { $_.IdentityReference -like "*$env:USERNAME*" }
        if ($access.FileSystemRights -match "FullControl") {
            Write-Host "  ✓ Full permissions on Paradox folders" -ForegroundColor Green
        } else {
            Write-Host "  ⚠ Limited permissions detected" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "  ⚠ Cannot check permissions: $_" -ForegroundColor Yellow
    }
} else {
    Write-Host "  ℹ Paradox folder not found, will be created on first run" -ForegroundColor Gray
}

# Check 4: Windows Defender Exclusions (UPDATED FOR WINDOWS 11)
Write-Host "`n[4/5] Checking Windows Defender exclusions..." -ForegroundColor Yellow
$defenderPaths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths",
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Exclusions\Paths"
)

$exclusionFound = $false
foreach ($defenderPath in $defenderPaths) {
    if (Test-Path $defenderPath) {
        try {
            $props = Get-ItemProperty -Path $defenderPath -ErrorAction SilentlyContinue
            if ($props) {
                $propNames = $props.PSObject.Properties.Name
                foreach ($prop in $propNames) {
                    if ($props.$prop -like "*Hearts of Iron IV*") {
                        $exclusionFound = $true
                        break
                    }
                }
            }
        } catch {
            # Continue to next path
        }
    }
}

if ($exclusionFound) {
    Write-Host "  ✓ HOI4 paths excluded from Defender" -ForegroundColor Green
} else {
    Write-Host "  ℹ No Defender exclusions found for HOI4 (recommended but not required)" -ForegroundColor Gray
}

# Check 5: Game Files Integrity
Write-Host "`n[5/5] Verifying critical game files..." -ForegroundColor Yellow
if (Test-Path $hoi4Path) {
    $criticalFiles = @(
        "hoi4.exe",
        "d3d11.dll",
        "bgfx.dll",
        "launcher-settings.json"
    )

    foreach ($file in $criticalFiles) {
        $fullPath = Join-Path $hoi4Path $file
        if (Test-Path $fullPath) {
            $size = (Get-Item $fullPath).Length / 1MB
            Write-Host "  ✓ $file ($([math]::Round($size,2)) MB)" -ForegroundColor Green
        } else {
            Write-Host "  ✗ $file (missing)" -ForegroundColor Red
        }
    }
} else {
    Write-Host "  ✗ Cannot check files - HOI4 path not found" -ForegroundColor Red
}

Write-Host "`n=== Verification Complete ===" -ForegroundColor Cyan
Write-Host "Summary:" -ForegroundColor Yellow
Write-Host "- Run Steam 'Verify Integrity of Game Files' if issues found" -ForegroundColor Gray
Write-Host "- Reinstall dependencies if marked as missing" -ForegroundColor Gray
Write-Host "- Check Windows Event Viewer for detailed errors" -ForegroundColor Gray
Write-Host "- Note: Windows Defender exclusions are optional but recommended" -ForegroundColor Gray

Write-Host "`nPress any key to exit..." -ForegroundColor Gray
try {
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
} catch {
    # If ReadKey fails (e.g., in non-interactive shell), just exit
    Write-Host "`nScript completed." -ForegroundColor Gray
}
