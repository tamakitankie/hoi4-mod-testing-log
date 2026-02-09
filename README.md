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
│   ├── README.md
│   ├── test-methodology.md
│   ├── system-specs.md
│   └── SCRIPTS_README.md
├── 📁 website/
│   └── index.html
├── 📁 tools/
│   ├── verify_install.ps1
│   ├── verify_install.bat
│   ├── RUN_SCRIPTS.bat
│   └── hoi4_nuke.py
├── 📁 evidence/
│   ├── screenshots/
│   │   ├── color_override_fail.png
│   │   ├── portrait_fail.png
│   │   └── vanilla_edit_fail.png
│   └── logs/
│       ├── error.log
│       └── game_logs/
├── 📁 test-cases/
│   ├── test-mods/
│   │   └── TESTPORTRAIT/
│   │       ├── descriptor.mod
│   │       └── TESTPORTRAIT.mod
│   └── test-configs/
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
