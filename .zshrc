# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# we're not using this oh-my-zsh feature - PROMPT is set manually in this file
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins  in ~/.oh-my-zsh/plugins/*
# Custom plugins added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    golang
    vi-mode
)

source $ZSH/oh-my-zsh.sh

source $HOME/.config/base16-shell/scripts/base16-oceanicnext.sh # colorscheme
source $HOME/.zsh_aliases

export EDITOR=vim
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export PATH="/usr/local/sbin:$PATH" # homebrew's sbin
export PATH="$PATH:$HOME/.bin"

if ! [[ -f "/usr/local/bin/jsc" ]]; then
    ln -s /System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc /usr/local/bin
fi

# golang
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

# helm
export HELM_HOME=$HOME/.helm
source <(helm completion zsh)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# kubectl
source <(kubectl completion zsh)

# non dotfiles variables
[ -f ~/.env ] && source ~/.env

# prompt
which shell-prompt >> /dev/null || go install github.com/j18e/shell-prompt
PROMPT='$(shell-prompt -exit-code $? -zsh)'

# cli syntax highlighting - must be at end of file
source $HOME/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
