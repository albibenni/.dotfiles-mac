#!/usr/bin/env bash

set -e

BASH_PATH="/opt/homebrew/bin/bash"

# Check if Homebrew bash exists
if [[ ! -f "$BASH_PATH" ]]; then
    echo "Error: Homebrew bash not found at $BASH_PATH"
    echo "Please install it with: brew install bash"
    exit 1
fi

echo "Using Homebrew bash at: $BASH_PATH"
echo "Version: $($BASH_PATH --version | head -1)"

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
