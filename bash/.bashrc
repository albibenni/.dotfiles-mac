# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

#NOTE: Enable bash completion
if [[ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]]; then
    source /opt/homebrew/etc/profile.d/bash_completion.sh
fi

# NOTE: SHELL
if [ -f ~/.config/bash/shell.sh ]; then
    source ~/.config/bash/shell.sh
fi

# NOTE: ENVS (must be before init to set PATH and XDG_CONFIG_HOME)
if [ -f ~/.config/bash/bash_envs.sh ]; then
    source ~/.config/bash/bash_envs.sh
fi

# NOTE: alias
if [ -f ~/.config/bash/bash_alias.sh ]; then
    source ~/.config/bash/bash_alias.sh
fi

# NOTE: init
if [ -f ~/.config/bash/bash_init.sh ]; then
    source ~/.config/bash/bash_init.sh
fi

# NOTE: source scripts
PERSONAL=$XDG_CONFIG_HOME/personal
# scripts functions auto sourced
for i in $(find -L $PERSONAL -type f); do
    source $i
done

addToPathFront $HOME/.config/scripts
addToPathFront $HOME/.local/bin
addToPathFront $HOME/.local/share/bin

# NOTE: bind from set
[[ $- == *i* ]] && bind -f ~/.config/bash/inputrc

# NOTE: BINDS
# Ctrl+s to reload bashrc
if [ -f ~/.config/bash/bash_bind.sh ]; then
    source ~/.config/bash/bash_bind.sh
fi

#NOTE: Enable fzf key bindings and fuzzy completion
if [ -f /opt/homebrew/opt/fzf/shell/completion.bash ]; then
    source /opt/homebrew/opt/fzf/shell/completion.bash
fi
if [ -f /opt/homebrew/opt/fzf/shell/key-bindings.bash ]; then
    source /opt/homebrew/opt/fzf/shell/key-bindings.bash
fi

# Load kubectl completion for bash (only if kubectl is installed)
if command -v kubectl &>/dev/null; then
    source <(kubectl completion bash)
    complete -o default -F __start_kubectl k
fi

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

echo "Hello $USER"
# neofetch

# Disable terminal flow control (Ctrl+s/Ctrl+q) so we can use Ctrl+s
[[ -t 0 ]] && stty -ixon

# pnpm
export PNPM_HOME="/Users/benni/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
