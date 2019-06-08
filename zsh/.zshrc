# If you come from bash you might have to change your $PATH.
if [ ! $MY_PATH ]; then
    export GOPATH=$HOME/go
    export MY_PATH=$HOME/myutils/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/.node_modules_global/bin
    export PATH=$MY_PATH:$PATH
fi

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# Path to your oh-my-zsh installation.
if [[ -d /usr/share/oh-my-zsh ]]; then
    export ZSH=/usr/share/oh-my-zsh
else
    export ZSH=$HOME/.oh-my-zsh
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [[ "$OSTYPE" == "darwin"* ]]; then
    POWERLEVEL9K_MODE='nerdfont-complete'
    ZSH_THEME="powerlevel9k/powerlevel9k"
else
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
    # source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
    # install https://github.com/gabrielelana/awesome-terminal-fonts
    POWERLEVEL9K_MODE='awesome-fontconfig'
fi

DEFAULT_USER="chaney"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs)

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
    archlinux
    docker
    encode64
    git
    pip
    python
    sudo
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
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
# if [[ ! -d $ZSH_CACHE_DIR ]]; then
#   mkdir $ZSH_CACHE_DIR
# fi

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls='lsd'
alias la='ls -la'
alias lt='ls --tree'

alias slk='ss-local -v -l 1080 `ss-quick -c ~/.vpn/shadowsocks/gui-config.json`'
alias t='tmux'
alias ta='tmux attach'

# virtualenv --python=/usr/bin/python2 ~/Pyvenv/venv2.7/
alias py2='source ~/Pyvenv/venv2.7/bin/activate'
# python3 -m venv ~/Pyvenv/venv3/
alias py3='source ~/Pyvenv/venv3/bin/activate'

alias smvn='cd ~/.vpn/smartx/ && sudo openvpn --config zouquan.smartx.ovpn'

alias vim='nvim'
alias vi='nvim'

# 保证终端兼容性
alias ssh='TERM=xterm-256color \ssh'


# nnn 终端文件管理器
# 使用 $EDITOR 指定的编辑器
export NNN_USE_EDITOR=1

