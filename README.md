# opencode-config

Shared OpenCode commands, skills, and rules synced across devices.

## Install

**Linux / macOS (one-liner):**
```bash
curl -fsSL https://raw.githubusercontent.com/Melethainiel/opencode-config/master/install.sh | bash
```

**Windows (PowerShell):**
```powershell
git clone git@github.com:Melethainiel/opencode-config.git "$env:USERPROFILE\.opencode-config"
& "$env:USERPROFILE\.opencode-config\install.ps1"
```

**Update:**
```bash
curl -fsSL https://raw.githubusercontent.com/Melethainiel/opencode-config/master/install.sh | bash
```
Re-running the installer pulls the latest and re-links.

## Structure

```
commands/       # Custom slash commands (/fix-issue, etc.)
skills/         # Agent skills (placeholder for future use)
rules/          # Custom rules
install.sh      # Linux/macOS installer
install.ps1     # Windows installer
```

## Adding new commands

Drop a `.md` file in `commands/`, commit, push. Other devices just need `git pull`.
