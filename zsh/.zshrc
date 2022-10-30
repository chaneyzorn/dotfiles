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

export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

export GOROOT=$(go env GOROOT)
export GOPATH=$(go env GOPATH)

export PNPM_HOME="$HOME/.local/share/pnpm"

LOCAL_BIN=/usr/local/bin
LOCAL_SBIN=/usr/local/sbin
GO_BIN=$GOPATH/bin
MY_BIN=$HOME/myutils/bin
RUST_BIN=$HOME/.cargo/bin
LUA_BIN=$HOME/.luarocks/bin
NODE_BIN=$HOME/.node_modules_global/bin
RUBY_BIN=$(ruby -r rubygems -e 'puts Gem.user_dir')/bin
MY_PATH=$MY_BIN:$GO_BIN:$RUST_BIN:$PNPM_HOME:$NODE_BIN:$RUBY_BIN:$LUA_BIN:$LOCAL_BIN:$LOCAL_SBIN

export PATH=$MY_PATH:$BASE_PATH
export SHELL=$(which zsh)
eval `luarocks path --no-bin`

# Path to your oh-my-zsh installation.
if [[ -d $HOME/.oh-my-zsh ]]; then
    export ZSH=$HOME/.oh-my-zsh
elif [[ -d /usr/share/oh-my-zsh ]]; then
    export ZSH=/usr/share/oh-my-zsh
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
elif [[ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]; then
    # install nerd-fonts-fira-code
    # edit .config/fontconfig/conf.d/10-symbols.conf
    # yay -S zsh-theme-powerlevel10k-git
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
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
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
    thefuck
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

alias slk='ss-local -v -l 1080 `ss-quick -c ~/.vpn/shadowsocks/gui-config.json`'
alias t='tmux'
alias ta='tmux attach'
alias pi='teamocil chaney-pi'

# virtualenv --python=/usr/bin/python2 ~/Pyvenv/venv2.7/
alias py2='source ~/Pyvenv/venv2.7/bin/activate'
# python3 -m venv ~/Pyvenv/venv3/
alias py3='source ~/Pyvenv/venv3/bin/activate'

alias smvn='cd ~/.vpn/smartx/ && sudo openvpn --config zouquan.smartx.ovpn'

NVIM_NIGHTLY="~/myutils/bin/nvim.appimage"
alias nvimup="curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o $NVIM_NIGHTLY"

alias v=nvim
alias nv=$NVIM_NIGHTLY
alias vde=neovide

# 保证终端兼容性
alias ssh='TERM=xterm-256color \ssh'

alias systemctlu="systemctl --user"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# since https://gitlab.gnome.org/GNOME/vte/-/issues/347
# we add env LANG=en_US.UTF-8 to xfce-terminal.desktop
# set back LANG=zh_CN.UTF-8 here
export LANG=zh_CN.UTF-8

[[ ! -f ~/.myutil.zsh ]] || source ~/.myutil.zsh
