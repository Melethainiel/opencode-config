# opencode-config

Shared OpenCode commands, skills, and rules synced across devices.

## Install

**Linux / macOS:**
```bash
git clone git@github.com:Melethainiel/opencode-config.git ~/.opencode-config && ~/.opencode-config/install.sh
```

**Windows (PowerShell):**
```powershell
git clone git@github.com:Melethainiel/opencode-config.git "$env:USERPROFILE\.opencode-config"
& "$env:USERPROFILE\.opencode-config\install.ps1"
```

**Update (all platforms):**
```bash
cd ~/.opencode-config && git pull
```
Symlinks are already in place, so a pull is all you need.

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
