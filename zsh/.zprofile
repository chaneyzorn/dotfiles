# Added by OrbStack: command-line tools and integration
if [[ -f ~/.orbstack/shell/init.zsh ]]; then
    source ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi

if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
