if command -v mise &>/dev/null; then
    eval "$(mise activate bash)"
fi

if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
fi

# fnm
if command -v fnm &>/dev/null; then
    eval "$(fnm env --use-on-cd)"
    eval "$(fnm completions --shell bash)"
fi
# INSTALL NODE:

# fnm install --lts
