import os
import shutil
import glob

# Color codes for Windows terminal
class Colors:
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    BOLD = '\033[1m'
    END = '\033[0m'

def clear_path(path):
    """Delete a file or folder with error handling"""
    try:
        if os.path.exists(path):
            if os.path.isfile(path):
                os.remove(path)
                print(f"{Colors.GREEN}✓{Colors.END} Deleted file: {os.path.basename(path)}")
            else:
                shutil.rmtree(path)
                print(f"{Colors.GREEN}✓{Colors.END} Deleted folder: {os.path.basename(path)}")
        else:
            print(f"{Colors.BLUE}•{Colors.END} Not found: {os.path.basename(path)}")
    except PermissionError:
        print(f"{Colors.YELLOW}⚠{Colors.END} Permission denied: {os.path.basename(path)} (close HOI4/Launcher)")
    except Exception as e:
        print(f"{Colors.RED}✗{Colors.END} Failed: {os.path.basename(path)} - {e}")

# ASCII Banner
print(f"""
{Colors.BOLD}{Colors.BLUE}
╔══════════════════════════════════════════╗
║         HOI4 NUCLEAR CLEANUP             ║
║           Version: 1.1.0                 ║
╚══════════════════════════════════════════╝
{Colors.END}
""")

# Safety check
print(f"{Colors.YELLOW}This will delete HOI4 cache files. Continue? (y/n): {Colors.END}", end="")
response = input().lower()
if response != 'y':
    print(f"{Colors.RED}Operation cancelled.{Colors.END}")
    exit(0)

# =========================
# PATH CONFIGURATION
# =========================
paths = [
    # Game cache
    os.path.expandvars(r"%USERPROFILE%\Documents\Paradox Interactive\Hearts of Iron IV\cache"),
    
    # Generated game files
    os.path.expandvars(r"%USERPROFILE%\Documents\Paradox Interactive\Hearts of Iron IV\common\countries.txt"),
    os.path.expandvars(r"%USERPROFILE%\Documents\Paradox Interactive\Hearts of Iron IV\common\character_templates.txt"),
    
    # Game settings
    os.path.expandvars(r"%USERPROFILE%\Documents\Paradox Interactive\Hearts of Iron IV\dlc_load.json"),
    os.path.expandvars(r"%USERPROFILE%\Documents\Paradox Interactive\Hearts of Iron IV\game_data.json"),
    os.path.expandvars(r"%USERPROFILE%\Documents\Paradox Interactive\Hearts of Iron IV\pdx_settings.json"),
    
    # Launcher cache
    os.path.expandvars(r"%LOCALAPPDATA%\Paradox Interactive\launcher-v2\cache"),
    os.path.expandvars(r"%LOCALAPPDATA%\Paradox Interactive\launcher-v2\downloads"),
    os.path.expandvars(r"%LOCALAPPDATA%\Paradox Interactive\launcher-v2\logs"),
    
    # Launcher databases (causes "requires elevation" error)
    os.path.expandvars(r"%USERPROFILE%\Documents\Paradox Interactive\Hearts of Iron IV\Launcher-v2.sqlite"),
    os.path.expandvars(r"%LOCALAPPDATA%\Paradox Interactive\launcher-v2\*.sqlite"),
    os.path.expandvars(r"%LOCALAPPDATA%\Paradox Interactive\launcher-v2\*.db"),
    
    # Graphics cache
    os.path.expandvars(r"%LOCALAPPDATA%\Paradox Interactive\Hearts of Iron IV\shadercache"),
    os.path.expandvars(r"%LOCALAPPDATA%\AMD\DxCache"),
    os.path.expandvars(r"%LOCALAPPDATA%\NVIDIA\DXCache"),
    os.path.expandvars(r"%LOCALAPPDATA%\NVIDIA Corporation\NV_Cache"),
    
    # Browser cache (Paradox Launcher uses Chromium)
    os.path.expandvars(r"%LOCALAPPDATA%\Paradox Interactive\launcher-v2\CefCache"),
    os.path.expandvars(r"%LOCALAPPDATA%\Paradox Interactive\launcher-v2\GPUCache"),
    os.path.expandvars(r"%LOCALAPPDATA%\Paradox Interactive\launcher-v2\Local Storage"),
    
    # Windows compatibility cache
    os.path.expandvars(r"%LOCALAPPDATA%\Microsoft\Windows\INetCache"),
    os.path.expandvars(r"%LOCALAPPDATA%\Microsoft\Windows\IECompatCache"),
    os.path.expandvars(r"%LOCALAPPDATA%\Microsoft\Windows\IECompatUaCache"),
]

# =========================
# CLEANUP PROCESS
# =========================

# Phase 1: Temporary game files
print(f"\n{Colors.YELLOW}[1/4] Clearing temporary game files...{Colors.END}")
hoi4_docs = os.path.expandvars(r"%USERPROFILE%\Documents\Paradox Interactive\Hearts of Iron IV")
if os.path.exists(hoi4_docs):
    for item in os.listdir(hoi4_docs):
        if item.endswith(('.cache', '.log', '.tmp')):
            clear_path(os.path.join(hoi4_docs, item))

# Phase 2: Launcher databases
print(f"\n{Colors.YELLOW}[2/4] Clearing launcher databases...{Colors.END}")
launcher_folder = os.path.expandvars(r"%LOCALAPPDATA%\Paradox Interactive\launcher-v2")
if os.path.exists(launcher_folder):
    for root, dirs, files in os.walk(launcher_folder):
        for file in files:
            if file.endswith(('.sqlite', '.db', '.log')):
                clear_path(os.path.join(root, file))

# Phase 3: Configured paths
print(f"\n{Colors.YELLOW}[3/4] Clearing configured cache paths...{Colors.END}")
for path in paths:
    clear_path(path)

# Phase 4: Pattern-based cleanup
print(f"\n{Colors.YELLOW}[4/4] Final pattern cleanup...{Colors.END}")
patterns = [
    os.path.expandvars(r"%USERPROFILE%\Documents\Paradox Interactive\*.cache"),
    os.path.expandvars(r"%USERPROFILE%\Documents\Paradox Interactive\*.log"),
    os.path.expandvars(r"%USERPROFILE%\Documents\Paradox Interactive\Hearts of Iron IV\*.cache"),
    os.path.expandvars(r"%USERPROFILE%\Documents\Paradox Interactive\Hearts of Iron IV\*.log"),
]

for pattern in patterns:
    for file_path in glob.glob(pattern):
        clear_path(file_path)

# =========================
# COMPLETION
# =========================
print(f"""
{Colors.BOLD}{Colors.GREEN}
╔══════════════════════════════════════════╗
║     NUCLEAR CLEANUP COMPLETE!            ║
╚══════════════════════════════════════════╝
{Colors.END}
{Colors.BOLD}Next Steps:{Colors.END}
1. {Colors.YELLOW}Restart your computer{Colors.END} (critical for file locks)
2. Launch HOI4 through Steam (not as Administrator)
3. Paradox Launcher will recreate fresh databases

{Colors.BLUE}Note: Mods in Documents folder are preserved.{Colors.END}
""")

input(f"{Colors.BLUE}Press Enter to exit...{Colors.END}")
