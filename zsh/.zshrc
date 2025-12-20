echo "Hello $USER"
neofetch

# Fix TERM for tmux - don't override if already inside tmux
if [ -n "$TMUX" ]; then
  export TERM=tmux-256color
fi

## VIM / NVIM
alias vim=nvim

alias less="nvim -R -c 'set ft=man' -"

alias cdd="cd ~/dotfiles/"
alias pn=pnpm
alias python=python3
alias glool="git --no-pager log --oneline --decorate --graph"
alias gloo="git --no-pager log -n 30 --oneline --decorate --graph"
alias vid="nvim ~/dotfiles/"
alias vimvim="nvim ~/dotfiles/nvim/.config/nvim/"
alias vish="nvim ~/dotfiles/zsh/.zshrc"
alias vimux="nvim ~/dotfiles/tmux/.config/tmux/tmux.conf"
alias vimaero="nvim ~/dotfiles/aerospace/.config/aerospace/aerospace.toml"

# pomodoro timer aliases for rust_can_make_you_focus app
alias pomocode="sudo ~/dotfiles/scripts/scripts/rust_can_make_you_focus coding"
alias pomocodeyt="sudo ~/dotfiles/scripts/scripts/rust_can_make_you_focus coding_yt"
alias pomoall="sudo ~/dotfiles/scripts/scripts/rust_can_make_you_focus coding"
alias pomostudy="sudo ~/dotfiles/scripts/scripts/rust_can_make_you_focus studying"
alias pomostudyyt="sudo ~/dotfiles/scripts/scripts/rust_can_make_you_focus studying_yt"

# kubectl
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgpw="kubectl get pods -o wide"

# linux commands on macOS
alias watch="~/dotfiles/scripts/scripts/watch.sh"


# # Enable zsh completion system (if not already enabled)
autoload -Uz compinit
compinit

 # Load kubectl completion for zsh (only if kubectl is installed)
if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
  # Note: 'complete' is bash-specific, using zsh style completion instead
  compdef k=kubectl
fi


###

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=amuse

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8


plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

DISABLE_MAGIC_FUNCTIONS=true
source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile

# pnpm
export PNPM_HOME="/Users/benni/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# bun completions
[ -s "/Users/benni/.bun/_bun" ] && source "/Users/benni/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm@12/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/benni/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/benni/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/benni/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/benni/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Created by `pipx` on 2024-08-26 15:27:03
export PATH="$PATH:/Users/benni/Library/Python/3.12/bin"


# Added by Windsurf
export PATH="/Users/benni/.codeium/windsurf/bin:$PATH"

eval "$(zoxide init zsh)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/benni/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
