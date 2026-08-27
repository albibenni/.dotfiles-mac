#!/usr/bin/env bash
#
# macOS Setup Script
# Automatically installs dependencies, apps, and links dotfiles.
# Excludes skhd and yabai as requested.
#

set -e

# ==========================================
# 1. Install Homebrew
# ==========================================
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for the current session (Apple Silicon default)
    if [[ -d /opt/homebrew/bin ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "🍺 Homebrew is already installed. Updating..."
    brew update
fi

# ==========================================
# 2. Install Packages & Casks
# ==========================================
echo "📦 Installing packages via Homebrew..."

PACKAGES=(
    # Core system tools & shell
    bash
    bash-completion@2
    stow
    
    # Developer tools & languages
    git
    git-lfs
    git-delta
    lazygit
    gh
    cmake
    llvm
    gnu-sed
    bun
    pnpm
    yarn
    pipx
    mise
    
    # CLI Utilities
    neovim
    tmux
    starship
    zoxide
    fzf
    ripgrep
    fd
    bat
    eza
    neofetch
    tealdeer
    tldr
    tree-sitter-cli
    luarocks
    jq
    gnupg
    thezoraiz/ascii-image-converter/ascii-image-converter
    
    # K8s (if needed)
    kubectl
    k9s
    helm
    minikube
)

CASKS=(
    ghostty
    iterm2
    nikitabobko/tap/aerospace
    font-jetbrains-mono-nerd-font
    monitorcontrol
)

for pkg in "${PACKAGES[@]}"; do
    if ! brew list "$pkg" &>/dev/null; then
        brew install "$pkg"
    else
        echo "   $pkg already installed"
    fi
done

for cask in "${CASKS[@]}"; do
    cask_name=$(basename "$cask")
    if ! brew list --cask "$cask_name" &>/dev/null; then
        brew install --cask "$cask"
    else
        echo "   $cask_name already installed"
    fi
done

# Optionally install swiftborders
if ! brew list albibenni/swiftborders/swiftborders &>/dev/null; then
    brew install albibenni/swiftborders/swiftborders
fi

# ==========================================
# 3. Setup Mise (Global Languages)
# ==========================================
echo "🛠️ Setting up global languages with mise..."
if command -v mise &> /dev/null; then
    mise use -g node@lts
    mise use -g python@latest
    mise use -g go@latest
    mise use -g java@latest
    mise use -g golangci-lint@latest
    mise use -g maven@latest
    echo "✅ Global versions of Node, Python, Go, Java, and tools installed via mise."
else
    echo "⚠️ mise is not installed. Skipping language setup."
fi

# ==========================================
# 4. Setup Rust (via rustup)
# ==========================================
echo "🦀 Setting up Rust..."
if ! command -v cargo &> /dev/null; then
    echo "Installing Rust via rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
else
    echo "✅ Rust is already installed. Updating..."
    rustup update
fi

# ==========================================
# 4. Set Default Shell to Homebrew Bash
# ==========================================
BASH_PATH="/opt/homebrew/bin/bash"

if [[ -f "$BASH_PATH" ]]; then
    echo "🐚 Setting up Homebrew Bash..."
    
    if ! grep -qxF "$BASH_PATH" /etc/shells; then
        echo "   Adding $BASH_PATH to /etc/shells (requires sudo)..."
        echo "$BASH_PATH" | sudo tee -a /etc/shells > /dev/null
    fi

    if [[ "$SHELL" != "$BASH_PATH" ]]; then
        echo "   Changing default shell to $BASH_PATH..."
        chsh -s "$BASH_PATH"
    fi
else
    echo "⚠️  Homebrew bash not found at $BASH_PATH"
fi

# ==========================================
# 5. Setup Tmux Plugin Manager (TPM)
# ==========================================
echo "📟 Setting up Tmux Plugin Manager..."
if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
    mkdir -p "$HOME/.config/tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi

# ==========================================
# 6. Initialize Git Submodules in dotfiles
# ==========================================
echo "🔄 Initializing dotfiles submodules..."
DOTFILES_DIR="$HOME/dotfiles"
if [ -d "$DOTFILES_DIR" ]; then
    cd "$DOTFILES_DIR"
    git submodule update --init --recursive
else
    echo "⚠️  dotfiles directory not found at $DOTFILES_DIR. Please clone it first!"
    exit 1
fi

# ==========================================
# 7. Stow Dotfiles
# ==========================================
echo "🔗 Symlinking dotfiles using Stow..."
cd "$DOTFILES_DIR"

# Folders to completely ignore
IGNORE_FOLDERS=("skhd" "yabai" "doNotStow" ".git" ".github" "scripts")

# Helper function to check if an array contains an element
containsElement() {
    local e match="$1"
    shift
    for e; do [[ "$e" == "$match" ]] && return 0; done
    return 1
}

for folder in */; do
    # Remove trailing slash
    folder_name=${folder%/}
    
    if containsElement "$folder_name" "${IGNORE_FOLDERS[@]}"; then
        echo "   Skipping ignored folder: $folder_name"
        continue
    fi
    
    # Run stow for the directory
    echo "   Stowing $folder_name..."
    stow -t "$HOME" "$folder_name" --adopt
done

# Reset modified files to their git state if --adopt caused unintended changes
git checkout .

echo "✅ Setup complete! Restart your terminal or source your shell config."

# ==========================================
# 8. Setup MCP Configuration (Optional)
# ==========================================
MCP_SCRIPT="$DOTFILES_DIR/sript_install/install_mcp.sh"
if [ -f "$MCP_SCRIPT" ]; then
    echo ""
    echo "🤖 We found your MCP setup script at $MCP_SCRIPT."
    read -p "Do you want to run the MCP setup script now? (y/N): " run_mcp
    if [[ "$run_mcp" =~ ^[Yy]$ ]]; then
        bash "$MCP_SCRIPT"
    else
        echo "Skipping MCP setup. You can run it later manually: bash $MCP_SCRIPT"
    fi
fi
