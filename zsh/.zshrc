echo "Hello Benni"

alias cdd="cd ~/.dotfiles/"
alias pn=pnpm
alias vim=nvim
alias python=python3
alias gloo="git --no-pager log --oneline --decorate"
alias vid="nvim ~/.dotfiles/"
alias vimvim="nvim ~/.dotfiles/nvim/.config/nvim/"
alias vish="nvim ~/.dotfiles/zsh/.zshrc"
alias vimux="nvim ~/.dotfiles/tmux/.config/tmux/tmux.conf"
alias vimaero="nvim ~/.dotfiles/aerospace/.config/aerospace/aerospace.toml"


export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=amuse

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

plugins=(git zsh-autosuggestions)

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

