# zsh
# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/trard/.oh-my-zsh"
export ZSH_THEME="powerlevel10k/powerlevel10k"
export POWERLEVEL9_MODE="nerdfont-complete"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions you-should-use)

# zsh autoupdate
DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=30

# PATH
export PATH="$DENO_INSTALL/bin:$PATH"

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# default editor
bindkey -M vicmd v edit-command-line
export VISUAL='nvim'
export EDITOR='nvim'

# Dot Files
export DOTFILES="~/dotfiles"

# fix wsl2 interpop
# https://github.com/microsoft/WSL/issues/5065
fix_wsl2_interop() {
    for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
        if [[ -e "/run/WSL/${i}_interop" ]]; then
            export WSL_INTEROP=/run/WSL/${i}_interop
        fi
    done
}

# aliases
alias lss='/usr/bin/ls --color=auto'

alias ls='lsd'
alias l='ls -li'
alias lst='ls --tree $(xargs printf " --ignore-glob=%s" < ~/.config/lsd/ignore)'
alias vim='nvim'

# sources
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# binds
bindkey '^ ' autosuggest-accept # ctrl + space
bindkey '^I' complete-word #tab
