# MAC RELATED CONFIGS

# HOMEBREW
eval "$(/opt/homebrew/bin/brew shellenv)"
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"


# Additional Mac paths
export PATH=~/bin:/usr/local/bin:$PATH:.:/opt/local/bin:/opt/bin

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# EMACS
PATH=/Users/ksandvik/.emacs.d/bin:$PATH

function updateBrew {
	brew update && brew upgrade && brew cleanup
}

# Search using Spotlight
alias saf="open /Applications/Safari.app"

# Spotify
function fg {
	mdfind -onlyin . "$1"
}

function fn {
	mdfind -onlyin . -name "$1"
}

# Open man pages with preview
function psman { man -t $@ | open -f -a Preview; }

# If automjump is installed via brew
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
