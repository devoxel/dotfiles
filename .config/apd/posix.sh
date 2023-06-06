# Keychain
[ -x "$(command -v keychain)" ] && eval `keychain --eval id_ed25519 id_rsa` && echo "loaded keychain"

# Golang
if [ -x "$(command -v go)" ]; then
	export GOPATH="$HOME/go"
	echo "loaded go"
fi

# Bat
if [ -x "$(command -v batcat)" ] && [ ! -x "$(command -v bat)" ]; then
	echo "you need to fix bat, run:"
	echo "  sudo ln -s /usr/bin/batcat /usr/bin/bat && source ~/.bashrc"
fi

if [ -x "$(command -v bat)" ]; then
	export BAT_THEME="gruvbox-light"
	export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
	alias cat='bat --paging=never'
	echo "loaded bat"
else
	echo "missing bat"
fi

# Cargo
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env" && echo "loaded cargo"

# Alias git for a config dotfiles folder - https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=/home/apd/.cfg/ --work-tree=/home/apd'

# Preferred flags for common commands
alias vim="nvim"
alias ls="ls -A --group-directories-first --color=auto --sort=extension"
alias sl="ls"
alias ..="cd .."
alias h="helm --kube-context"
alias k="kubectl --context"
alias cl="clear; ls"

# Add an "alert" alias for long running commands. Usage: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Weird forces of habit
alias ao="echo use z"
alias as="echo use z"

# Replacements
alias vim="nvim"

# Little time savers
alias pb='curl -F c=@- pb' # requires pb server
alias fix="git diff --name-only | uniq | xargs $EDITOR"
alias gotag="grep -R '^// +build' | grep -v vendor | sed 's;:// +build ; : tags=;g' | column -t -s':'"
alias log="logcli query  -o raw --forward --no-labels -q  --limit 10000"
alias rlog="logcli query  -o raw --forward --no-labels -q  --limit 10000 --since=1h"
