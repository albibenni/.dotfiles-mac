#!/usr/bin/env bash

set -e

BASH_PATH=$(which bash)

echo "Found bash at: $BASH_PATH"

# Check if bash is already in /etc/shells
if grep -qxF "$BASH_PATH" /etc/shells; then
    echo "✓ $BASH_PATH is already in /etc/shells"
else
    echo "Adding $BASH_PATH to /etc/shells (requires sudo)..."
    echo "$BASH_PATH" | sudo tee -a /etc/shells > /dev/null
    echo "✓ Added $BASH_PATH to /etc/shells"
fi

# Change the default shell
echo "Changing default shell to $BASH_PATH..."
chsh -s "$BASH_PATH"

echo "✓ Shell changed successfully!"
echo "Please restart your terminal for changes to take effect."
