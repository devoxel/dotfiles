if status is-interactive
    # display manpages using bat for syntax highlighting
    set -x MANPAGER 'sh -c "col -bx | bat -plman"'

    # zoxide should be used instead of cd
    zoxide init --hook pwd fish | source

    # basic abbreviations
    abbr --add cd z
    abbr --add v nvim
    abbr --add vim nvim
    abbr --add ao echo use z # brainrot
    abbr --add as echo use z # brainrot

    # aliases
    alias ls "ls -A --color=auto --group-directories-first"
    # use git for config dotfiles - see https://www.atlassian.com/git/tutorials/dotfiles
    alias config "git --git-dir=/home/apd/.cfg/ --work-tree=/home/apd"
    alias batman "bat -plman"
end
