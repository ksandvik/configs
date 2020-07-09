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
abbr -a today 'date '+%Y-%m-%d''

# GIT
abbr -a gd 'git diff'
abbr -a g git
abbr -a gc 'git commit -am '
abbr -a gp 'git push'
abbr -a gitpulls 'find . -name .git -print -execdir git pull origin master \;'

# SSH
# Start ssh agent when logging in.
eval (ssh-agent -c)

# GO
set -U fish_user_paths /usr/local/go/bin $fish_user_paths

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
    set_color -b black
    echo -n ""(date "+%H:%M")"|"
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

function fish_title
    switch $_
        case fish
            echo (prompt_pwd)
        case vim
            if test -d .git
                echo vim \((basename $PWD)\)
            else
                echo vim
            end
        case '*'
            echo $_
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

# search through all notes for entries
function no
    rg $argv -L -C 3 -N ~/code/notes
end
