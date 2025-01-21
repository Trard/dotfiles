set -g fish_greeting

set -gx PATH "$HOME/.cargo/bin" $PATH;
set -gx PATH "$DENO_INSTALL/bin" $PATH;
set -gx PATH "$HOME/.local/bin" $PATH;

if status is-interactive
    alias vi='/usr/bin/vim'
    alias vim='nvim'

    set -gx EDITOR nvim
    set -gx VISUAL nvim

    bind -k nul accept-autosuggestion #ctrl space
    eval $(ssh-agent -c)
end
