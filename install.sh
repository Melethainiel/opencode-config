#!/usr/bin/env bash
# Install script for opencode-config
# Creates symlinks from this repo to ~/.config/opencode/
# Works on Linux, macOS, and Windows (Git Bash/WSL)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"

echo "Installing opencode config..."
echo "  Source: $SCRIPT_DIR"
echo "  Target: $CONFIG_DIR"

# Create target directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Link commands
if [ -d "$SCRIPT_DIR/commands" ]; then
  if [ -L "$CONFIG_DIR/commands" ]; then
    rm "$CONFIG_DIR/commands"
  elif [ -d "$CONFIG_DIR/commands" ]; then
    echo "  Backing up existing commands/ to commands.bak/"
    mv "$CONFIG_DIR/commands" "$CONFIG_DIR/commands.bak"
  fi
  ln -sf "$SCRIPT_DIR/commands" "$CONFIG_DIR/commands"
  echo "  Linked: commands/"
fi

# Link skills
if [ -d "$SCRIPT_DIR/skills" ]; then
  if [ -L "$CONFIG_DIR/skills" ]; then
    rm "$CONFIG_DIR/skills"
  elif [ -d "$CONFIG_DIR/skills" ]; then
    echo "  Backing up existing skills/ to skills.bak/"
    mv "$CONFIG_DIR/skills" "$CONFIG_DIR/skills.bak"
  fi
  ln -sf "$SCRIPT_DIR/skills" "$CONFIG_DIR/skills"
  echo "  Linked: skills/"
fi

# Link rules
if [ -d "$SCRIPT_DIR/rules" ]; then
  if [ -L "$CONFIG_DIR/rules" ]; then
    rm "$CONFIG_DIR/rules"
  elif [ -d "$CONFIG_DIR/rules" ]; then
    echo "  Backing up existing rules/ to rules.bak/"
    mv "$CONFIG_DIR/rules" "$CONFIG_DIR/rules.bak"
  fi
  ln -sf "$SCRIPT_DIR/rules" "$CONFIG_DIR/rules"
  echo "  Linked: rules/"
fi

echo "Done!"
