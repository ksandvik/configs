# ENVIROMENT
## GLOBAL

set -gx TERM xterm-256color
set -gx fish_term24bit 1.
set -gx EDITOR code
set -gx FZF_DEFAULT_OPTS --height 40% --layout=reverse --border
set -gx BAT_THEME Dracula
set -gx MODULAR_HOME /Users/ksandvik/.modular

## PER DEV UNIT
if [ -f $HOME/.localdev.fish ]
    source $HOME/.localdev.fish
end

# FILE SYSTEM
abbr l 'eza -l -g --icons'
abbr lt 'eza -l -g --icons -r --color=always --sort=modified'
abbr ct 'cd  "$(\ls -1dt ./* | head -n 1)"'
abbr cz 'cd (fd -t directory | fzf)'
abbr vz '$EDITOR (fd -t file | fzf)'

# PHP
abbr -a pa php artisan


# OTHERS
abbr -a v nvim
abbr -a lvim '~/.local/bin/lvim'
abbr -a e 'emacs --insecure'
abbr -a c clear
abbr -a k 'code .'
abbr -a m make
abbr -a mi 'make install'
abbr -a mr 'make run'
abbr -a el 'ls -tt | sed 1q | xargs $EDITOR'
abbr -a today 'date '+%Y-%m-%d''
abbr -a ri 'rg -i '
abbr -a ytaudio 'youtube-dl -x --audio-format mp3 --prefer-ffmpeg "'
abbr -a pretty 'npx prettier -l --cache --write . | grep -v cached'
abbr -a p python3
abbr -a ze 'zellij -l ~/code/configs/zellij/kslayout.kdl'
abbr -a f 'open "$(fzf)"'
abbr -a fo 'fortune'
abbr -a configure-fish 'zed $HOME/code/configs/config.fish'
abbr -a cl 'clear; task list'

# GIT
abbr -a gd 'git diff'
abbr -a g git
abbr -a gc 'git commit -am'
abbr -a gp 'git push'
abbr -a gg 'git pull --rebase'
abbr -a gf 'git diff --color-words=.'
abbr -a gs 'git status'
abbr -a gr 'git reset HEAD'
abbr -a gcl 'git clean -df'
abbr -a gitlog 'git log --graph --decorate --pretty=oneline --abbrev-commit'
abbr -a gitlocation 'git config --get remote.origin.url'

# Python
abbr -a venvcreate 'python3 -m venv .venv'
abbr -a venvin 'source .venv/bin/activate.fish'
abbr -a venvout 'deactivate'

# GO
set -U fish_user_paths /usr/local/go/bin $fish_user_paths

# TASKWARRIOR
abbr -a ta task add
abbr -a tl task list
abbr -a td task done
abbr -a twday 'task end.after:today completed'
abbr -a twweek 'task end.after:today-1wk completed'
abbr -a twmonth 'task end.after:today-4wk completed'
abbr -a twyear 'task end.after:today-52wk completed'


# fish prompt
function fish_prompt
    echo " "
   #set_color darkblue
    set_color -b black
    echo -n '📁 :'
    set_color blue
    echo -n (pwd)
    echo -n ' '
    # set_color magenta
    # echo -n (date +%T)
    # echo -n '  '
    set_color yellow
   ~/ksbin/ttr.py
    set_color normal
    echo ""
    #set_color purple
    #set_color -b yellow
    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
    end
    printf '└──'
    printf '[%d]' (task status:completed count)
    printf ' %s@' (hostname | cut -d . -f 1)

    #set_color yellow
    #set_color -b 7f3

    set_color green
    printf '%s' (__fish_git_prompt)
    echo -n ' ➤'
    set_color normal
    echo -n ' '
    echo ""
end

function fish_right_prompt -d "Write out the right prompt"
    set_color magenta
    echo -n [
    date '+%T'
    echo -n ]
     set_color normal
end


# fish title for the prompt
# function fish_title
#     switch $_
#         case fish
#             echo (pwd)
#         case vim
#             if test -d .git
#                 echo vim \((basename $PWD)\)
#             else
#                 echo vim
#             end
#         case '*'
#             echo $_
#     end
# end

# Read environment variables
function posix-source
    for i in (cat $argv)
        set arr (echo $i |tr = \n)
        set -gx $arr[1] $arr[2]
    end
end

# Type d to move up to top parent dir which is a repository
function dgit
    while test $PWD != /
        if test -d .git
            break
        end
        cd ..
    end
    pwd
end

# make dir and cd into it
function mkcd
    mkdir $argv
    cd $argv
end

# cd to dir and code open it
function cdcode
    cd $argv
    code .
end

# NOTES
# search through all notes for entries - note rg dependency
function no
    rg --heading -i -C 4 -N -I $argv  ~/notes
end

# Only search rust notes
function rn
    rg $argv -I -L -C 3 -N ~/notes/ksnotes/rust/
end

# Edit rust notes
function rne
    $EDITOR ~/notes/ksnotes/rust/
end

# Convert Fahrenheit to Celcius
function f2c
    set -l fahrenheit $argv[1]
    set -l celsius (math "($fahrenheit - 32) * 5 / 9")
    echo $celsius
end

# show info about the functions I have addded to config.fish
function fishfunctions
    rg '^function' -B 1 -N ~/.config/fish/config.fish
end


function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

# Python venv

function __auto_source_venv --on-variable PWD --description "Activate/Deactivate virtualenv on directory change"
  status --is-command-substitution; and return

  # Check if we are inside a git directory
  if git rev-parse --show-toplevel &>/dev/null
    set gitdir (realpath (git rev-parse --show-toplevel))
    set cwd (pwd)
    # While we are still inside the git directory, find the closest
    # virtualenv starting from the current directory.
    while string match "$gitdir*" "$cwd" &>/dev/null
      if test -e "$cwd/.venv/bin/activate.fish"
        source "$cwd/.venv/bin/activate.fish" &>/dev/null
        return
      else
        set cwd (path dirname "$cwd")
      end
    end
  end
  # If virtualenv activated but we are not in a git directory, deactivate.
  if test -n "$VIRTUAL_ENV"
    deactivate
  end
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/Caskroom/miniconda/base/bin" $PATH
    end
end
# <<< conda initialize <<<

# fish
# fzf --fish | source
