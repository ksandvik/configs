# ENVIROMENT
## GLOBAL

set -gx TERM xterm-256color
set -gx fish_term24bit 1.
set -gx EDITOR code
set -gx FZF_DEFAULT_OPTS --height 40% --layout=reverse --border
set -gx BAT_THEME Dracula

# PATHS

set -gx MODULAR_HOME /Users/ksandvik/.modular

# Set Local PATHS
set -gx PATH /opt/homebrew/bin /opt/homebrew/opt/ruby/bin  $PATH

# Various dirs
set -gx DHARMANOTES ~/ic/__dharma/Dharmanotes/

## PER DEV UNIT
if [ -f $HOME/.localdev.fish ]
    source $HOME/.localdev.fish
end

# FILE SYSTEM
abbr l 'eza -Tlahmo -L1 --no-permissions --total-size --no-user --git'
abbr ls 'eza'
abbr lt 'eza -l -g -r --color=always --sort=modified | sed 10q'
abbr ct 'cd  "$(\ls -1dt ./* | head -n 1)"'
abbr cz 'cd (fd -t directory | fzf)'
abbr vz '$EDITOR (fd -t file | fzf)'

# PHP
abbr -a pa php artisan

# OTHERS
abbr -a v nvim
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
abbr -a ze 'zellij -l ~/code/configs/zellij/kslayout.kdl'
abbr -a f 'open "$(fzf)"'
abbr -a fo 'fortune'
abbr -a configure-fish 'zed $HOME/code/configs/config.fish'
abbr -a zz 'clear; task list'
abbr -a q 'task end.after:today completed ; task list'
abbr -a saf 'open /Applications/Safari.app'
abbr -a rd 'random-markdown-file.py ddn'
abbr -a ra 'random-markdown-file.py'
abbr -a filesize 'du -hcd2 .'


# GIT
abbr -a gd 'git diff'
abbr -a g git
abbr -a gc 'git commit -am'
abbr -a gp 'git push'
abbr -a gg 'git pull --rebase'
abbr -a gf 'git diff --color-words=.'
abbr -a gs 'git status'
abbr -a gr 'git reset'
abbr -a gl 'git log --pretty=format:"%ad - %s" --date=short | more'
abbr -a gcl 'git clean -df'
abbr -a gitlog 'git log --graph --decorate --pretty=oneline --abbrev-commit'
abbr -a gitlocation 'git config --get remote.origin.url'

# GOLANG
set -gx GITGET_ROOT ~/ic/Programming/Go/src
set -U fish_user_paths /usr/local/go/bin $fish_user_paths

# JAI

# MOJO
set -gx MODULAR_HOME /Users/ksandvik/.modular
set -gx PATH ~/.modular/pkg/packages.modular.com_mojo/bin $PATH

# PYTHON
abbr -a venvcreate 'python3 -m venv .venv'
abbr -a venvin 'source .venv/bin/activate.fish'
abbr -a venvout 'deactivate'

# disable right side conda state, remove if you want it back.
set -g CONDA_LEFT_PROMPT 1

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

# ZOXIDE
/opt/homebrew/bin/zoxide init fish | source

# DIRENV HOOK
# direnv hook fish | source

# 1AND1
abbr -a 1and1 ssh 'u35697510@home92371126.1and1-data.host'
abbr -a aws ssh 'ksandvik@10.228.210.60'

# MISC PRIVATE
abbr -a ksdictwords ' ls /Volumes/Work/TibWorkspace/KSDict/ | wc -l'
set -gx KSNOTES /Users/ksandvik/ic/KSNotes

# Prompt settings

set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "informative"

set __fish_git_prompt_color_branch magenta --bold
set __fish_git_prompt_color_dirtystate white
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

set __fish_git_prompt_char_cleanstate '👍'
set __fish_git_prompt_char_conflictedstate '⚠️'
set __fish_git_prompt_char_dirtystate '💩'
set __fish_git_prompt_char_invalidstate '🤮'
set __fish_git_prompt_char_stagedstate '🚥'
set __fish_git_prompt_char_stashstate '📦'
set __fish_git_prompt_char_stateseparator '|'
set __fish_git_prompt_char_untrackedfiles '🔍'
set __fish_git_prompt_char_upstream_ahead '☝️'
set __fish_git_prompt_char_upstream_behind '👇'
set __fish_git_prompt_char_upstream_diverged '🚧'
set __fish_git_prompt_char_upstream_equal '💯'

# fish prompt
function fish_prompt
    echo " "
   #set_color darkblue
    set_color -b black
    echo -n '📁'
    set_color blue
    echo -n (pwd)
    echo -n ''

    set_color yellow
    set_color --bold
   # ~/ksbin/ttr.py
	#  print_quote
  #  print_task_data
    print_out_date
    set_color normal
    echo ""

    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
    end
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
    echo -n '] '
    set_color normal
end

function print_task_data
    set_color green
    set_color -b black
    set_color --bold
    printf '[T:%d|' (task status:completed count)
    printf '%d]' (task status:completed end.after:today count)
    set_color -b normal
end

function print_quote
	set_color blue
	set_color white
	printf '%s' (fortune rumi)
	set_color -b normal
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

# log annotator
function lag
	 log-annotator -format=html -log=$argv[1] -filter > $argv[1].html
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

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/ksandvik/.lmstudio/bin
