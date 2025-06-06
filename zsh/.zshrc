# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
if [ ! $BASE_PATH ]; then
    export BASE_PATH=$PATH
fi

export GOROOT=$(go env GOROOT)
export GOPATH=$(go env GOPATH)
export PNPM_HOME="$HOME/.local/share/pnpm"

LOCAL_BIN=/usr/local/bin
LOCAL_SBIN=/usr/local/sbin
GO_BIN=$GOPATH/bin
MY_LOCAL_BIN=$HOME/.local/bin
RUST_BIN=$HOME/.cargo/bin
LUA_BIN=$HOME/.luarocks/bin
NODE_BIN=$HOME/.node_modules/bin
RUBY_BIN=$(ruby -r rubygems -e 'puts Gem.user_dir')/bin
MY_PATH=$MY_LOCAL_BIN:$GO_BIN:$RUST_BIN:$PNPM_HOME:$NODE_BIN:$RUBY_BIN:$LUA_BIN:$LOCAL_BIN:$LOCAL_SBIN

export PATH=$MY_PATH:$BASE_PATH

export XDG_CONFIG_HOME="$HOME/.config"
export SHELL=$(which zsh)

export UV_TOOL_DIR=$(uv tool dir)
eval `luarocks path --no-bin`

export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

# Path to your oh-my-zsh installation.
if [[ -d $HOME/.oh-my-zsh ]]; then
    export ZSH=$HOME/.oh-my-zsh
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [[ -d $HOME/.oh-my-zsh ]]; then
    # macOS:
    # iTerm2 > Profiles > Text > Font: "Use a different font for non-ASCII text"
    # then https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
    # git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
    ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    pip
    python
    z
)
autoload -U compinit && compinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

ZSH_CACHE_DIR=$HOME/.cache/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# auto completion
compctl -g '~/.teamocil/*(:t:r)' teamocil

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# alias ls='lsd'
alias la='ls -la'
alias lt='ls --tree'

alias t='tmux'
alias ta='tmux attach'
alias tt='ta || t'
alias tm='teamocil'
alias pi='teamocil chaney-pi'
alias zj='zellij attach --create'

# virtualenv --python=/usr/bin/python2 ~/Pyvenv/venv2.7/
alias py2='source ~/Pyvenv/venv2.7/bin/activate'
# python3 -m venv ~/Pyvenv/venv3/
alias py3='source ~/Pyvenv/venv3/bin/activate'

alias v=nvim
if [[ "$(uname)" == "Darwin" ]]; then
  alias vx="neovide --fork --frame transparent"
else
  alias vx="neovide --fork --frame none"
fi

alias ssh='TERM=xterm-256color \ssh'

alias systemctlu="systemctl --user"
alias dblackf="git diff --name-only | xargs -L1 black"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ ! -f ~/.myutil.zsh ]] || source ~/.myutil.zsh
