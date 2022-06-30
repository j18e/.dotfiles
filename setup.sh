#!/bin/bash -eu

pushd $(dirname $0)
DOTFILES="$PWD"

CONFIG="$HOME/.config"

if [[ "$DOTFILES" != "$HOME/.dotfiles" ]]; then
    echo "ERROR - must be run from $DOTFILES"
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
    google-cloud-sdk
    htop
    jq
    kubectl
    kubernetes-helm
    reattach-to-user-namespace
    ripgrep
    terraform
    tig
    tmux
    tree
    vim
    wget
    zsh
    zsh-completions
)

cask_packages=(
    iterm2
    firefox
    slack
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
brew install --cask ${cask_packages[@]}

# install homebrew packages
brew install ${homebrew_packages[@]}

# install oh my zsh
ohmyzshurl="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
[[ -d "$HOME/.oh-my-zsh" ]] || sh -c "$(curl -fsSL $ohmyzshurl)"

mkdir -p $CONFIG
pushd $CONFIG
for url in ${config_repos[@]}; do
    git clone $url || true
done
if [[ -d karabiner ]]; then
    echo "updating karabiner.json with the copy from dotfiles"
    cp $DOTFILES/karabiner.json karabiner/
else
    echo "karabiner not found under $CONFIG. Strange..."
fi
popd

# set up fzf once it's been installed by homebrew
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish

# link files to home directory
for link in ${links[@]}; do
    [[ -e $link ]] || ln -s $link $HOME
done

popd
