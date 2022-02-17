SD=~/Documents/Code/Scripts

source "$SD/alias.zsh"
source "$SD/ex.zsh"

# Save History
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
export HISTFILE=~/.zsh_hist
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# Starship Promt
eval "$(starship init zsh)"

# ZSH auto-suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
