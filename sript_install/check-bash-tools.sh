#!/usr/bin/env bash

tools=(
    "nvim"
    "pnpm"
    "python3"
    "git"
    "eza"
    "fzf"
    "bat"
    "zoxide"
    "mise"
    "starship"
    "kubectl"
    "gh"
    "tmux"
)

echo "Checking installed tools from bash configuration..."
echo "===================================================="
echo ""

installed=()
missing=()

for tool in "${tools[@]}"; do
    if command -v "$tool" &>/dev/null; then
        version=$(command -v "$tool")
        echo "✓ $tool - $version"
        installed+=("$tool")
    else
        echo "✗ $tool - NOT FOUND"
        missing+=("$tool")
    fi
done

# Special check for bash-completion@2 (it's a library, not a command)
if [[ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]]; then
    echo "✓ bash-completion@2 - /opt/homebrew/etc/profile.d/bash_completion.sh"
    installed+=("bash-completion@2")
else
    echo "✗ bash-completion@2 - NOT FOUND"
    missing+=("bash-completion@2")
fi

echo ""
echo "===================================================="
total=$((${#installed[@]} + ${#missing[@]}))
echo "Summary:"
echo "Installed: ${#installed[@]}/$total"
echo "Missing: ${#missing[@]}/$total"

if [ ${#missing[@]} -gt 0 ]; then
    echo ""
    echo "Missing tools (install with brew):"
    printf '  - %s\n' "${missing[@]}"
    echo ""
    echo "Install all missing tools:"
    echo "  brew install ${missing[*]}"
fi
