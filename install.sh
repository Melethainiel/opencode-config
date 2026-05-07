#!/usr/bin/env bash
# opencode-config installer
# Usage: curl -fsSL https://raw.githubusercontent.com/Melethainiel/opencode-config/master/install.sh | bash
# Or:    ~/.opencode-config/install.sh

set -euo pipefail

REPO="git@github.com:Melethainiel/opencode-config.git"
REPO_HTTPS="https://github.com/Melethainiel/opencode-config.git"
INSTALL_DIR="${OPENCODE_CONFIG_DIR:-$HOME/.opencode-config}"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"

# --- Clone or update repo if running from curl pipe ---
if [ ! -f "$INSTALL_DIR/install.sh" ]; then
  echo "Cloning opencode-config..."
  git clone "$REPO" "$INSTALL_DIR" 2>/dev/null || git clone "$REPO_HTTPS" "$INSTALL_DIR"
elif [ -d "$INSTALL_DIR/.git" ]; then
  echo "Updating opencode-config..."
  git -C "$INSTALL_DIR" pull --ff-only 2>/dev/null || true
fi

# --- Create symlinks ---
echo "Installing to $CONFIG_DIR ..."
mkdir -p "$CONFIG_DIR"

for folder in commands skills rules; do
  src="$INSTALL_DIR/$folder"
  dest="$CONFIG_DIR/$folder"

  [ -d "$src" ] || continue

  if [ -L "$dest" ]; then
    rm "$dest"
  elif [ -d "$dest" ]; then
    echo "  Backing up $folder/ -> ${folder}.bak/"
    rm -rf "$dest.bak"
    mv "$dest" "$dest.bak"
  fi

  ln -sf "$src" "$dest"
  echo "  Linked: $folder/"
done

echo "Done! Commands available in OpenCode."
