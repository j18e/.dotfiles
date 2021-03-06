#!/bin/bash -eu

pushd $(dirname $0)
DOTFILES="$PWD"

if [[ "$PWD" != "$HOME/.dotfiles" ]]; then
    echo "ERROR - must be run from $HOME/.dotfiles"
    exit 1
fi

config_repos=(
    "https://github.com/chriskempson/base16-shell.git"
    "https://github.com/martinlindhe/base16-iterm2.git"
    "https://github.com/zsh-users/zsh-syntax-highlighting.git"
)

homebrew_packages=(
    bash
    coreutils
    fzf
    git
    htop
    jq
    kubernetes-helm
    macvim
    reattach-to-user-namespace
    ripgrep
    tig
    tmux
    tree
    wget
    zsh
    zsh-completions
    zsh-syntax-highlighting
)

cask_packages=(
    docker
    iterm2
    karabiner-elements
    spectacle
)

links=(
    .bin
    .editorconfig
    .tmux.conf
    .vimrc
    .zsh_aliases
    .zshrc
)

# install homebrew
homebrewurl="https://raw.githubusercontent.com/Homebrew/install/master/install"
which brew >> /dev/null || /usr/bin/ruby -e "$(curl -fsSL $homebrewurl)"

# install gui apps with homebrew
brew cask install ${cask_packages[@]}

# install homebrew packages
brew install ${homebrew_packages[@]}

# install oh my zsh
ohmyzshurl="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
[[ -d "$HOME/.oh-my-zsh" ]] || sh -c "$(curl -fsSL $ohmyzshurl)"

mkdir -p $HOME/.config
pushd $HOME/.config
for url in ${config_repos[@]}; do
    git clone $url || true
done
if [[ -d karabiner ]]; then
    echo "updating karabiner.json with the copy from dotfiles"
    cp $DOTFILES/karabiner.json karabiner/
else
    echo "karabiner not found under $PWD. Strange..."
fi
popd

# link files to home directory
pushd $HOME
for link in ${links[@]}; do
    [[ -e $link ]] || ln -s .dotfiles/$link
done
popd

popd
