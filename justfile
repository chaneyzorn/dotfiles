default:
  @just --list

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
        archlinuxcn/yay
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
        git-crypt
        go-tools
        golangci-lint-langserver-bin  # AUR
        gopls
        hugo
        iputils
        jq
        just
        lua-language-server
        man-db
        markdownlint-cli2
        meson
        mypy
        nodejs-cspell  # AUR
        pandoc-cli
        prettier
        pyright
        ripgrep
        rsync
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
        tokei
        tree
        tree-sitter-cli
        typescript-language-server
        typos-lsp
        unarchiver
        vale
        wget
        yamlfmt
        yamllint
        yq
    )
    yay -S --needed ${env_pkgs[@]} ${cli_tools[@]}

yay-gui-pkgs:
    #!/usr/bin/env sh
    fonts=(
        ttf-cascadia-code
        ttf-cascadia-code-nerd
        ttf-fira-code
        ttf-firacode-nerd
        ttf-fira-mono
        ttf-jetbrains-mono
        ttf-jetbrains-mono-nerd
        ttf-nerd-fonts-symbols-mono
    )
    gui_tools=(
        font-manager
        ghostty
        google-chrome
        gparted
        menulibre
        obsidian
        pamac-aur
        papirus-icon-theme
        shattered-pixel-dungeon
        telegram-desktop
        transmission-gtk
        visual-studio-code-bin
    )
    yay -S --needed ${fonts[@]} ${gui_tools[@]}

brew-pkgs:
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
        git-crypt
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
        pyright
        ripgrep
        rsync
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
        tokei
        tree
        tree-sitter
        tree-sitter-cli
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
        iina
        jordanbaird-ice
        lapce
        monitorcontrol
        neovide
        obsidian
        pearcleaner
        transmission
    )
    brew install -q ${env_pkgs[@]} ${cli_tools[@]}
    brew install -q --cask ${casks[@]}

user-pkgs:
    #!/usr/bin/env sh
    uv_pkgs=(
        neovim-sh
        ruff
        basedpyright
        pyrefly
    )
    for p in "${uv_pkgs[@]}"; do
       uv tool install "$p"
    done

nvim-nightly:
    #!/usr/bin/env sh
    case "$(uname -s)" in
        Linux*)
            PLATFORM="linux"
            SUFFIX="appimage"
            ;;
        Darwin*)
            PLATFORM="macos"
            SUFFIX="tar.gz"
            ;;
        *)
            echo "unsupported platform: $(uname -s)"
            exit 1
    esac
    case "$(uname -m)" in
        x86_64*)
            ARCH="x86_64"
            ;;
        arm64*|aarch64*)
            ARCH="arm64"
            ;;
        *)
            echo "unsupported arch: $(uname -m)"
            exit 1
    esac

    TMP_DIR=$(mktemp -d)
    DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/nightly/nvim-${PLATFORM}-${ARCH}.${SUFFIX}"
    echo "download $DOWNLOAD_URL to ${TMP_DIR}"
    curl -L "${DOWNLOAD_URL}" -o "${TMP_DIR}/neovim_download"

    NEOVIM_BIN="${HOME}/.local/bin/nv"
    INSTALL_DIR="${HOME}/.local/share/neovim-nightly"
    echo "extract to ${INSTALL_DIR}"
    rm -rf ${INSTALL_DIR}
    if [ "$PLATFORM" = "linux" ]; then
        mkdir -p "${INSTALL_DIR}"
        mv -vf "${TMP_DIR}/neovim_download" "${INSTALL_DIR}/nvim.appimage"
        chmod +x "${INSTALL_DIR}/nvim.appimage"
        ln -sf "${INSTALL_DIR}/nvim.appimage" "${NEOVIM_BIN}"
    else
        xattr -c "${TMP_DIR}/neovim_download"
        tar -xzf "${TMP_DIR}/neovim_download" -C "${TMP_DIR}"
        mv -vf "${TMP_DIR}"/nvim-macos-${ARCH} "${INSTALL_DIR}"
        ln -sf "${INSTALL_DIR}/bin/nvim" "${NEOVIM_BIN}"
    fi
    echo "clean ${TMP_DIR}"
    rm -rf "${TMP_DIR}"
    ls -lah "${NEOVIM_BIN}"

tmux-tpm:
    #!/usr/bin/env sh
    if [[ ! -d ${HOME}/.tmux/plugins/tpm ]]; then
        git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
    fi
    env TMUX_PLUGIN_MANAGER_PATH="${HOME}/.tmux/plugins" ${HOME}/.tmux/plugins/tpm/bin/install_plugins
    env TMUX_PLUGIN_MANAGER_PATH="${HOME}/.tmux/plugins" ${HOME}/.tmux/plugins/tpm/bin/update_plugins all
    env TMUX_PLUGIN_MANAGER_PATH="${HOME}/.tmux/plugins" ${HOME}/.tmux/plugins/tpm/bin/clean_plugins
