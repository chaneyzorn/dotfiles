-- preplug.lua
-- 与插件定制功能相关的配置，在插件载入前配置（纯变量选项配置）
local gg = vim.g;

(function()
  -- 使用 neovim 浮动窗口展示快捷键提示
  gg.which_key_use_floating_win = 1
end)("liuchengxu/vim-which-key");

(function()
  -- https://github.com/lambdalisue/suda.vim/issues/29
  -- gg.suda_smart_edit = 1
end)("lambdalisue/suda.vim");

(function()
  -- 状态栏使用 powerline 字体
  gg.airline_powerline_fonts = 1
  -- 选择一个状态栏主题
  gg.airline_theme = "minimalist"
  -- 显示 ale 诊断信
  vim.g["airline#extensions#ale#enabled"] = 1
end)("vim-airline/vim-airline", "vim-airline/vim-airline-themes");

(function()
  -- 使用 space-vim-theme 色彩方案
  gg.space_vim_italic = 1
  gg.space_vim_italicize_strings = 0
  gg.space_vim_plugin_hi_groups = 1
  gg.space_vim_transp_bg = 1
end)("liuchengxu/space-vim-theme");

(function()
  -- 设置高亮单词延时
  gg.Illuminate_delay = 50
  -- 设置在部分 buffer 中不做高亮
  gg.Illuminate_ftblacklist = {
    "nerdtree",
    "NvimTree",
    "qf",
    "leaderf",
    "help",
    "list",
    "vista",
    "man",
  }
end)("RRethy/vim-illuminate");

(function()
  -- "插件是一系列语法高亮插件的合集，具体设置项需要参见各自插件的文"
  -- markdown 语法高亮时，不隐藏标记符号
  gg.vim_markdown_conceal = 0
  gg.vim_markdown_conceal_code_blocks = 0
  -- 禁用空格警告，因为它会在插入模式也高亮, 我们使用 vim-better-whitespace
  gg.python_highlight_space_errors = 0
end)("sheerun/vim-polyglot");

(function()
  -- 使用 g:better_whitespace_filetypes_blacklist 无效
  -- https://github.com/ntpeters/vim-better-whitespace/issues/108
  vim.cmd [[ autocmd FileType help DisableWhitespace ]]
end)("ntpeters/vim-better-whitespace");

(function()
  -- 自动启用彩虹括号，设置为0以手动启用
  gg.rainbow_active = 1
  gg.rainbow_conf = {
    guifgs = {
      "tan",
      "PaleGreen",
      "SkyBlue",
      "gold",
      "orchid",
      "orange",
      "Fuchsia",
      "ivory",
    },
    separately = {nerdtree = 0},
  }
end)("luochen1990/rainbow");

(function()
  -- 禁用自动回退匹配字符，在vimrc中常常误退掉注释符引号
  gg.AutoPairsMapBS = 0
end)("jiangmiao/auto-pairs");

(function()
  -- 缩进线颜色
  gg.indentLine_color_term = 239
  gg.indentLine_color_gui = "#626262"
  -- gg.indentLine_char = "┊"
  -- 以下类型的 buffer 里不显示缩进线
  gg.indentLine_bufTypeExclude = {"help", "terminal", "list", "nofile"}
end)("Yggdroot/indentLine");

(function()
  gg.enable_spelunker_vim = 0
  gg.enable_spelunker_vim_on_readonly = 0
  gg.spelunker_target_min_char_len = 3
  gg.spelunker_max_hi_words_each_buf = 500
  gg.spelunker_check_type = 2
  gg.spelunker_disable_uri_checking = 1
  gg.spelunker_disable_email_checking = 1
  gg.spelunker_disable_account_name_checking = 1
  gg.spelunker_disable_acronym_checking = 1
  gg.spelunker_disable_backquoted_checking = 0

  gg.spelunker_spell_bad_group = "SpellBad"
  gg.spelunker_complex_or_compound_word_group = "SpellBad"
end)("kamykn/spelunker.vim");

(function()
  gg.blamer_enabled = 1
  gg.blamer_show_in_visual_modes = 0
  gg.blamer_show_in_insert_modes = 0

  gg.blamer_delay = 1000
  gg.blamer_prefix = "    "
  gg.blamer_template = "<committer-time>   <author>   <summary>"
  gg.blamer_date_format = "%Y/%m/%d"
end)("APZelos/blamer.nvim");

(function()
  gg.SuperTabDefaultCompletionType = "<c-n>"
end)("ervandew/supertab");

(function()
  -- 不使用默认的键位
  -- gg.NERDCreateDefaultMappings = 0
  -- 空格间隔，比如 /* int foo=2; */
  gg.NERDSpaceDelims = 1
  gg.NERDRemoveExtraSpaces = 1
  -- 取消空白行注释时，连同去掉多余的空格
  gg.NERDTrimTrailingWhitespace = 1
  -- 按代码左对齐注释
  gg.NERDDefaultAlign = "left"
  -- 将空行一起处理
  gg.NERDCommentEmptyLines = 1
  -- 检查并注释选中范围中未注释的行
  gg.NERDToggleCheckAllLines = 1
end)("scrooloose/nerdcommenter");

(function()
  -- 不使用预设快捷键
  gg.vtm_default_mapping = 0
  gg.vtm_default_engines = {"youdao", "ciba", "bing"}
end)("voldikss/vim-translate-me");

(function()
  gg.nvim_tree_side = 'left'
  gg.nvim_tree_width = 30
  gg.nvim_tree_ignore = {
    "*.swp",
    "*.pyc",
    ".git",
    ".idea",
    ".ropeproject",
    "node_modules",
  }
  gg.nvim_tree_auto_open = 1
  gg.nvim_tree_auto_close = 1
  gg.nvim_tree_quit_on_open = 0
  gg.nvim_tree_follow = 1
  gg.nvim_tree_indent_markers = 1
  gg.nvim_tree_hide_dotfiles = 0
  gg.nvim_tree_git_hl = 1
  gg.nvim_tree_root_folder_modifier = ':~'
  gg.nvim_tree_tab_open = 1
  gg.nvim_tree_width_allow_resize = 1
  gg.nvim_tree_show_icons = {git = 1, folders = 1, files = 1}

  gg.nvim_tree_bindings = {
    edit = {'<CR>', 'o'},
    edit_vsplit = '<C-v>',
    edit_split = '<C-x>',
    edit_tab = '<C-t>',
    close_node = {'<S-CR>', '<BS>'},
    toggle_ignored = 'I',
    toggle_dotfiles = 'H',
    refresh = 'R',
    preview = '<Tab>',
    cd = '<C-]>',
    create = 'a',
    remove = 'd',
    rename = 'r',
    cut = 'x',
    copy = 'c',
    paste = 'p',
    prev_git_item = '[c',
    next_git_item = ']c',
  }

  gg.nvim_tree_disable_keybindings = 0

  gg.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
      unstaged = "",
      staged = "",
      unmerged = "",
      renamed = "➜",
      untracked = "六",
    },
    folder = {default = "", open = "", symlink = ""},
  }

  -- vim.cmd [[autocmd FileType NvimTree setlocal signcolumn=no]]
end)("kyazdani42/nvim-tree.lua");

(function()
  -- 默认提供的大纲
  gg.vista_executive_for = {python = "coc", go = "coc"}
  -- 大纲列表不延迟
  gg.vista_cursor_delay = 0
  -- 大纲列表图标
  vim.g["vista#renderer#icons"] = {
    ["augroup"] = "⋐",
    ["class"] = "𝒞",
    ["const"] = "🅲",
    ["constant"] = "🅲",
    ["default"] = "⎅",
    ["enum"] = "☷",
    ["enumerator"] = "☷",
    ["field"] = "⚆",
    ["fields"] = "⚇",
    ["func"] = "𝑓",
    ["function"] = "𝑓",
    ["functions"] = "𝑓",
    ["implementation"] = "⛣",
    ["interface"] = "⚯",
    ["macro"] = "☢",
    ["macros"] = "☢",
    ["map"] = "❴❵",
    ["member"] = "☌",
    ["method"] = "𝑚",
    ["module"] = "⬢",
    ["modules"] = "⬢",
    ["namespace"] = "",
    ["package"] = "⯄",
    ["packages"] = "⯄",
    ["property"] = "襁",
    ["struct"] = "❴❵",
    ["subroutine"] = "⥹",
    ["target"] = "🞉",
    ["type"] = "𝒯",
    ["typedef"] = "𝒯",
    ["typeParameter"] = "𝒫",
    ["types"] = "𝒯",
    ["union"] = "⚉",
    ["var"] = "𝜈",
    ["variable"] = "𝜈",
    ["variables"] = "𝜈",
  }
end)("liuchengxu/vista.vim");

(function()
  -- floaterm 快捷键配置
  gg.floaterm_keymap_new = "<Leader>tr"
  gg.floaterm_keymap_prev = "<Leader>["
  gg.floaterm_keymap_next = "<Leader>]"
  gg.floaterm_keymap_toggle = "<Leader>tt"
end)("voldikss/vim-floaterm");

(function()
  gg.neoformat_enabled_python = {"autopep8", "yapf", "docformatter"}
  -- 默认格式化对齐
  gg.neoformat_basic_format_align = 1
  -- 默认转换 tab 字符为空格
  gg.neoformat_basic_format_retab = 1
  -- 默认去掉行尾空格
  gg.neoformat_basic_format_trim = 1
end)("sbdchd/neoformat");

(function()
  gg.UltiSnipsExpandTrigger = "<S-TAB>"
  gg.UltiSnipsJumpForwardTrigger = "<TAB>"
  gg.UltiSnipsJumpBackwardTrigger = "<S-TAB>"

  -- 纵向分割
  gg.UltiSnipsEditSplit = "vertical"
  gg.UltiSnipsSnippetsDir = vim.fn.stdpath("config") .. "/moetools/UltiSnips"
end)("SirVer/ultisnips");

(function()
  gg.doge_mapping = "<Leader>cd"
end)("kkoomen/vim-doge");

(function()
  gg.vimade = {}
  gg.vimade.fadelevel = 0.6
end)("TaDaa/vimade");

(function()
  gg.Lf_ShortcutB = "<Leader>fb"
  gg.Lf_ShortcutF = "<Leader>ff"

  gg.Lf_WindowPosition = "popup"
  gg.Lf_PopupHeight = 0.75
  gg.Lf_PreviewInPopup = 1
  gg.Lf_ShowHidden = 1
  gg.Lf_HideHelp = 1
  gg.Lf_WindowHeight = 0.30
  gg.Lf_StlColorscheme = "default"
  gg.Lf_StlSeparator = {left = "", right = ""}

  vim.cmd [[autocmd FileType leaderf setlocal signcolumn=no]]

  gg.Lf_UseCache = 0
  gg.Lf_CacheDirectory = vim.fn.expand("~/.vim/cache")
  gg.Lf_RootMarkers = {".root", ".svn", ".git", ".hg", ".idea", ".project"}
  gg.Lf_WildIgnore = {
    dir = {
      ".svn",
      ".git",
      ".hg",
      "build",
      "debug",
      ".idea",
      ".ropeproject",
      "vendor",
    },
    file = {"*.sw?", "~$*", "*.bak", "*.exe", "*.o", "*.so", "*.py[co]"},
  }

  gg.Lf_RgConfig = {"--glob=!node_modules/*", "--glob=!.git/*", "--hidden"}

  gg.Lf_MruMaxFiles = 2048
  gg.Lf_MruFileExclude = {
    "*.so",
    "*.exe",
    "*.py[co]",
    "*.sw?",
    "~$*",
    "*.bak",
    "*.tmp",
    "*.dll",
  }

  gg.Lf_PreviewResult = {Function = 0, BufTag = 0}

  gg.Lf_PopupPalette = {
    dark = {
      Lf_hl_popup_inputText = {
        gui = "NONE",
        font = "NONE",
        guifg = "#B2B2B2",
        guibg = "#3B3E4C",
        cterm = "NONE",
        ctermfg = "172",
        ctermbg = "238",
      },
      Lf_hl_popup_window = {
        gui = "NONE",
        font = "NONE",
        guifg = "#B2B2B2",
        guibg = "#133C46",
        cterm = "NONE",
        ctermfg = "173",
        ctermbg = "233",
      },
      Lf_hl_pop_cursorline = {
        gui = "NONE",
        font = "NONE",
        guifg = "#B2B2B2",
        guibg = "#2D333E",
        cterm = "NONE",
        ctermfg = "173",
        ctermbg = "233",
      },
      Lf_hl_popup_category = {
        gui = "NONE",
        font = "NONE",
        guifg = "#000000",
        guibg = "#F28379",
        cterm = "NONE",
        ctermfg = "16",
        ctermbg = "210",
      },
      Lf_hl_popup_nameOnlyMode = {
        gui = "NONE",
        font = "NONE",
        guifg = "#000000",
        guibg = "#E8ED51",
        cterm = "NONE",
        ctermfg = "16",
        ctermbg = "227",
      },
      Lf_hl_popup_fullPathMode = {
        gui = "NONE",
        font = "NONE",
        guifg = "#000000",
        guibg = "#AAAAFF",
        cterm = "NONE",
        ctermfg = "16",
        ctermbg = "147",
      },
      Lf_hl_popup_fuzzyMode = {
        gui = "NONE",
        font = "NONE",
        guifg = "#000000",
        guibg = "#E8ED51",
        cterm = "NONE",
        ctermfg = "16",
        ctermbg = "227",
      },
      Lf_hl_popup_regexMode = {
        gui = "NONE",
        font = "NONE",
        guifg = "#000000",
        guibg = "#7FECAD",
        cterm = "NONE",
        ctermfg = "16",
        ctermbg = "121",
      },
      Lf_hl_popup_cwd = {
        gui = "NONE",
        font = "NONE",
        guifg = "#EBFFEF",
        guibg = "#606168",
        cterm = "NONE",
        ctermfg = "195",
        ctermbg = "241",
      },
      Lf_hl_popup_blank = {
        gui = "NONE",
        font = "NONE",
        guifg = "NONE",
        guibg = "#3B3E4C",
        cterm = "NONE",
        ctermfg = "NONE",
        ctermbg = "237",
      },
      Lf_hl_popup_spin = {
        gui = "NONE",
        font = "NONE",
        guifg = "#E6E666",
        guibg = "#3B3E4C",
        cterm = "NONE",
        ctermfg = "185",
        ctermbg = "237",
      },
      Lf_hl_popup_lineInfo = {
        gui = "NONE",
        font = "NONE",
        guifg = "#EEEEEE",
        guibg = "#606168",
        cterm = "NONE",
        ctermfg = "16",
        ctermbg = "195",
      },
      Lf_hl_popup_total = {
        gui = "NONE",
        font = "NONE",
        guifg = "#000000",
        guibg = "#16D5B6",
        cterm = "NONE",
        ctermfg = "16",
        ctermbg = "149",
      },
    },
  }
end)("Yggdroot/LeaderF");

(function()
  -- 不使用默认键位
  gg.gutentags_plus_nomap = 1
  -- 使用 pygments 辅助 gtags 支持更多的语言
  vim.env.GTAGSLABEL = "native-pygments"
  vim.env.GTAGSCONF = "/usr/share/gtags/gtags.conf"
  -- gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
  gg.gutentags_project_root = {".root", ".svn", ".git", ".hg", ".project"}
  -- 所生成的数据文件的名称
  gg.gutentags_ctags_tagfile = ".tags"
  -- 同时开启 ctags 和 gtags 支持：
  gg.gutentags_modules = {"ctags", "gtags_cscope"}

  -- 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
  gg.gutentags_cache_dir = vim.fn.expand("~/.cache/tags")
  -- 禁用 gutentags 自动加载 gtags 数据库的行为
  gg.gutentags_auto_add_gtags_cscope = 0

  -- 配置 ctags 的参数
  gg.gutentags_ctags_extra_args = {
    "--fields=+niazS",
    "--extra=+q",
    "--c++-kinds=+px",
    "--c-kinds=+px",
    "--output-format=e-ctags",
  }
end)("ludovicchabant/vim-gutentags", "skywind3000/gutentags_plus");

(function()
  gg.go_def_reuse_buffer = 1
end)("fatih/vim-go");

(function()
  gg.ale_disable_lsp = 1
  gg.ale_set_highlights = 0
  gg.ale_echo_msg_format = "%severity% ⏽ %linter% ⏽ %s (%code%)"

  gg.ale_sign_column_always = 1
  gg.ale_sign_error = ""
  gg.ale_sign_warning = ""
  gg.ale_sign_info = ""
  gg.ale_echo_msg_error_str = "  ERROR"
  gg.ale_echo_msg_warning_str = "  WARNING"
  gg.ale_echo_msg_info_str = "  INFO"

  gg.ale_completion_delay = 500
  gg.ale_echo_delay = 20
  gg.ale_lint_delay = 500
  gg.ale_lint_on_text_changed = "normal"
  gg.ale_lint_on_insert_leave = 1

  -- compile_commands.json still not work well with clang easily
  -- see https://github.com/w0rp/ale/issues/1163#issuecomment-352585720
  gg.ale_c_build_dir_names = {"build", "debug", "bin"}
  gg.ale_c_parse_compile_commands = 1

  -- see https://github.com/MaskRay/ccls/wiki/Customization
  gg.ale_c_ccls_init_options = {cacheDirectory = "~/.cache/ccls"}

  -- 未明确指定 linter 的依然会使用全部可能的linter
  -- 除非 gg.ale_linters_explicit = 1
  -- 显示指定要使用的 linter
  gg.ale_linters = {
    c = {"clangtidy", "ccls", "cppcheck"},
    cpp = {"clangtidy", "ccls", "cppcheck"},
    go = {"golangci-lint"},
    javascript = {"eslint"},
  }

  -- 使用全局 pylint，这样可以使用 venv 中对应版本的 pylint
  gg.ale_python_pylint_use_global = 1
  gg.ale_python_pylint_options = "--rcfile ~/.config/pylintrc"
  -- 错误信息使用 pep8 msg_id
  gg.ale_python_pylint_use_msg_id = 1

  gg.ale_go_golangci_lint_options =
    "--enable-all --disable wsl --disalbe gofumpt"
end)("w0rp/ale");

(function()
  gg.coc_global_extensions = {
    "coc-tsserver",
    "coc-eslint",
    "coc-prettier",
    "coc-css",
    "coc-json",
    "coc-vimlsp",
    "coc-yaml",
    "coc-snippets",
    "coc-python",
    "coc-lists",
    "coc-marketplace",
    "coc-pairs",
    "coc-dictionary",
    "coc-word",
    "coc-emoji",
    "coc-syntax",
    "coc-go",
    "coc-rust-analyzer",
    "coc-explorer",
  }
end)("neoclide/coc.nvim");
