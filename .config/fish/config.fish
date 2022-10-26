set -g fish_greeting

fish_add_path $HOME/.cargo/env
fish_add_path $DENO_INSTALL/bin
fish_add_path $HOME/.local/bin

if status is-interactive
    # aliases
    alias lss='/usr/bin/ls --color=auto'

    alias ls='lsd'
    alias l='ls -li'
    alias lst='ls --tree $(xargs printf " --ignore-glob=%s" < ~/.config/lsd/ignore)'

    alias v='nvim'
    alias vi='/usr/bin/vim'
    alias vim='nvim'

    set -gx EDITOR nvim
    set -gx VISUAL nvim

    bind -k nul accept-autosuggestion #ctrl space
end
