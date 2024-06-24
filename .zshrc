export EDITOR=nvim

export GOPATH=$HOME/.go
# export GOPROXY=https://goproxy.cn,direct

export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PTPYTHON_CONFIG_HOME=~/.config/ptpython

export CARGO_PATH=$HOME/.cargo

export PATH="/opt/homebrew/sbin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="$CARGO_PATH/bin:$GOPATH/bin:$PYENV_ROOT/shims:$PATH:$HOME/zig"
export PATH="$HOME/.local/bin:${HOME}/.krew/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export ZSH_HIGHLIGHT_MAXLENGTH=60

source ~/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle autojump
antigen bundle vi-mode
antigen bundle git
antigen bundle fzf
antigen bundle pyenv
antigen bundle pip
antigen bundle kubectl
# antigen bundle tmux
antigen bundle extract
antigen bundle gitignore
antigen bundle nvm

antigen bundle lukechilds/zsh-nvm
antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle z-shell/F-Sy-H --branch=main
# antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
# antigen bundle dracula/zsh
# antigen bundle dracula/zsh-syntax-highlighting
antigen bundle Tarrasch/zsh-autoenv

antigen apply

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
# eval "$(starship init zsh)"

# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || {
    echo "Load starship"
    eval "$(starship init zsh)"
}

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/openssl@3/include"

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
bindkey -M viins '^f' vi-backward-char
bindkey -M viins '^b' vi-forward-char
