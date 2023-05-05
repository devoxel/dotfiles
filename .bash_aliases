# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# Preferred flags for common commands
alias ls='ls -A --color=auto --group-directories-first' 

# Alias git for a config dotfiles folder - https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=/home/apd/.cfg/ --work-tree=/home/apd'

# Add an "alert" alias for long running commands. 
# Usage:
#     sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
