VIM="nvim"

export XDG_CONFIG_HOME=$HOME/.config
export TERMINAL=ghostty
export VISUAL='nvim'
export EDITOR='nvim'
export MANPAGER='nvim +Man!'

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export SUDO_EDITOR="$EDITOR"

export CC="clang"
export CXX="clang++"
export GOPATH=$HOME/go
export GIT_EDITOR=$VIM
export N_PREFIX="$HOME/.local/n"
export DOTFILES=$HOME/dotfiles

## FZF customization
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
# Make Tab trigger fzf completion directly (without needing ** prefix)
export FZF_COMPLETION_TRIGGER=''

# lua5.1
export PATH=~/.local/bin/:$PATH
export PATH=$HOME/.cargo/bin:$PATH

export PATH="$N_PREFIX/bin:$PATH"

addToPathFront $HOME/.config/scripts
addToPathFront $HOME/.local/bin
addToPathFront $HOME/.local/share/bin

# addToPathFront $HOME/go/bin

# NOTE: from omarchy
# Editor used by CLI
export SUDO_EDITOR="$EDITOR"
export BAT_THEME=ansi

