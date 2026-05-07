# Install script for opencode-config (Windows PowerShell)
# Creates symlinks or copies from this repo to AppData opencode config

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ConfigDir = Join-Path $env:APPDATA "opencode"

Write-Host "Installing opencode config..."
Write-Host "  Source: $ScriptDir"
Write-Host "  Target: $ConfigDir"

# Create target if needed
if (-not (Test-Path $ConfigDir)) {
    New-Item -ItemType Directory -Path $ConfigDir | Out-Null
}

$folders = @("commands", "skills", "rules")

foreach ($folder in $folders) {
    $source = Join-Path $ScriptDir $folder
    $target = Join-Path $ConfigDir $folder

    if (Test-Path $source) {
        if (Test-Path $target) {
            $backup = "${target}.bak"
            Write-Host "  Backing up existing $folder/ to ${folder}.bak/"
            if (Test-Path $backup) { Remove-Item -Recurse -Force $backup }
            Rename-Item $target $backup
        }

        # Try symlink first (requires admin or dev mode)
        try {
            New-Item -ItemType SymbolicLink -Path $target -Target $source | Out-Null
            Write-Host "  Linked: $folder/"
        } catch {
            # Fallback: copy
            Copy-Item -Recurse $source $target
            Write-Host "  Copied: $folder/ (symlink failed, used copy)"
        }
    }
}

Write-Host "Done!"
