# Testing Methodology

## Testing Philosophy
This bug report follows scientific testing principles: reproducible, systematic, and documented.

## Test Categories

### 1. Graphics Override Tests
**Objective:** Verify visual changes (colors, portraits) apply correctly

**Tests Performed:**
- Color override via mod
- Color override via vanilla file edit
- Portrait override (old system: common/leaders/)
- Portrait override (new 1.17.3 system: gfx/leaders/portraits.txt)

### 2. System Integrity Tests
**Objective:** Verify system configuration is correct

**Tests Performed:**
- DirectX dependency verification
- File encoding validation (UTF-8 without BOM, Unix LF)
- File permission checks
- Cache clearing procedures

### 3. Control Tests
**Objective:** Verify baseline functionality works

**Tests Performed:**
- Mod loading verification (via syntax errors)
- Game launch and basic functionality
- Save/load operations

## Test Procedure
1. **Setup:** Clear all caches, fresh game restart
2. **Execution:** Apply single test case
3. **Verification:** Check in-game results, take screenshots
4. **Documentation:** Record results with timestamps
5. **Reset:** Clear caches, repeat for next test

## Tools Used
- Custom PowerShell scripts for cache clearing
- Notepad++ for file encoding verification
- GitHub for version control and documentation
- Windows Event Viewer for system logs

## Quality Assurance
- Each test repeated minimum 3 times
- Cross-verified by different methods when possible
- Screenshot evidence for all visual tests
- System logs captured for each test session
