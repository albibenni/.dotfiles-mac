#!/usr/bin/env bash

# Link the version-controlled Codex instructions into the global Codex config.
# Existing files are preserved as timestamped backups before they are replaced.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
SOURCE_FILE="$DOTFILES_DIR/agent/.codex/AGENTS.md"
TARGET_DIR="$HOME/.codex"
TARGET_FILE="$TARGET_DIR/AGENTS.md"

if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "Error: source instructions not found: $SOURCE_FILE" >&2
    exit 1
fi

mkdir -p "$TARGET_DIR"

if [[ -L "$TARGET_FILE" && "$TARGET_FILE" -ef "$SOURCE_FILE" ]]; then
    echo "Codex instructions are already linked: $TARGET_FILE"
    exit 0
fi

if [[ -d "$TARGET_FILE" && ! -L "$TARGET_FILE" ]]; then
    echo "Error: expected a file, but found a directory: $TARGET_FILE" >&2
    exit 1
fi

if [[ -e "$TARGET_FILE" || -L "$TARGET_FILE" ]]; then
    BACKUP_FILE="$TARGET_FILE.backup.$(date +%Y%m%d%H%M%S)"
    mv "$TARGET_FILE" "$BACKUP_FILE"
    echo "Backed up existing instructions to: $BACKUP_FILE"
fi

ln -s "$SOURCE_FILE" "$TARGET_FILE"
echo "Linked Codex instructions: $TARGET_FILE -> $SOURCE_FILE"
