-- preplug.lua
-- 与插件定制功能相关的配置，在插件载入前配置（纯变量选项配置）
(function()
  -- 使用 neovim 浮动窗口展示快捷键提示
  vim.g.which_key_use_floating_win = 1
end)("liuchengxu/vim-which-key");

(function()
  -- https://github.com/lambdalisue/suda.vim/issues/29
  -- vim.g.suda_smart_edit = 1
end)("lambdalisue/suda.vim");

(function()
  -- 状态栏使用 powerline 字体
  vim.g.airline_powerline_fonts = 1
  -- 选择一个状态栏主题
  vim.g.airline_theme = "minimalist"
  -- 显示 ale 诊断信
  vim.g["airline#extensions#ale#enabled"] = 1
end)("vim-airline/vim-airline", "vim-airline/vim-airline-themes");

(function()
  -- 使用 space-vim-theme 色彩方案
  vim.g.space_vim_italic = 1
  vim.g.space_vim_italicize_strings = 0
  vim.g.space_vim_plugin_hi_groups = 1
  vim.g.space_vim_transp_bg = 1
end)("liuchengxu/space-vim-theme");

(function()
  -- 设置高亮单词延时
  vim.g.Illuminate_delay = 50
  -- 设置在部分 buffer 中不做高亮
  vim.g.Illuminate_ftblacklist = {
    "nerdtree",
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
  vim.g.vim_markdown_conceal = 0
  vim.g.vim_markdown_conceal_code_blocks = 0
  -- 禁用空格警告，因为它会在插入模式也高亮, 我们使用 vim-better-whitespace
  vim.g.python_highlight_space_errors = 0
end)("sheerun/vim-polyglot");

(function()
  -- 使用 g:better_whitespace_filetypes_blacklist 无效
  -- https://github.com/ntpeters/vim-better-whitespace/issues/108
  vim.cmd [[ autocmd FileType help DisableWhitespace ]]
end)("ntpeters/vim-better-whitespace");

(function()
  -- 自动启用彩虹括号，设置为0以手动启用
  vim.g.rainbow_active = 1
  vim.g.rainbow_conf = {
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
  vim.g.AutoPairsMapBS = 0
end)("jiangmiao/auto-pairs");

(function()
  -- 缩进线颜色
  vim.g.indentLine_color_term = 239
  vim.g.indentLine_color_gui = "#626262"
  -- vim.g.indentLine_char = "┊"
  -- 以下类型的 buffer 里不显示缩进线
  vim.g.indentLine_bufTypeExclude = {"help", "terminal", "list", "nofile"}
end)("Yggdroot/indentLine");

(function()
  vim.g.enable_spelunker_vim = 0
  vim.g.enable_spelunker_vim_on_readonly = 0
  vim.g.spelunker_target_min_char_len = 3
  vim.g.spelunker_max_hi_words_each_buf = 500
  vim.g.spelunker_check_type = 2
  vim.g.spelunker_disable_uri_checking = 1
  vim.g.spelunker_disable_email_checking = 1
  vim.g.spelunker_disable_account_name_checking = 1
  vim.g.spelunker_disable_acronym_checking = 1
  vim.g.spelunker_disable_backquoted_checking = 0

  vim.g.spelunker_spell_bad_group = "SpellBad"
  vim.g.spelunker_complex_or_compound_word_group = "SpellBad"
end)("kamykn/spelunker.vim");

(function()
  vim.g.blamer_enabled = 1
  vim.g.blamer_show_in_visual_modes = 0
  vim.g.blamer_show_in_insert_modes = 0

  vim.g.blamer_delay = 1000
  vim.g.blamer_prefix = "    "
  vim.g.blamer_template = "<committer-time> • <author>   <summary>"
  vim.g.blamer_date_format = "%Y/%m/%d"
end)("APZelos/blamer.nvim");

(function()
  vim.g.SuperTabDefaultCompletionType = "<c-n>"
end)("ervandew/supertab");

(function()
  -- 不使用默认的键位
  -- vim.g.NERDCreateDefaultMappings = 0
  -- 空格间隔，比如 /* int foo=2; */
  vim.g.NERDSpaceDelims = 1
  vim.g.NERDRemoveExtraSpaces = 1
  -- 取消空白行注释时，连同去掉多余的空格
  vim.g.NERDTrimTrailingWhitespace = 1
  -- 按代码左对齐注释
  vim.g.NERDDefaultAlign = "left"
  -- 将空行一起处理
  vim.g.NERDCommentEmptyLines = 1
  -- 检查并注释选中范围中未注释的行
  vim.g.NERDToggleCheckAllLines = 1
end)("scrooloose/nerdcommenter");

(function()
  -- 不使用预设快捷键
  vim.g.vtm_default_mapping = 0
  vim.g.vtm_default_engines = {"youdao", "ciba", "bing"}
end)("voldikss/vim-translate-me");

(function()
end)("ryanoasis/vim-devicons");

(function()
  -- 不显示书签和帮助
  vim.g.NERDTreeMinimalUI = 1
  -- 默认显示隐藏文件
  vim.g.NERDTreeShowHidden = 1
  -- 展开字符
  vim.g.NERDTreeDirArrowExpandable = ""
  vim.g.NERDTreeDirArrowCollapsible = ""
  -- 忽略以下类型文件
  vim.g.NERDTreeIgnore = {
    [[\~$]],
    [[\.swp$]],
    [[\.pyc$]],
    [[\.git$]],
    [[\.idea$]],
    [[\.ropeproject$]],
  }

  vim.cmd [[autocmd FileType nerdtree setlocal signcolumn=no]]
end)("scrooloose/nerdtree");

(function()
  -- 默认提供的大纲
  vim.g.vista_executive_for = {python = "coc", go = "coc"}
  -- 大纲列表不延迟
  vim.g.vista_cursor_delay = 0
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
end)("voldikss/vim-floaterm");

(function()
  vim.g.neoformat_enabled_python = {"autopep8", "yapf", "docformatter"}
  -- 默认格式化对齐
  vim.g.neoformat_basic_format_align = 1
  -- 默认转换 tab 字符为空格
  vim.g.neoformat_basic_format_retab = 1
  -- 默认去掉行尾空格
  vim.g.neoformat_basic_format_trim = 1
end)("sbdchd/neoformat");

(function()
  -- 纵向分割
  vim.g.UltiSnipsEditSplit = "vertical"
  vim.g.UltiSnipsSnippetsDir = vim.fn.stdpath("config") .. "/moetools/UltiSnips"
end)("SirVer/ultisnips");

(function()
end)("kkoomen/vim-doge");

(function()
  vim.g.vimade = {}
  vim.g.vimade.fadelevel = 0.6
end)("TaDaa/vimade");

(function()
  vim.g.Lf_WindowPosition = "popup"
  vim.g.Lf_PopupHeight = 0.75
  vim.g.Lf_PreviewInPopup = 1

  vim.cmd [[autocmd FileType leaderf setlocal signcolumn=no]]

  vim.g.Lf_UseCache = 0
  vim.g.Lf_ShowHidden = 1
  vim.g.Lf_HideHelp = 1
  vim.g.Lf_WindowHeight = 0.30
  vim.g.Lf_StlColorscheme = "default"
  vim.g.Lf_StlSeparator = {left = "", right = ""}
  vim.g.Lf_CacheDirectory = vim.fn.expand("~/.vim/cache")

  vim.g.Lf_RootMarkers = {".root", ".svn", ".git", ".hg", ".idea", ".project"}
  vim.g.Lf_WildIgnore = {
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

  vim.g.Lf_RgConfig = {"--glob=!node_modules/*", "--glob=!.git/*", "--hidden"}

  vim.g.Lf_MruMaxFiles = 2048
  vim.g.Lf_MruFileExclude = {
    "*.so",
    "*.exe",
    "*.py[co]",
    "*.sw?",
    "~$*",
    "*.bak",
    "*.tmp",
    "*.dll",
  }

  vim.g.Lf_PreviewResult = {Function = 0, BufTag = 0}

  vim.g.Lf_PopupPalette = {
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
  -- 使用 coc 的补全
  vim.g["jedi#auto_vim_configuration"] = 0
  vim.g["jedi#completions_enabled"] = 0
end)("davidhalter/jedi-vim");

(function()
  -- 不使用默认键位
  vim.g.gutentags_plus_nomap = 1
  -- 使用 pygments 辅助 gtags 支持更多的语言
  vim.env.GTAGSLABEL = "native-pygments"
  vim.env.GTAGSCONF = "/usr/share/gtags/gtags.conf"
  -- gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
  vim.g.gutentags_project_root = {".root", ".svn", ".git", ".hg", ".project"}
  -- 所生成的数据文件的名称
  vim.g.gutentags_ctags_tagfile = ".tags"
  -- 同时开启 ctags 和 gtags 支持：
  vim.g.gutentags_modules = {"ctags", "gtags_cscope"}

  -- 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
  vim.g.gutentags_cache_dir = vim.fn.expand("~/.cache/tags")
  -- 禁用 gutentags 自动加载 gtags 数据库的行为
  vim.g.gutentags_auto_add_gtags_cscope = 0

  -- 配置 ctags 的参数
  vim.g.gutentags_ctags_extra_args = {
    "--fields=+niazS",
    "--extra=+q",
    "--c++-kinds=+px",
    "--c-kinds=+px",
    "--output-format=e-ctags",
  }
end)("ludovicchabant/vim-gutentags", "skywind3000/gutentags_plus");

(function()
  vim.g.go_def_reuse_buffer = 1
end)("fatih/vim-go");

(function()
  vim.g.ale_disable_lsp = 1
  vim.g.ale_set_highlights = 0
  vim.g.ale_echo_msg_format = "[👻%linter%] %code:% %s [%severity%]"

  vim.g.ale_sign_column_always = 1
  vim.g.ale_sign_error = "✘"
  vim.g.ale_sign_warning = "❗"
  vim.g.ale_sign_info = "➽"
  vim.g.ale_echo_msg_error_str = "✘ Error"
  vim.g.ale_echo_msg_warning_str = "❗Warning"
  vim.g.ale_echo_msg_info_str = "➽ Info"

  vim.g.ale_completion_delay = 500
  vim.g.ale_echo_delay = 20
  vim.g.ale_lint_delay = 500
  vim.g.ale_lint_on_text_changed = "normal"
  vim.g.ale_lint_on_insert_leave = 1

  -- compile_commands.json still not work well with clang easily
  -- see https://github.com/w0rp/ale/issues/1163#issuecomment-352585720
  vim.g.ale_c_build_dir_names = {"build", "debug", "bin"}
  vim.g.ale_c_parse_compile_commands = 1

  -- see https://github.com/MaskRay/ccls/wiki/Customization
  vim.g.ale_c_ccls_init_options = {cacheDirectory = "~/.cache/ccls"}

  -- 未明确指定 linter 的依然会使用全部可能的linter
  -- 除非 vim.g.ale_linters_explicit = 1
  -- 显示指定要使用的 linter
  vim.g.ale_linters = {
    c = {"clangtidy", "ccls", "cppcheck"},
    cpp = {"clangtidy", "ccls", "cppcheck"},
    go = {"golangci-lint"},
    javascript = {"eslint"},
  }

  -- 使用全局 pylint，这样可以使用 venv 中对应版本的 pylint
  vim.g.ale_python_pylint_use_global = 1
  vim.g.ale_python_pylint_options = "--rcfile ~/.config/pylintrc"
  -- 错误信息使用 pep8 msg_id
  vim.g.ale_python_pylint_use_msg_id = 1

  vim.g.ale_go_golangci_lint_options =
    "--enable-all --disable wsl --disalbe gofumpt"
end)("w0rp/ale");

(function()
  vim.g.coc_global_extensions = {
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
