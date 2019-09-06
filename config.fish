# ENVIROMENT
## GLOBAL

set -gx EDITOR nvim

## PER DEV UNIT
if [ -f $HOME/.localdev.fish ]
	source $HOME/.localdev.fish
end

# ABBREVIATIONS
abbr l 'exa -l'

abbr -a c cargo
abbr -a v nvim
abbr -a e 'emacs --insecure'
abbr -a c clear
abbr -a m make
abbr -a mi 'make install'
abbr -a cat bat
abbr -a lt 'exa -l | sed 10q'
abbr -a el 'ls -t | sed 1q | xargs $EDITOR'

# GIT
abbr -a gd 'git diff'
abbr -a g git
abbr -a gc 'git checkout'

# SSH
# Start ssh agent when logging in.
eval (ssh-agent -c)

# AUTOJUMP
begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

function fish_prompt
    set_color yellow
    echo (pwd)
    set_color red
    echo -n ""(date "+%y-%m-%d")"|"
    set_color magenta
    printf '%s@%s|' (whoami) (hostname | cut -d . -f 1)
    if [ $PWD != $HOME ]
        set_color yellow
        echo -n (basename $PWD)
    end
    set_color green
    printf '%s ' (__fish_git_prompt)
    set_color red
    echo -n '~> '
    set_color normal
end

# GIT
# update all git dir and subdir repos.
function gitpull
    echo "update git repos (git pull)..."
    for dir in ./*/
        cd $dir
        git status -sb 2>/dev/null
        if [ $status -eq 0 ]
            set_color red
            echo "Updating $dir…"
            set_color normal
            git stash --quiet
            git pull
            git stash apply --quiet
        end
        cd ..
    end
end

# Read environment Variables
function posix-source
	for i in (cat $argv)
		set arr (echo $i |tr = \n)
  		set -gx $arr[1] $arr[2]
	end
end

# Type d to move up to top parent dir which is a repository
function d
	while test $PWD != "/"
		if test -d .git
			break
		end
		cd ..
	end
    pwd
end

# GIT
# update all git dir and subdir repos.
function gitpull
    echo "update git repos (git pull)..."
    for dir in ./*/
        cd $dir
        git status -sb 2>/dev/null
        if [ $status -eq 0 ]
        set_color red
        echo "Updating $dir…"
        set_color normal
        git stash --quiet
        git pull
        git stash apply --quiet
        end
    cd ..
    end
end

