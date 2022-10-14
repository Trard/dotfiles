. "$HOME/.cargo/env"

plugins=(git)

# aliases
alias lss='/usr/bin/ls --color=auto'

alias ls='lsd'
alias l='ls -li'
alias lst='ls --tree $(xargs printf " --ignore-glob=%s" < ~/.config/lsd/ignore)'
alias vim='nvim'

export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh