# HOI4 1.17.3 Graphics Override Bug Documentation

**Critical engine bug in Hearts of Iron IV 1.17.3** - Visual overrides (colors, portraits) fail to apply despite mods loading correctly.

## 🚨 Core Issue
HOI4 1.17.3 loads mods but **completely ignores visual overrides**. The game:
- ✅ Reads and parses mod files correctly
- ✅ Shows mods as enabled in launcher
- ❌ **Fails to apply any visual changes** (colors, portraits, graphics)
- ❌ Even direct edits to vanilla files are ignored

## 📋 System Information
- **OS**: Windows 11 Pro (fresh install)
- **HOI4 Version**: 1.17.3 (confirmed checksum)
- **Game Build**: Steam version
- **Testing Date**: 2026-02-09

## 🔍 Comprehensive Testing Performed

### System-Level Troubleshooting
- ✅ Complete Windows 11 fresh wipe & reinstall
- ✅ Fresh HOI4 install from Steam
- ✅ All dependencies reinstalled (DirectX, VC++, .NET)
- ✅ File permissions fixed (full control to Paradox folders)
- ✅ Windows Defender exclusions added

### Modding-Specific Testing
- ✅ Correct file encoding (UTF-8 without BOM, Unix LF)
- ✅ Both old (common/leaders/) and new portrait systems tested
- ✅ Verified 1.17.3 portrait system structure (gfx/leaders/portraits.txt)
- ✅ Nuclear cache clearing (custom scripts)
- ✅ Mod loading verification (confirmed via syntax errors)

### Test Results
| Test Type | Expected Result | Actual Result | Status |
|-----------|-----------------|---------------|--------|
| Color Override | Germany → Red | Germany → Black | ❌ FAIL |
| Portrait Override | Hitler → Churchill | No change | ❌ FAIL |
| Vanilla File Edit | Direct change applied | Change ignored | ❌ FAIL |
| Mod Loading | Syntax errors shown | Errors appear | ✅ PASS |

## 📁 Repository Structure
hoi4-mod-testing-log/
├── README.md
├── index.html
├── test-methodology.md
├── system-specs.md
├── clear_cache.ps1
├── verify_install.ps1
├── error.log
├── screenshots/
│ ├── color_override_fail.png
│ └── portrait_fail.png
└── test-mods/
└── TESTPORTRAIT/
├── descriptor.mod
└── TESTPORTRAIT.mod

text

## 🛠️ Tools & Scripts Created
- **Cache clearing scripts** (Python/PowerShell)
- **Dependency installer** (DirectX, VC++, .NET)
- **File permission fixer**
- **Mod creation automation**
- **Testing dashboard website**

## 📊 Current Status
- **Bug reported** to [Paradox Forums](https://forum.paradoxplaza.com/) (with full evidence)
- **Awaiting Paradox response**

## 🎯 Key Insight
This is a **HOI4 engine-level bug**, not user error. The graphics override pipeline appears to be broken in version 1.17.3. No user-side fix has been discovered despite exhaustive testing.

## 🔗 Links
- **Paradox Bug Report**: [Forum Post Link](https://forum.paradoxplaza.com/forum/threads/hoi4-1-17-3-graphics-override-engine-bug.1234567/)
- **Live Testing Dashboard**: `https://github.com/tamakitankie/hoi4-mod-testing-log`
- **Game Logs Location**: `Documents\Paradox Interactive\Hearts of Iron IV\logs`
- **Launcher Logs**: `AppData/Local/Paradox Interactive/launcher-v2/logs/`

## 📝 Next Steps
1. Wait for official Paradox response on bug report
2. Update testing log website with developments
3. Document any workarounds if discovered
4. Create automated testing tools for community use

---

*Last Updated: 10-02-26*  
*This repository documents a critical bug affecting all HOI4 modding in version 1.17.3*
