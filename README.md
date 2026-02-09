# HOI4 Mod Testing Log

**Tracking HOI4 1.17.3 Graphics Override Engine Bugs**

## 🐛 Current Status

**2026-02-11:** Bug scope narrowed - **portrait/texture overrides broken** while color overrides function.

### Test Results Summary:
- ✅ **Color Overrides**: Working (Germany→Red, UK→Green confirmed)
- ❌ **Portrait Overrides (New System)**: Broken (1.17.3 `gfx/leaders/` system)
- ❌ **Portrait Overrides (Old System)**: Broken (`common/characters/` system)

### Implications:
- Graphics pipeline is **partially functional**
- Bug specific to **texture/sprite rendering subsystem**
- Affects **both old and new portrait systems** in 1.17.3
  
## 📊 Test Results

| Test Date | Test Type | Expected Result | Actual Result | Status |
|-----------|-----------|-----------------|---------------|--------|
| 2026-02-09 | Color Override | Germany = Red | Germany = Black | ❌ FAIL |
| 2026-02-09 | Vanilla File Edit | Germany = Red | Germany = Black | ❌ FAIL |
| 2026-02-09 | Portrait Override | Portrait Change | No Change | ❌ FAIL |
| 2026-02-10 | System Fresh Install | Clean Windows 11 | Fresh HOI4 1.17.3 | ✅ PASS |
| 2026-02-10 | Dependencies Check | All dependencies | All installed | ✅ PASS |
| 2026-02-10 | File Encoding | UTF-8 without BOM | Correct encoding | ✅ PASS |
| 2026-02-10 | **Color Override** | Germany = Red | **Germany = Red** | ✅ **PASS** |
| 2026-02-10 | **Portrait (New System)** | Custom DDS portrait | Vanilla portrait | ❌ FAIL |
| 2026-02-10 | **Portrait (Old System)** | Custom DDS portrait | Vanilla portrait | ❌ FAIL |


## 🔧 System Information
- **OS:** Windows 11 Pro (fresh install)
- **HOI4 Version:** 1.17.3
- **Issue:** Graphics override pipeline broken
- **Evidence:** [Link to Paradox Forum Post](https://forum.paradoxplaza.com/forum/threads/color-portrait-overrides-fail-to-apply-despite-correct-mod-loading.1900441/#post-31104797)

## 📁 Repository Structure
```text
hoi4-mod-testing-log/
├── 📁 documentation/
│   ├── SCRIPTS_README.md
│   ├── system-specs.md
│   └── test-methodology.md
├── 📁 website/
│   └── index.html
├── 📁 tools/
│   ├── RUN_SCRIPTS.bat
│   ├── hoi4_nuke.py
│   ├── verify_install.bat
│   └── verify_install.ps1
├── 📁 screenshots/
│   ├── COLOR_MAP_OVERVIEW.jpg
│   ├── PORTRAIT_NEW_GER.jpg
│   ├── PORTRAIT_NEW_LAUNCHER.png
│   ├── PORTRAIT_NEW_UK.jpg
│   ├── PORTRAIT_OLD_GER.jpg
│   ├── PORTRAIT_OLD_LAUNCHER.png
│   ├── PORTRAIT_OLD_UK.jpg
│   └── color_test_launcher_enabled.png
├── 📁 logs/
│   ├── 📄 README.md              
│   └── 📁 game_logs/             
├── 📁 test-mods/
│   ├── 📁 COLOR_TEST/
│   │   ├── descriptor.mod
│   │   ├── COLOR_TEST.mod
│   │   └── common/countries/colors.txt
│   ├── 📁 PORTRAIT_NEW/
│   │   ├── descriptor.mod
│   │   ├── PORTRAIT_NEW.mod
│   │   └── gfx/leaders/portraits.txt
│   └── 📁 PORTRAIT_OLD/
│       ├── descriptor.mod
│       ├── PORTRAIT_OLD.mod
│       ├── common/characters/ger.txt
│       ├── common/characters/eng.txt
│       └── gfx/leaders/portraits.txt
└── 📁 assets/
    ├── dxdiag.txt
    ├── windows_info.txt
    └── fresh_install_proof.txt
```
## 🔧 Troubleshooting Performed
- ✅ Complete Windows 11 fresh install
- ✅ HOI4 fresh Steam install  
- ✅ All dependencies installed
- ✅ File permissions fixed
- ✅ Cache cleared (nuclear options)
- ✅ Both portrait systems tested
- ✅ Correct file encoding verified

## 🎯 Conclusion

**This is a confirmed texture/portrait rendering engine bug in HOI4 1.17.3.**

### What Works:
- ✅ Mod loading and parsing
- ✅ Colour override system (`common/countries/colors.txt`)

### What's Broken:
- ❌ New 1.17.3 portrait system (`gfx/leaders/portraits.txt`)
- ❌ Old portrait system (`common/characters/`)
- ❌ Texture/sprite rendering pipeline

### Bug Scope Refinement:
| System | Status | Implication |
|--------|--------|-------------|
| **Color Overrides** | ✅ Functional | Graphics pipeline partially works |
| **Portrait Overrides** | ❌ Completely Broken | Texture rendering subsystem broken |
| **File Reading** | ✅ Functional | Game reads mods correctly |

This bug affects **all portrait and texture overrides** while sparing color overrides, indicating a specific failure in HOI4 1.17.3's texture rendering engine.

## 🔗 Links
- Paradox Bug Report: [Forum link](https://forum.paradoxplaza.com/forum/threads/color-portrait-overrides-fail-to-apply-despite-correct-mod-loading.1900441/#post-31104797)
- Game Logs: Documents/Paradox Interactive/Hearts of Iron IV/logs/
- Testing Dashboard: [Setup in Progress - View `index.html`]
- Full Evidence: [GitHub Repository](https://github.com/tamakitankie/hoi4-mod-testing-log)

---
Last Updated: 2026-02-10
Bug affects ALL visual modding in HOI4 1.17.3
