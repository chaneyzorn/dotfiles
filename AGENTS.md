# AGENTS.md — dotfiles

> This document is written for AI coding agents that need to work with this repository.  It replaces the previously empty `AGENTS.md` and is based on the actual files in the project.

## Project overview

This repository is a personal **Linux / macOS dotfiles** collection managed with [GNU Stow](https://www.gnu.org/software/stow/).  The repository root itself is the Stow directory (`stow dir`); each top-level subdirectory is a separate package tree.  Running `stow -S <pkg>` from the repository root creates symlinks in the parent directory (usually `$HOME`), mapping files such as `zsh/.zshrc` to `~/.zshrc`.

Human-readable documentation:

- `README.md` — short English description of the Stow workflow.
- `README.zh-CN.md` — detailed Chinese guide on collecting, applying, and synchronising dotfiles with Stow, plus Arch Linux package backup/restore recipes.

Licences declared in `README.zh-CN.md`: MIT and CC BY-NC-SA 3.0.

## Repository layout

Top-level Stow packages and what they contain:

| Package | Purpose |
|---------|---------|
| `bash/` | Bash shell configuration (`.bashrc`, `.bash_profile`, `.bash_logout`, `.dir_colors`, `.extend.bashrc`). |
| `zsh/` | Zsh configuration: `.zshrc` (loads Oh My Zsh), `.zshenv` (cargo env), `.zprofile` (Homebrew / OrbStack), `.my.zsh` (custom PATH and aliases), `.myutil.zsh` (helper functions), and `.config/starship.toml`. |
| `nvim/` | Neovim configuration and surrounding editor tooling configs.  Main entry is `.config/nvim/init.lua`. |
| `tmux/` | `tmux.conf`, TPM plugin declarations, and `.teamocil/` session layouts. |
| `kitty/` | Kitty terminal emulator configuration. |
| `wezterm/` | WezTerm terminal emulator configuration (Lua). |
| `ghostty/` | Ghostty terminal emulator configuration. |
| `zellij/` | Zellij terminal multiplexer configuration (KDL). |
| `yazi/` | Yazi terminal file manager configuration (TOML). |
| `zed/` | Zed editor settings (JSON). |
| `niri/` | Niri Wayland compositor configuration (KDL), Linux only. |
| `hammerspoon/` | macOS automation scripts in Lua (IME switching, window movement). |
| `linux-home/` | X11 / Linux desktop files: `.Xresources`, `.xprofile`, `.xsession`, `.profile`, `.dmrc`, `.pam_environment`, fcitx5/rime config, and xfce4 terminal colour themes. |
| `ssh/` | SSH client configuration. |
| `systemd/` | User systemd unit files. |
| `docker/` | Docker Compose stacks for self-hosted services (AdGuard, Beszel, Clash, DuFS, Gitea, Homarr, Homepage, LX-Music, Memos, nginx-proxy-manager, Portainer, RustDesk, Syncthing, Uptime-Kuma, yacd, etc.). |

Root-level tooling files:

- `justfile` — environment bootstrapping recipes (packages, Neovim nightly, tmux TPM).
- `.luarc.json` — Lua language-server settings for Neovim / Hammerspoon / WezTerm Lua files.
- `stylua.toml` — Lua formatter configuration (2-space indentation).
- `selene.toml` / `neovim.yml` — Selene Lua linter configuration, allowing Neovim globals such as `vim`, `hs`, and `Snacks`.
- `.gitignore` — ignores runtime data, caches, local binaries, and container volumes.

## Technology stack and runtime architecture

- **Shells**: zsh (primary, with Oh My Zsh + starship prompt config) and bash (fallback).
- **Editor**: Neovim (Lua config via `lazy.nvim`) and Zed.
- **Terminals / multiplexers**: Kitty, WezTerm, Ghostty, tmux, zellij.
- **Window / desktop environments**: Niri (Wayland, Linux) and Hammerspoon (macOS).
- **Package ecosystems**:
  - Arch Linux: `pacman` + `yay` (AUR).
  - macOS: Homebrew (brew and casks).
  - Language tools: `uv` tools, `cargo`, `go`, `npm`/`pnpm`, `luarocks`.
- **Mirrors / proxies**: Several configs point to Chinese mirrors (USTC `archlinuxcn`, TUNA Homebrew, Tsinghua PyPI, `npmmirror.com` npm, `goproxy.cn`).  The `justfile` and `systemd` units also install/use proxy tooling such as Clash.
- **Services**: systemd user units and Docker Compose stacks for self-hosted apps.
- **Fonts**: Noto CJK, JetBrains Mono / Fira Code / Cascadia Code, and Nerd Font variants.

This is **not a compiled application**; there is no `pyproject.toml`, `package.json`, `Cargo.toml`, or similar build manifest.  The "build" process is creating symlinks with Stow and installing external packages.

## Build, install and deployment commands

All bootstrapping is in `justfile`.  Common recipes:

| Command | Purpose |
|---------|---------|
| `just` | List all recipes. |
| `just yay-pkgs` | Install Arch / AUR CLI packages (development tools, language servers, linters, etc.). |
| `just yay-gui-pkgs` | Install Arch / AUR GUI packages and fonts. |
| `just brew-pkgs` | Install macOS Homebrew formulae and casks. |
| `just user-pkgs` | Install Python tools via `uv tool install` (neovim-sh, ruff, basedpyright, pyrefly). |
| `just nvim-nightly` | Download and install the latest Neovim nightly release for Linux or macOS. |
| `just tmux-tpm` | Clone / update tmux plugin manager (TPM) plugins. |
| `just ensure-yay-bin` / `just ensure-yay` | Bootstrap the `yay` AUR helper. |
| `just config-archlinuxcn` | Add the USTC `archlinuxcn` mirror to `/etc/pacman.conf`. |

Deploying configuration files:

```sh
# From the repository root (the Stow directory):

stow -S <package>        # Symlink a package into $HOME
stow -R <package>        # Restow (remove then re-create)
stow -D <package>        # Remove symlinks for a package
stow -n -S <package>     # Dry-run / simulate
stow -S pkg1 pkg2 -D pkg3 pkg4 -S pkg5 -R pkg6
```

For first-time migration of existing files into the repo, `--adopt` can be used **with git** so changes can be reviewed:

```sh
stow --adopt <package>
```

> Warning: `--adopt` overwrites the package files in the repo with the target-directory versions.  Only use it under version control.

## Code organization and module divisions

### Neovim

The Neovim configuration lives under `nvim/.config/nvim/`:

- `init.lua` — entry point; loads `neo.setting`, `neo.neovide`, and sets up plugins via `neo.lazy`.
- `lua/neo/setting.lua` — base options (leader, indentation, search, UI, providers, SSH clipboard, etc.).
- `lua/neo/neovide.lua` — Neovide-specific settings.
- `lua/neo/lazy.lua` — Bootstraps `lazy.nvim`, points to `lua/neo/plugins`, and configures plugin defaults.
- `lua/neo/plugins/*.lua` — Feature-oriented plugin specs:
  - `theme.lua` — colourschemes (catppuccin, tokyonight, kanagawa, everforest, sonokai, gruvbox-material, rose-pine, oasis, koda) and `color-chameleon.nvim` rules.
  - `lsp.lua` — LSP config, conform formatting, nvim-lint, keymaps.
  - `autocmp.lua` — completion setup.
  - `search.lua` — search-related plugins.
  - `git.lua` — Git integration.
  - `uihance.lua`, `lualine.lua`, `trouble.lua`, `foldent.lua`, `codehint.lua`, `misc.lua`, `mine.lua`, `which-key.lua` — UI, status line, diagnostics, folds, hints, keymap helpers, etc.
- `lua/neo/util.lua` — Shared helpers (runtime-path printing, SSH detection, escape key, tmux window creation, dev-plugin loader).
- `lazy-lock.json` — pinned plugin versions.
- `queries/python/folds.scm` — Custom Tree-sitter fold query for Python.
- `spell/` — spell word list and cspell dictionary config.

Additional editor tooling under `nvim/.config/`:

- `go/env` — `GOPROXY=https://goproxy.cn,direct`.
- `pip/pip.conf` — Tsinghua PyPI mirror.
- `lazygit/config.yml` — LazyGit keybindings.
- `neovide/config.toml` — Neovide native tabs on macOS.
- `yamllint/config` — yamllint rules.

### zsh

- `.zshrc` — Oh My Zsh entry point (`ZSH_THEME="robbyrussell"`, plugins git/pip/python/z).
- `.my.zsh` — Custom PATH construction, aliases (`t`, `ta`, `v`, `vx`, `ssh` with TERM, etc.), and environment variables (XDG, Homebrew mirrors, editor).
- `.myutil.zsh` — Helper functions `gitls`, `gitup`, `envproxy`.
- `.zshenv` — Sources cargo environment.
- `.zprofile` — Homebrew shellenv and OrbStack integration.
- `.config/starship.toml` — Starship prompt configuration (ensure Starship is initialised by the shell if you use it).

### bash

- `.bashrc` — Loads `.extend.bashrc` and bash-completion.
- `.extend.bashrc` — Helper functions: archive extractor `ex`, and laptop keyboard disable/enable helpers.

### Other notable configs

- `tmux/.tmux.conf` — Prefix `C-x`, sensible options, true-colour support, TPM plugins including catppuccin theme.
- `wezterm/.config/wezterm/wezterm.lua` — Platform-specific settings for macOS, Linux, and Windows.
- `niri/.config/niri/config.kdl` — Full Niri desktop rules and keybindings; spawns a custom `dms` helper for widgets.
- `hammerspoon/.hammerspoon/` — `init.lua` loads `ime` and `wscrmv` modules for IME switching and window-to-next-screen.
- `docker/compose/` — Self-hosted service stacks, each with its own `docker-compose.yaml`.

## Development conventions and style

- **EditorConfig** (`nvim/.editorconfig`):
  - LF line endings, UTF-8, trim trailing whitespace, final newline.
  - 2-space indent for `js/css/json/yml/yaml/lua/toml`.
  - 4-space indent for Python.
  - Tab indent for Go and Makefiles.
  - Max line length 120.
- **Lua**: formatted with StyLua (`stylua.toml`: 2 spaces).  Selene linting allows Neovim / Hammerspoon globals.
- **Shell**: `.shellcheckrc` disables `SC2086`; helper scripts are POSIX-ish shell.  `shfmt` is used for shell formatting.
- **Git**: `.gitconfig` sets user identity, `editor = nvim`, `pull.ff = only`, and a `git@github.com:` → `ssh://git@ssh.github.com:443/` rewrite.
- **npm**: `prefix=~/.node_modules`, registry `https://registry.npmmirror.com`.
- **pip**: Tsinghua mirror.
- **go**: `GOPROXY=https://goproxy.cn,direct`.
- Plugins are pinned in `lazy-lock.json`; update via `:Lazy sync` or `<leader>vs`.

## Testing and validation

There is **no automated test suite** in this repository.  Recommended validation steps:

- **Stow dry-run** before applying changes: `stow -n -S <pkg>`.
- **Linting / formatting** is performed by editor tooling configured in Neovim:
  - Lua: `stylua`, `selene`.
  - Shell: `shellcheck`, `shfmt`.
  - Markdown: `markdownlint-cli2`, `vale`.
  - YAML: `yamlfmt`, `yamllint`.
  - Python: `ruff`, `basedpyright` / `pyright`.
  - Go, C/C++, JavaScript/TypeScript, JSON, TOML, etc. via `conform.nvim` and `nvim-lint` with the configured LSP servers.
- Manually start the affected application (e.g. `nvim`, `tmux`, `zsh`) after editing its config to check for errors.

## Security considerations

- **SSH client security**: `ssh/.ssh/config` disables `StrictHostKeyChecking` and sets `UserKnownHostsFile=/dev/null` for several private subnets (`192.168.*.*`, `172.20.*.*`, `*.local`, `chaney-*`) and enables `ForwardAgent` for some hosts.  This weakens host verification and introduces agent-forwarding risks; it is only appropriate for trusted private networks.
- **Proxy tooling**: `systemd/.config/systemd/user/clash.service` runs the Clash proxy.  Several Docker Compose stacks also run network/proxy services.  Ensure only trusted clients can reach them.
- **Secrets**: Do not commit passwords, API tokens, private keys, or `git-crypt` keys.  `git-crypt` is listed in package recipes but no encrypted files are visible in the tree.
- **External binaries**: `just nvim-nightly` downloads nightly Neovim binaries from GitHub without checksum verification.  On untrusted networks, verify signatures or use stable packages.
- **Mirrors**: The repository is configured to use third-party package mirrors.  If integrity matters, audit mirror trustworthiness and enable signature verification for `pacman` / AUR packages.
- **User identity**: `nvim/.gitconfig` contains a personal name and email (`chaney / chaneyzorn@gmail.com`); change these before using the config in a different context.
