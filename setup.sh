mkdir -p ~/.ssh
mkdir -p ~/.kube

echo "Installing antigen..."
curl -L git.io/antigen > ~/.antigen/antigen.zsh

FILES=(
    .zshrc
    .zlogin
    .gitconfig
    .ssh/config
    .Brewfile
)

echo "Linking dotfile..."
for FILE in ${FILES[@]}; do
    ln -sfv $HOME/.dotfiles/$FILE ~/$FILE;
done

DIRS=(
    pip
    tmux
    nvim
    wezterm
    stylua
    starship
)
echo "Linking config dir..."
for DIR in ${DIRS[@]}; do
    ln -sfvn $HOME/.dotfiles/$DIR ~/.config/$DIR;
done

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#echo "Installing brewfile dependencies"
#brew bundle -v --global

#echo "Dumping brew dependencies..."
#brew bundle dump --global -f
