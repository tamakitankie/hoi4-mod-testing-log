@echo off
title HOI4 Installation Verification
color 0A
echo ========================================
echo    HOI4 Installation Verification Tool
echo ========================================
echo.
echo This tool checks if your HOI4 installation
echo has all required dependencies and files.
echo.
echo Note: Run as Administrator for best results
echo.

:: Get the directory where this batch file is located
set "SCRIPT_DIR=%~dp0"
echo [*] Script directory: %SCRIPT_DIR%
echo.

:: Check if PowerShell script exists
if not exist "%SCRIPT_DIR%verify_install.ps1" (
    echo [X] ERROR: verify_install.ps1 not found!
    echo     Looking for: %SCRIPT_DIR%verify_install.ps1
    echo.
    echo Please ensure:
    echo 1. Both .bat and .ps1 files are in the SAME folder
    echo 2. You haven't renamed verify_install.ps1
    echo.
    pause
    exit /b 1
)

:: Check if running as Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Warning: Not running as Administrator
    echo     Some checks may be limited.
    echo.
)

:: Run the PowerShell script
echo [*] Starting verification...
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%verify_install.ps1"

:: Check if PowerShell script succeeded
if %errorLevel% equ 0 (
    echo.
    echo [✓] Verification completed successfully
) else (
    echo.
    echo [X] Verification encountered errors
    echo     Error code: %errorLevel%
)

echo.
echo ========================================
echo    Press any key to exit...
echo ========================================
pause >nul
