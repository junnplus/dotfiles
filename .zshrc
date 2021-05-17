# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="spaceship"
ZSH_CUSTOM=$HOME/.dotfiles/.oh-my-zsh

plugins=(
    autojump
    vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    pyenv
    pip
    kubectl
    helm
    terraform
    tmux
    extract
    git
    gitignore

    # custom
    fzf-tab
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  golang        # Go section
  pyenv         # Pyenv section
  kubecontext   # Kubectl context section
  time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX='now '

# zstyle ':completion:*:lsd' file-sort modification
# zstyle ':completion:*:lsd' sort false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"

alias vi=nvim
alias vim=nvim
alias la='lsd -alF'
alias ls='lsd -lF'
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

export GPG_TTY=$(tty)

export PATH="/usr/local/bin:/usr/bin:/bin:/sbin"
export PATH="$GOPATH/bin:$PYENV_ROOT/shims:$PATH"
export PATH="$HOME/.local/bin:${HOME}/.krew/bin:$PATH"
export PATH="/usr/local/opt/openresty/nginx/sbin:/usr/local/opt/gnu-getopt/bin:$PATH"

export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
--height 40%
--reverse
--bind 'ctrl-f:preview-page-down,ctrl-b:preview-page-up'
--color=light
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
"
