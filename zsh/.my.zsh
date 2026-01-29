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
eval $(luarocks path --no-bin)

export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

export EDITOR='nvim'

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

[[ ! -f ~/.myutil.zsh ]] || source ~/.myutil.zsh

if [[ -n "$SSH_CONNECTION" ]]; then
    PROMPT="[%F{green}%n@%m%f] ${PROMPT}"
fi
