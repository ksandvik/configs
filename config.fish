# ENVIROMENT
## GLOBAL

set -gx TERM xterm-256color
set -gx fish_term24bit 1.
set -gx EDITOR code
set -gx FZF_DEFAULT_OPTS --height 40% --layout=reverse --border
set -gx BAT_THEME Dracula

## PER DEV UNIT
if [ -f $HOME/.localdev.fish ]
    source $HOME/.localdev.fish
end

# ABBREVIATIONS
abbr l 'exa -l -g --icons'
abbr lt 'exa -l -g --icons -r --color=always --sort=modified'
abbr ct 'cd  "$(\ls -1dt ./*/ | head -n 1)"'
abbr cz 'cd (fd -t directory | fzf)'
abbr vz '$EDITOR (fd -t file | fzf)'

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
abbr -a prettier 'npx prettier --write .'
abbr -a p python3
abbr -a ze 'zellij -l ~/code/configs/zellij/kslayout.kdl'

# GIT
abbr -a gd 'git diff'
abbr -a g git
abbr -a gc 'git commit -am '
abbr -a gp 'git push -q'
abbr -a gg 'git pull'
abbr -a gitpulls "find . -name .git -print -execdir git pull \; | grep -Ev 'Already|remote|Unpacking'"
abbr -a gf 'git diff --color-words=.'
abbr -a gs 'git status'
abbr -a gitlog 'git log --graph --decorate --pretty=oneline --abbrev-commit'
abbr -a gitlocation 'git config --get remote.origin.url'

# Python
abbr -a venvcreate 'python3 -m venv .venv'
abbr -a venvin 'source .venv/bin/activate.fish'
abbr -a venvout 'deactivate'

# GO
set -U fish_user_paths /usr/local/go/bin $fish_user_paths

# TASKWARRIOR
abbr -a tw task
abbr -a twday 'task end.after:today completed'
abbr -a twweek 'task end.after:today-1wk completed'
abbr -a twmonth 'task end.after:today-4wk completed'
abbr -a twyear 'task end.after:today-52wk completed'

# fish prompt
function fish_prompt
    echo " "
    set_color white
    set_color -b blue
    echo -n '📁  '
    echo -n (pwd)
    echo -n '  '
    ~/ksbin/ttr.py
    set_color normal
    echo ""
    set_color purple
    set_color -b yellow
    printf '└── %s@%s' (hostname | cut -d . -f 1)
    set_color yellow
    set_color -b 7f3

    set_color green
    printf '%s' (__fish_git_prompt)
    echo -n '➤ '
    set_color normal
    echo -n ' '
    echo ""
end

# fish title for the prompt
function fish_title
    switch $_
        case fish
            echo (pwd)
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
    rg -i -C 4 -N -I $argv  ~/notes
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
function myfunctions
    rg '^function' -B 1 -N ~/.config/fish/config.fish
end

# concert all rtf files to text in dir and delete the rtf(d) files (MAC)
function convertRTFtoText
    echo "converting RTF to txt...."
    textutil -convert txt *.rtfd
    echo "removing rtf(d) files..."
    rm -rf *.rtfd
    echo "Done!"
end

# concert all txt files to md (Markdown) files
function convertTextToMD
    echo "converting text (.txt) to MD (Markdown)...."
    find . -iname "*.txt" -exec bash -c 'mv "$0" "${0%\.txt}.md"' {} \;
    echo "Done!"
end

# Make a zip archive with today's date including hour and minute
function makeziparchive
    set archiveName $1
    # echo -n "make archive:"" $1-(date +%Y-%m-%d-%H%M) ".zip
    echo "make archive: " $archiveName
    # zip -r $1-(date +%Y-%m-%d-%H%M).zip $1
    echo "Done!"
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
