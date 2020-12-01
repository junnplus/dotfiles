if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
fi

FILES=(
    .vim
    .vimrc
    .zshrc
    .pip
    .gitconfig
    .tmux.conf
    .ssh/config
    .Brewfile
)

echo "Making dotfile links..."
for FILE in ${FILES[@]}
do
    if [ ! -L ~/$FILE ]; then
        echo "Link "$FILE;
        ln -s ~/.dotfiles/$FILE ~/$FILE;
    fi
done

echo "Link neovim"
ln -s ~/.dotfiles/.vim ~/.config/nvim

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing brewfile dependencies"
brew bundle -v --global

if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ln -s -F ~/.dotfiles/.oh-my-zsh ~/.oh-my-zsh/custom
fi

echo "Syncing submodule..."
git submodule init
git submodule update --init --recursive
