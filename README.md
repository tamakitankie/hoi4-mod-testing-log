# HOI4 Mod Testing Log

**Tracking HOI4 1.17.3 Graphics Override Engine Bugs**

## 🐛🔄 Current Status Update
**2026-02-10:** Initial testing reveals color overrides FUNCTION correctly.
- ✅ Country color overrides work
- 🔄 Portrait overrides testing in progress
- 🔄 Bug scope narrowed to potentially portrait/texture systems only

## 📊 Test Results

| Test Date | Test Type | Expected Result | Actual Result | Status |
|-----------|-----------|-----------------|---------------|--------|
| 2026-02-09 | Color Override | Germany = Red | Germany = Black | ❌ FAIL |
| 2026-02-09 | Vanilla File Edit | Germany = Red | Germany = Black | ❌ FAIL |
| 2026-02-09 | Portrait Override | H1tl3r → Churchill | No Change | ❌ FAIL |

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
│   └── game_logs/
├── 📁 test-cases/
│   ├── 📁 test-mods/
│   │   ├── 📁 COLOR_TEST/
│   │   │   ├── descriptor.mod
│   │   │   ├── COLOR_TEST.mod
│   │   │   └── common/countries/colors.txt
│   │   ├── 📁 PORTRAIT_NEW/
│   │   │   ├── descriptor.mod
│   │   │   ├── PORTRAIT_NEW.mod
│   │   │   └── gfx/leaders/portraits.txt
│   │   └── 📁 PORTRAIT_OLD/
│   │       ├── descriptor.mod
│   │       ├── PORTRAIT_OLD.mod
│   │       ├── common/characters/ger.txt
│   │       ├── common/characters/eng.txt
│   │       └── gfx/leaders/portraits.txt
│   └── 📁 test-configs/
│       └── colors_test.txt
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
This is a **CONFIRMED engine-level bug** in HOI4 1.17.3.  
Game reads mods but fails to apply visual overrides.

## 🔗 Links
- Paradox Bug Report: [Forum link](https://forum.paradoxplaza.com/forum/threads/color-portrait-overrides-fail-to-apply-despite-correct-mod-loading.1900441/#post-31104797)
- Game Logs: Documents/Paradox Interactive/Hearts of Iron IV/logs/
- Testing Dashboard: [Setup in Progress - View `index.html`]
- Full Evidence: [GitHub Repository](https://github.com/tamakitankie/hoi4-mod-testing-log)

---
Last Updated: 2026-02-10
Bug affects ALL visual modding in HOI4 1.17.3
