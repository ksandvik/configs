# ENVIROMENT

# GLOBAL
set -gx TERM xterm-256color
set -gx fish_term24bit 1.
set -gx EDITOR code

set -gx FZF_DEFAULT_COMMAND rg --files
set -gx FZF_DEFAULT_OPTS -m --height 50% --border --layout=reverse

# COLORS
set fish_color_autosuggestion green

# PATHS
set -gx MODULAR_HOME /Users/ksandvik/.modular

# Set Local PATHS
set -gx PATH /opt/homebrew/bin /opt/homebrew/opt/ruby/bin /Users/ksandvik/ksbin $PATH

# Various dirs
set -gx DHARMANOTES ~/ic/__dharma/Dharmanotes/

## PER DEV UNIT
if [ -f $HOME/.localdev.fish ]
    source $HOME/.localdev.fish
end

# FILE SYSTEM
abbr l 'eza -Tlahmo -L1 --no-permissions --total-size --no-user --git'
abbr lt 'eza -l -g -r --color=always --sort=modified | sed 10q'
abbr ct 'cd  "$(\ls -1dt ./* | head -n 1)"'
abbr cz 'cd (fd -t directory | fzf)'
abbr vz '$EDITOR (fd -t file | fzf)'

# PHP
abbr -a pa php artisan

# OTHERS
abbr -a v vim
abbr -a lvim '~/.local/bin/lvim'
abbr -a e 'zed'
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
abbr -a f 'open "$(fzf)"'
abbr -a fo 'fortune'
abbr -a configure-fish 'vim $HOME/code/configs/config.fish'
abbr -a zz 'clear; task list'
abbr -a q 'task end.after:today completed ; task list'
abbr -a saf 'open /Applications/Safari.app'
abbr -a rd 'random-markdown-file.py ddn'
abbr -a ra 'random-markdown-file.py'
abbr -a filesize 'du -hcd2 .'
abbr -a j 'just'
abbr -a b bat

# GIT
abbr -a gd 'git diff'
abbr -a g git
abbr -a gc 'git commit -am'
abbr -a gp 'git push'
abbr -a gg 'git pull --rebase'
abbr -a gf 'git diff --color-words=.'
abbr -a gs 'git status -s'
abbr -a gr 'git checkout'

abbr -a gll 'git log --pretty=format:"%ad - %s" --date=short --name-only | more'
abbr -a gcl 'git clean -df'
abbr -a gitlog 'git log --graph --decorate --pretty=oneline --abbrev-commit'
abbr -a gitlocation 'git config --get remote.origin.url'

set -g __fish_git_prompt_showdirtystate true
set -g __fish_git_prompt_showuntrackedfiles true
set -g __fish_git_prompt_showstashstate true
set -g __fish_git_prompt_color green
set -g __fish_git_prompt_color_flags red


function gl
    git log --name-only --pretty=format:"%ad - %s" --date=short | awk '
    BEGIN { print_next = 0 }
    /^[0-9]{4}-[0-9]{2}-[0-9]{2}/ {
      commit = $0
      print_next = 1
      next
    }
    print_next == 1 && NF == 1 {
      split(commit, parts, " - ")
      print parts[1] " - " $0 " - " parts[2]
      print_next = 0
      next
    }
    ' | more
end

# GOLANG
set -gx GITGET_ROOT ~/ic/Programming/Go/src
set -U fish_user_paths /usr/local/go/bin $fish_user_paths

# JAI
set -U fish_user_paths ~/jai/bin $fish_user_paths


# MOJO
# set -gx MODULAR_HOME /Users/ksandvik/.modular
# set -gx PATH ~/.modular/pkg/packages.modular.com_mojo/bin $PATH

# PYTHON
# abbr -a venvcreate 'python3 -m venv .venv'
# abbr -a venvin 'source .venv/bin/activate.fish'
# abbr -a venvout 'deactivate'

# disable right side conda state, remove if you want it back.
# set -g CONDA_LEFT_PROMPT 1

# TASKWARRIOR
abbr -a ta task add
abbr -a t task
abbr -a td task done
abbr -a tl task log
abbr -a tday 'task end.after:today completed'
abbr -a tweek 'task end.after:today-1wk completed'
abbr -a tmonth 'task end.after:today-4wk completed'
abbr -a tyear 'task end.after:today-52wk completed'
abbr -a ttom 'task waiting | rg (date -v+1d +%Y-%m-%d)'
abbr -a tb 'task waiting'
abbr -a tui 'taskwarrior-tui'
abbr -a tdata 'task history.weekly && task history.monthly'

function trev
    task $$argv[1] mod status:pending
end

# ZOXIDE
/opt/homebrew/bin/zoxide init fish | source

# DIRENV HOOK
# direnv hook fish | source

# 1AND1
abbr -a 1and1 ssh 'u35697510@home92371126.1and1-data.host'

# MISC PRIVATE
abbr -a ksdictwords ' ls /Volumes/Work/TibWorkspace/KSDict/ | wc -l'
set -gx KSNOTES /Users/ksandvik/ic/KSNotes


# fish prompt
function fish_prompt
    echo " "
   #set_color darkblue
    set_color -b black
    echo -n '📁'
    set_color yellow
    echo -n (pwd)
    echo -n ''
    set_color yellow
    set_color --bold
   # ~/ksbin/ttr.py
    print_task_data
   # print_minutes
    print_out_date
    set_color normal
    echo ""

    printf '└'
	 set_color red
    printf '%s' (hostname | cut -d . -f 1)
    printf '🐠'
	 set_color normal

    set_color green

    printf '%s' (__fish_git_prompt)
    echo -n '➤ '
    set_color normal
    echo -n ' '
    echo ""
end

function print_out_date
    set_color magenta
    set_color -b black
    set_color --bold
    echo -n '['
    echo -n (date '+%T')
    echo -n ']'
    set_color normal
end

function print_task_data
    set_color green
    set_color -b black
    set_color --bold
    printf ' [T:%d|' (task status:completed count)
    printf '%d]' (task status:completed end.after:today count)
    set_color -b normal
end

function print_minutes
	set_color white
	set_color -b black
	printf ' [%s] ' (minutesuntil)
	set_color -b normal
end

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

# z to dir and open it with code
function zo
    z $argv
    $EDITOR .
end

# NOTES
# search through all notes for entries - note rg dependency
function no
    rg --heading -i -C 4 -N -I $argv  ~/notes
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

# git commit and push at the same time
function gi
    git commit -am "$argv" && git push --quiet
end

# jai compile and autorun
function jr
    jai "$argv" -plug Autorun
end


# log annotator
function lag
    for file in $argv
        log-annotator -format=html -log=$file -filter > $file.html
        echo "Generated HTML for $file"
    end
end

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end

abbr --add dotdot --regex '^\.\.+$' --function multicd


# fish
# fzf --fish | source
