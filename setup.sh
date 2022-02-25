mkdir -p ~/.ssh
mkdir -p ~/.kube

echo "Installing antigen..."
curl -L git.io/antigen > ~/.antigen/antigen.zsh

FILES=(
    .zshrc
    .gitconfig
    .ssh/config
    .Brewfile
)

echo "Linking dotfile..."
for FILE in ${FILES[@]}; do
    ln -sfv /Users/jun/.dotfiles/$FILE ~/$FILE;
done
ln -sfvn /Users/jun/.dotfiles/pip ~/.config/pip
ln -sfvn /Users/jun/.dotfiles/tmux ~/.config/tmux
ln -sfvn /Users/jun/.dotfiles/nvim ~/.config/nvim
ln -sfvn /Users/jun/.dotfiles/wezterm ~/.config/wezterm

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#echo "Installing brewfile dependencies"
#brew bundle -v --global

#echo "Dumping brew dependencies..."
#brew bundle dump --global -f

# echo "Installing powerline fonts"
# cd /tmp && rm -rf fonts && git clone https://github.com/powerline/fonts && ./fonts/install.sh
