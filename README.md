# opencode-config

Shared OpenCode commands, skills, and rules synced across devices.

## Install

**Linux / macOS:**
```bash
git clone git@github.com:<your-user>/opencode-config.git ~/.opencode-config
cd ~/.opencode-config
chmod +x install.sh
./install.sh
```

**Windows (PowerShell):**
```powershell
git clone git@github.com:<your-user>/opencode-config.git "$env:USERPROFILE\.opencode-config"
cd "$env:USERPROFILE\.opencode-config"
.\install.ps1
```

## Structure

```
commands/       # Custom slash commands (/fix-issue, etc.)
skills/         # Agent skills (placeholder for future use)
rules/          # Custom rules
install.sh      # Linux/macOS installer
install.ps1     # Windows installer
```

## Adding new commands

Drop a `.md` file in `commands/`, commit, push, and run `install.sh` on your other devices (or just `git pull` if symlinks are already set up).
