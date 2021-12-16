source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle autojump
antigen bundle vi-mode
antigen bundle git
antigen bundle fzf
antigen bundle pyenv
antigen bundle pip
antigen bundle kubectl
antigen bundle helm
antigen bundle terraform
antigen bundle tmux
antigen bundle extract
antigen bundle gitignore

antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle dracula/zsh
antigen bundle dracula/zsh-syntax-highlighting

antigen apply

eval "$(starship init zsh)"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

alias vi=nvim
alias vim=nvim
alias la='exa -alF --icons'
alias ls='exa -lF --icons'
alias cat='bat --style=numbers'
alias k=kubectl
alias ksys='kubectl -n kube-system'
alias kd='kubectl debug'
alias kns=kubens
alias kctx=kubectx
alias g=git
alias gti=git
alias proxy="export all_proxy=socks5://127.0.0.1:6153"
alias noproxy="unset all_proxy"

export KUBECONFIG=$(echo `ls ~/.kube/*config` | sed 's/ /:/g')

export GOPATH=$HOME/.go
export GOPROXY=https://goproxy.cn,direct

export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PTPYTHON_CONFIG_HOME=~/.config/ptpython

export CARGO_PATH=$HOME/.cargo

export GPG_TTY=$(tty)

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="$CARGO_PATH/bin:$GOPATH/bin:$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
export PATH="$HOME/.local/bin:${HOME}/.krew/bin:$PATH"
export PATH="/usr/local/opt/openresty/nginx/sbin:/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
--height 40%
--reverse
--bind 'ctrl-f:preview-page-down,ctrl-b:preview-page-up'
--color=light
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
"
