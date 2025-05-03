default:
  @just --list
  @just --choose

config-archlinuxcn:
    #!/usr/bin/env sh
    if ! grep archlinuxcn /etc/pacman.conf; then
        sudo echo "[archlinuxcn]" >> /etc/pacman.conf
        sudo echo "Server = https://mirrors.hust.edu.cn/archlinuxcn/$arch" >> /etc/pacman.conf
        sudo pacman -Sy && sudo pacman -S archlinuxcn-keyring
    fi

ensure-yay:
    #!/usr/bin/env sh
    if ! which yay; then
        sudo pacman -S --needed git base-devel
        git clone https://aur.archlinux.org/yay-bin.git
        pushd yay-bin
        makepkg -si
        popd
        rm -rf yay-bin
    fi

yay-pkgs:
    #!/usr/bin/env sh
    env_pkgs=(
        docker
        go
        lua
        luarocks
        nodejs
        npm
        pnpm
        ruby
        rust
        uv
        yay-bin
    )
    cli_tools=(
        ast-grep
        bash-language-server
        biome
        btop
        ccls
        cloc
        cppcheck
        curl
        fastfetch
        fd
        fzf
        go-tools
        golangci-lint-langserver
        gopls
        hugo
        iputils
        jq
        just
        lua-language-server
        markdownlint-cli2
        meson
        mypy
        pandoc
        prettier
        pstree
        pyright
        ripgrep
        ruff
        rust-analyzer
        scrcpy
        shellcheck
        shfmt
        sshfs
        stow
        stylua
        superfile
        taplo-cli
        tmux
        tree
        typescript-language-server
        typos-lsp
        unarchiver
        vale
        wget
        yamlfmt
        yamllint
        yq
    )
    fonts=(
        nerd-fonts-cascadia-code
        nerd-fonts-fira-code
        nerd-fonts-jetbrains-mono
        ttf-fira-code
        ttf-fira-mono
        ttf-jetbrains-mono
        ttf-nerd-fonts-symbols-mono
    )
    gui_tools=(
        font-manager
        ghostty
        google-chrome
        gparted
        menulibre
        pamac-gtk
        papirus-icon-theme
        telegram-desktop
        transmission-gtk
        visual-studio-code-bin
        xcursor-breeze
    )
    yay -S --needed ${env_pkgs[@]} ${cli_tools[@]} ${fonts[@]} ${gui_tools[@]}

homebrew-pkgs:
    #!/usr/bin/env sh
    env_pkgs=(
        go
        lua
        luarocks
        node
        pnpm
    )
    cli_tools=(
        ast-grep
        bash-language-server
        biome
        btop
        ccls
        cspell
        fd
        goimports
        golangci-lint-langserver
        gopls
        hugo
        jq
        just
        lua-language-server
        markdownlint-cli2
        mypy
        neovim
        prettier
        pstree
        pyright
        ripgrep
        ruff
        rust-analyzer
        scrcpy
        shellcheck
        shfmt
        stow
        stylua
        superfile
        taplo
        tmux
        tree
        typescript-language-server
        typos-lsp
        vale
        wget
        yamlfmt
        yamllint
        yq
    )
    casks=(
        alt-tab
        font-jetbrains-mono-nerd-font
        ghostty
        jordanbaird-ice
        lapce
        monitorcontrol
        neovide
        pearcleaner
    )
    brew install -q ${env_pkgs[@]} ${cli_tools[@]}
    brew install -q --cask ${casks[@]}
