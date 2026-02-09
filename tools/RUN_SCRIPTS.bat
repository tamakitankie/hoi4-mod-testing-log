@echo off
title HOI4 Bug Testing Tools Launcher
color 0F
echo ========================================
echo    HOI4 1.17.3 Bug Testing Tools
echo ========================================
echo.
echo Please select an option:
echo.
echo [1] Verify Installation (Check dependencies)
echo [2] Run Cache Cleaner (Python - requires Python 3.6+)
echo [3] Open Scripts Documentation
echo [4] Open GitHub Repository
echo [5] Exit
echo.
set /p choice="Enter choice (1-5): "

if "%choice%"=="1" (
    call verify_install.bat
    goto :menu
)

if "%choice%"=="2" (
    echo.
    echo [*] Starting HOI4 Nuclear Cache Cleaner...
    echo     Requires Python 3.6 or higher
    echo.
    python --version >nul 2>&1
    if %errorLevel% neq 0 (
        echo [X] Python not found!
        echo     Please install Python 3.6+ from python.org
        echo.
        pause
    ) else (
        python hoi4_nuke.py
    )
    goto :menu
)

if "%choice%"=="3" (
    start notepad SCRIPTS_README.md
    goto :menu
)

if "%choice%"=="4" (
    start https://github.com/tamakitankie/hoi4-mod-testing-log
    goto :menu
)

if "%choice%"=="5" (
    exit /b 0
)

echo.
echo [X] Invalid choice. Please try again.
pause
goto :menu

:menu
echo.
echo ========================================
echo    Returning to main menu...
echo ========================================
timeout /t 2 >nul
call RUN_SCRIPTS.bat
