SD=~/Documents/Code/scripts/zsh

source "$SD/alias.zsh"
source "$SD/ex.zsh"

# Save History
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
HISTSIZE=1000000000
SAVEHIST=1000000000
HISTFILE=~/.zsh_history

# Path
export PATH="$HOME/.cargo/bin:$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/:$HOME/.bin/:$PATH"

# Cursor
export XCURSOR_THEME=Catppuccin-Dark-Cursors

# Starship Promt
eval $(starship init zsh)

# ZSH auto-suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# gpg tty
export GPG_TTY=$(tty)
