
# PROMPT
PROMPT="%F{green}%~ %# %F{yellow}"
preexec () { echo -ne "\e[0m" }

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# EDITORS
alias v=vim
alias c=code
export EDITOR=vim

# GENERAL COMMANDS
alias c=clear
alias t=telnet

# This assumes EXA is installed
alias l='exa'
alias ll='exa -l'

# GIT
alias gl='clear; git log --pretty=oneline -3 HEAD'
alias gc='clear; git commit -am $1'
alias gp='clear; git push origin master'
alias gd='clear; git diff'
alias grev='echo "REVERT GIT Changes..."; git checkout -f '

# UTILITY FUNCTIONS
alias filesizes='du -hcd2 .'

# LOAD VARIOUS SEPARATE ZSH SETTINGS IF FILE EXISTS
[ -f ~/.zsh/mac.zsh ] && source ~/.zsh/mac.zsh
[ -f ~/.zsh/work.zsh ] && source ~/.zsh/work.zsh
[ -f ~/.zsh/fzf.zsh ] && source ~/.zsh/fzf.zsh

