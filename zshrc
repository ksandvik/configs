
# PROMPT
PROMPT="%F{green}%~ %# %F{yellow}"
preexec () { echo -ne "\e[0m" }

# KEY BINDINGS
bindkey '\eOH'  beginning-of-line
bindkey '\eOF'  end-of-line

# WORK
export PATH=$PATH:~/wbin

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

function rr () {
	rustc $1.rs && ./$1
}

# EDITORS
alias e=nvim
alias c=code
export EDITOR=nvim
export PAGER=bat

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


# START FISH!
fish

source /Users/ksandvik/Library/Preferences/org.dystroy.broot/launcher/bash/br
