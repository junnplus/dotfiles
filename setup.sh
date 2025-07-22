mkdir -p ~/.ssh
mkdir -p ~/.kube

FILES=(
    .zshrc
    .Brewfile
)

echo "Linking dotfile..."
for FILE in ${FILES[@]}; do
    ln -sfv $HOME/.dotfiles/$FILE ~/$FILE;
done

echo "Linking config dir..."
for item in "$HOME/.dotfiles/config/"*; do
    DIR=$(basename $item)
    ln -sfvn $HOME/.dotfiles/config/$DIR ~/.config/$DIR;
done

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#echo "Installing brewfile dependencies"
#brew bundle -v --global

#echo "Dumping brew dependencies..."
#brew bundle dump --global -f
