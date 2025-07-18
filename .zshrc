[ -f ~/.env.zsh ] && source ~/.env.zsh

export EDITOR=nvim

export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin

export CARGO_PATH=$HOME/.cargo

export PATH="/opt/homebrew/opt/libpq/bin:/opt/homebrew/sbin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="$CARGO_PATH/bin:$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:${HOME}/.krew/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export ZSH_HIGHLIGHT_MAXLENGTH=60

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
[[ ${widgets[zle-keymap-select]#user:} == starship* ]] && zle -N zle-keymap-select ""

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(sheldon source)"
eval "$(atuin init zsh)"

# zsh-vi-mode will overwrite the key bindings of atuin.
# xref: https://github.com/atuinsh/atuin/issues/977
zvm_after_init_commands+=(eval "$(atuin init zsh)")

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib -L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include -I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"
export LIBRARY_PATH="/opt/homebrew/lib"
export C_INCLUDE_PATH="/opt/homebrew/include"

alias vi=nvim
alias vim=nvim
alias la='exa -alF --icons'
alias ls='exa -lF --icons'
alias cat='bat --style=numbers'
alias k=kubectl
alias ksys='kubectl -n kube-system'
alias kd='kubectl debug'
alias kk='kubectl krew'
alias kns=kubens
alias kctx=kubectx
alias g=git
alias gti=git
alias proxy="export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152;export all_proxy=socks5://127.0.0.1:6153"
alias noproxy="unset all_proxy https_proxy http_proxy"
alias q=exit
# alias nerdctl="lima sudo nerdctl"
# alias docker="lima sudo docker"

eval $(ssh-agent) > /dev/null
find ~/.ssh -name 'id_*' ! -name '*.pub' -exec ssh-add -q {} \;

function workup {
    if [[ -n "$TMUX" ]]
    then
        return 0
    fi
    tmux ls -F '#{session_name}' |
    fzf --bind=enter:replace-query+print-query |
    read session && tmux attach -t ${session:-default} || tmux new -s ${session:-default}
}

export KUBECONFIG=$(echo `/bin/ls ~/.kube/*config` | sed 's/ /:/g')
export GPG_TTY=$(tty)

export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
--height 40%
--reverse
--bind 'ctrl-f:preview-page-down,ctrl-b:preview-page-up'
--color=light
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
"

bindkey -v
# bindkey -M viins '^f' vi-forward-char
# bindkey -M viins '^b' vi-backward-char
export WORDCHARS='*?_-[\]~=&;!#$%^(){}<>'

export PATH=/Users/jun/.claude/local:/Users/jun/.opencode/bin:$PATH
