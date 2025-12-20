if command -v mise &>/dev/null; then
    eval "$(mise activate bash)"
fi

if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
fi

if command -v fzf &>/dev/null; then
    if [[ -f /opt/homebrew/opt/fzf/shell/completion.bash ]]; then
        source /opt/homebrew/opt/fzf/shell/completion.bash
    fi
    if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.bash ]]; then
        source /opt/homebrew/opt/fzf/shell/key-bindings.bash
    fi
fi
