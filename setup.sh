mkdir -p ~/.ssh
mkdir -p ~/.pip
mkdir -p ~/.kube
mkdir -p ~/.antigen

echo "Installing antigen..."
curl -L git.io/antigen > ~/.antigen/antigen.zsh

FILES=(
    .zshrc
    .pip/pip.conf
    .gitconfig
    .tmux.conf
    .ssh/config
    .Brewfile
)

echo "Linking dotfile..."
for FILE in ${FILES[@]}; do
    ln -sfv /Users/jun/.dotfiles/$FILE ~/$FILE;
done
ln -sfvn /Users/jun/.dotfiles/nvim ~/.config/nvim

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#echo "Installing brewfile dependencies"
#brew bundle -v --global

echo "Syncing submodule..."
git submodule init
git submodule update --init --recursive

#echo "Dumping brew dependencies..."
#brew bundle dump --global -f

# echo "Installing powerline fonts"
# cd /tmp && rm -rf fonts && git clone https://github.com/powerline/fonts && ./fonts/install.sh
