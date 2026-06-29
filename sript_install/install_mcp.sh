#!/bin/bash

# Dynamically get the directory of this script, then find the dotfiles root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATE_FILE="$DOTFILES_DIR/mcp/.gemini/config/mcp_config.template.json"

TARGET_DIR=~/.gemini/config
TARGET_FILE="$TARGET_DIR/mcp_config.json"

# Check if the template exists
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file not found at $TEMPLATE_FILE"
    echo "Make sure you have renamed your config to mcp_config.template.json in your dotfiles!"
    exit 1
fi

# 1. Prompt the user for the key securely
echo -n "Write key: "
read -s API_KEY
echo ""

# Ensure the destination folder exists
mkdir -p "$TARGET_DIR"

# 2. Copy the template to the right path
cp "$TEMPLATE_FILE" "$TARGET_FILE"

# 3. Inject the key into the copied file
sed -i '' "s/__API_KEY_PLACEHOLDER__/$API_KEY/g" "$TARGET_FILE"

echo "✅ Copied and injected API key to $TARGET_FILE"
