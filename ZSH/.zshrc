SD=~/Documents/Code/Scripts

source "$SD/alias.zsh"
source "$SD/ex.zsh"

# Save History
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
HISTSIZE=1000000000
SAVEHIST=1000000000
HISTFILE=~/.zsh_history

# Starship Promt
eval $(starship init zsh)

# ZSH auto-suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
