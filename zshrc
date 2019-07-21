
# PROMPT
PROMPT="%F{green}%~ %# %F{yellow}"
preexec () { echo -ne "\e[0m" }

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# EDITORS
alias v=nvim
alias c=code
export EDITOR=nvim

# GENERAL COMMANDS
alias c=clear
alias t=telnet
alias cat=bat

# This assumes EXA is installed
alias l='exa'
alias ll='exa -l'

# GIT
alias gl='clear; echo "GIT log -> ..."; git log --pretty=oneline -3 HEAD'
alias gc='clear; echo "GIT commit -> ..."; git commit -am $1'
alias gp='clear; echo "GIT push -> ..."; git push origin master'
alias gd='clear; echo "GIT diff -> ..."; git diff'
alias grev='clear; echo "GIT revert -> ..."; git checkout -f '

# UTILITY FUNCTIONS
alias filesizes='du -hcd2 .'

# LOAD VARIOUS SEPARATE ZSH SETTINGS IF FILE EXISTS
[ -f ~/.zsh/mac.zsh ] && source ~/.zsh/mac.zsh
[ -f ~/.zsh/work.zsh ] && source ~/.zsh/work.zsh
[ -f ~/.zsh/fzf.zsh ] && source ~/.zsh/mac-ssd.zsh
[ -f ~/.zsh/fzf.zsh ] && source ~/.zsh/fzf.zsh
