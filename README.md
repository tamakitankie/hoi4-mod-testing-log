# HOI4 1.17.3 Graphics Override Bug Documentation

**Critical engine bug in Hearts of Iron IV 1.17.3**

## [!] Core Issue
HOI4 1.17.3 loads mods but IGNORES visual overrides.

- [OK] Reads and parses mod files correctly
- [OK] Shows mods as enabled in launcher
- [FAIL] Does NOT apply visual changes (colors, portraits)
- [FAIL] Even direct edits to vanilla files are ignored

## [i] System Information
- OS: Windows 11 Pro (fresh install)
- HOI4 Version: 1.17.3
- Game Build: Steam version
- Testing Date: 2026-02-09

## Test Results
| Test Type | Expected | Actual | Status |
|-----------|----------|--------|--------|
| Color Override | Red Germany | Black Germany | [FAIL] |
| Portrait Override | Changed | No Change | [FAIL] |
| Vanilla Edit | Should work | Ignored | [FAIL] |
| Mod Loading | Syntax errors | Errors appear | [OK] |

## Repository Structure
hoi4-mod-testing-log/
|-- README.md
|-- index.html
|-- test-methodology.md
|-- system-specs.md
|-- clear_cache.ps1
|-- verify_install.ps1
|-- error.log
|-- screenshots/
| |-- color_override_fail.png
| +-- portrait_fail.png
+-- test-mods/
+-- TESTPORTRAIT/
|-- descriptor.mod
+-- TESTPORTRAIT.mod


## [TOOL] Troubleshooting Performed
- [OK] Complete Windows 11 fresh install
- [OK] HOI4 fresh Steam install
- [OK] File permissions fixed
- [OK] Cache cleared multiple ways
- [OK] Both portrait systems tested

## Conclusion
This is a CONFIRMED engine-level bug in HOI4 1.17.3.

## Links
- Paradox Bug Report: [forum link]
- Game Logs: Documents/Paradox Interactive/Hearts of Iron IV/logs/

---
Last Updated: 2026-02-10
Bug affects all HOI4 modding in version 1.17.3
