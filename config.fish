# GENERAL
abbr l 'exa -l'

abbr -a c cargo
abbr -a e nvim
abbr -a c clear
abbr -a m make
abbr -a mi 'make install'

# GIT
abbr -a gd 'git diff'
abbr -a g git

# AUTOJUMP
begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end


function fish_prompt
	set_color black
	echo -n "["(date "+%y-%m-%d")"] "
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color black
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '~> '
	set_color normal
end


