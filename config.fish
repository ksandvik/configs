# ENVIROMENT
## GLOBAL

set -gx TERM xterm-256color
set -gx EDITOR code

## PER DEV UNIT
if [ -f $HOME/.localdev.fish ]
    source $HOME/.localdev.fish
end

# ABBREVIATIONS
abbr l 'exa -l -g --icons'

abbr -a v nvim
abbr -a e 'emacs --insecure'
abbr -a c clear
abbr -a k 'code .'
abbr -a m make
abbr -a mi 'make install'
abbr -a lt 'ls -lt | sed 5q'
abbr -a el 'ls -tt | sed 1q | xargs $EDITOR'
abbr -a today 'date '+%Y-%m-%d''
abbr -a ri 'rg -i '
abbr -a ytaudio 'youtube-dl -x --audio-format mp3 --prefer-ffmpeg "'

# GIT
abbr -a gd 'git diff'
abbr -a g git
abbr -a gc 'git commit -am '
abbr -a gp 'git pull --rebase'
abbr -a gitpulls 'find . -name .git -print -execdir git pull origin master \;'
abbr -a gf 'git diff --color-words=.'
abbr -a gitlog 'git log --graph --decorate --pretty=oneline --abbrev-commit'

# SSH
# Start ssh agent when logging in.
eval (ssh-agent -c)

# GO
set -U fish_user_paths /usr/local/go/bin $fish_user_paths

# AUTOJUMP - Note MAC path
begin
    set --local AUTOJUMP_PATH /usr/local/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

# fish prompt
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

# fish title for the prompt
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
    while test $PWD != /
        if test -d .git
            break
        end
        cd ..
    end
    pwd
end

# search through all notes for entries - note rg dependency
function no
    rg $argv -L -C 3 -N ~/code/notes
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

# concert all txt files to md (Mardown) files
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
    echo  "Done!"
end
