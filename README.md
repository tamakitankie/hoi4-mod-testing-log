# HOI4 Mod Testing Log

**Tracking HOI4 1.17.3 Graphics Override Engine Bugs**

## 🐛 Current Issue
HOI4 1.17.3 loads mods but ignores ALL visual overrides (colors, portraits, graphics).

## 📊 Test Results

| Test Date | Test Type | Expected Result | Actual Result | Status |
|-----------|-----------|-----------------|---------------|--------|
| 2026-02-09 | Color Override | Germany = Red | Germany = Black | ❌ FAIL |
| 2026-02-09 | Vanilla File Edit | Germany = Red | Germany = Black | ❌ FAIL |
| 2026-02-09 | Portrait Override | Hitler → Churchill | No Change | ❌ FAIL |

## 🔧 System Information
- **OS:** Windows 11 Pro (fresh install)
- **HOI4 Version:** 1.17.3
- **Issue:** Graphics override pipeline broken
- **Evidence:** [Link to Paradox Forum Post](#)

## 📁 Repository Structure
```text
hoi4-mod-testing-log/
├── index.html                    # Main website
├── README.md                     # This file
├── docs/                         # Documentation
│   ├── bug-report.md
│   ├── test-methodology.md
│   └── system-specs.md
├── test-mods/                    # Test mods
│   ├── TESTCOLOR/
│   │   ├── TESTCOLOR.mod
│   │   └── common/countries/colors.txt
│   ├── TESTPORTRAIT/
│   │   ├── TESTPORTRAIT.mod
│   │   └── gfx/leaders/portraits.txt
│   └── TESTVANILLA/
│       └── vanilla_changes.txt
├── game-logs/                    # HOI4 logs
│   ├── error.log
│   ├── game.log
│   └── setup.log
├── scripts/                      # Tools
│   ├── clear_cache.ps1
│   ├── create_test_mod.ps1
│   └── verify_install.ps1
├── screenshots/                  # Evidence
│   ├── germany_black.png
│   ├── vanilla_edit_fail.png
│   └── paradox_launcher.png
├── evidence/                     # System info
│   ├── dxdiag.txt
│   ├── windows_info.txt
│   └── fresh_install_proof.txt
└── archive/                      # Old tests
    ├── test_2026-02-08.md
    └── test_2026-02-09.md
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
