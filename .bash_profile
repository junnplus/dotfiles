PS1='\W \$ '
export CLICOLOR=1
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
alias vi=vim
source ~/.git-completion.bash

export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export GOPATH=$HOME/.go
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_TOOLS="$ANDROID_HOME/tools"
export ANDROID_PLATFORM_TOOLS="$ANDROID_HOME/platform-tools"
export PATH="/usr/local/sbin:$GOPATH/bin:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS:$PATH"
