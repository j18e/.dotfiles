#!/bin/bash -eu

pushd $(dirname $0)

if [[ "$PWD" != "$HOME/.dotfiles" ]]; then
    echo "ERROR - must be run from $HOME/.dotfiles"
    exit 1
fi

homebrew_packages=(
    bash
    fzf
    git
    htop
    jq
    kubernetes-cli
    kubernetes-helm
    macvim
    md5sha1sum
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

# link files to home directory
pushd $HOME
for link in ${links[@]}; do
    [[ -e $link ]] || ln -s .dotfiles/$link
done
popd

popd
