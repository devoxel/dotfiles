# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

case $- in
*i*) ;;
*) return ;;
esac

# history config
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%d/%m/%y %T "
shopt -s histappend
export HISTFILESIZE=
export HISTSIZE=
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Config that id like to reuse with other posix shells here (aliases/etc)
[ -f "$HOME/.config/apd/posix.sh" ] && source "$HOME/.config/apd/posix.sh" || echo "missing $HOME/.config/apd/posix.sh"
[ -f "$HOME/.config/apd/work.sh" ] && source "$HOME/.config/apd/work.sh"

# Setup  commands
[ -f "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh" && echo "loaded jabba"
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init bash)" && echo "loaded zoxide" || echo "missing zoxide" 
[ -x "$(command -v starship)" ] && eval "$(starship init bash)" && echo "loaded starship"
[ -x "$(command -v fnm)" ] && eval "$(fnm env)" && export PATH="/home/apd/.local/share/fnm:$PATH" && echo "loaded fnm"

# TODO: stop using this nvm
if [ -s "$HOME/.nvm/nvm.sh" ]; then
	export NVM_DIR="$HOME/.nvm"
	. "$NVM_DIR/nvm.sh" 
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
	echo "loaded nvm"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash && echo "loaded fzf"
[ -f "/usr/share/doc/fzf/examples/key-bindings.bash" ] && source /usr/share/doc/fzf/examples/key-bindings.bash
