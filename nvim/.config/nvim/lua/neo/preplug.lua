-- preplug.lua
-- 与插件定制功能相关的配置，在插件载入前配置（纯变量选项配置）
local vg = vim.g;

(function()
  -- https://github.com/lambdalisue/suda.vim/issues/29
  -- vg.suda_smart_edit = 1
end)("lambdalisue/suda.vim");

(function()
  -- 使用 sainnhe/sonokai 色彩方案
  vg.sonokai_style = "andromeda"
  vg.sonokai_enable_italic = 1
  vg.sonokai_disable_italic_comment = 0
  vg.sonokai_transparent_background = 0
  vg.sonokai_sign_column_background = "none"
  vg.sonokai_menu_selection_background = "green"
end)("sainnhe/sonokai");

(function()
  -- 设置高亮单词延时
  vg.Illuminate_delay = 50
  -- 设置在部分 buffer 中不做高亮
  vg.Illuminate_ftblacklist = {
    "nerdtree",
    "NvimTree",
    "qf",
    "help",
    "list",
    "vista",
    "man",
  }
end)("RRethy/vim-illuminate");

(function()
  -- 使用 g:better_whitespace_filetypes_blacklist 无效
  -- https://github.com/ntpeters/vim-better-whitespace/issues/108
  vim.cmd([[ autocmd FileType help DisableWhitespace ]])
  -- 禁用默认 keymap
  vg.better_whitespace_operator = ""
end)("ntpeters/vim-better-whitespace");

(function()
  vg.indent_blankline_char = "┊"
  -- vg.indent_blankline_char_list = {'|', '¦', '┆', '┊'}
  -- 以下类型的 buffer 里不显示缩进线
  vg.indent_blankline_filetype_exclude = { "help", "terminal", "list", "nofile", "make", "go" }
  vg.indent_blankline_buftype_exclude = { "help", "terminal", "list", "nofile" }
  vg.indent_blankline_show_current_context = true
  vg.indent_blankline_context_patterns = {
    "class",
    "function",
    "method",
    "block",
    "list_literal",
    "selector",
    "^if",
    "^table",
    "if_statement",
    "while",
    "for",
  }
end)("lukas-reineke/indent-blankline.nvim");

(function()
  vg.enable_spelunker_vim = 0
  vg.enable_spelunker_vim_on_readonly = 0
  vg.spelunker_target_min_char_len = 3
  vg.spelunker_max_hi_words_each_buf = 500
  vg.spelunker_check_type = 2
  vg.spelunker_disable_uri_checking = 1
  vg.spelunker_disable_email_checking = 1
  vg.spelunker_disable_account_name_checking = 1
  vg.spelunker_disable_acronym_checking = 1
  vg.spelunker_disable_backquoted_checking = 0

  vg.spelunker_spell_bad_group = "SpellBad"
  vg.spelunker_complex_or_compound_word_group = "SpellBad"
end)("kamykn/spelunker.vim");

(function()
  -- │
  vg.signify_sign_add = "▎"
  vg.signify_sign_delete = "▎"
  vg.signify_sign_delete_first_line = ""
  vg.signify_sign_change = "▎"
end)("mhinz/vim-signify");

(function()
  vg.blamer_enabled = 1
  vg.blamer_show_in_visual_modes = 0
  vg.blamer_show_in_insert_modes = 0

  vg.blamer_delay = 1000
  vg.blamer_prefix = "    "
  vg.blamer_template = "<committer-time>   <author>   <summary>"
  vg.blamer_date_format = "%Y/%m/%d"
end)("APZelos/blamer.nvim");

(function()
  vg.SuperTabDefaultCompletionType = "<c-n>"
end)("ervandew/supertab");

(function()
  -- 不使用默认的键位
  -- vg.NERDCreateDefaultMappings = 0
  -- 空格间隔，比如 /* int foo=2; */
  vg.NERDSpaceDelims = 1
  vg.NERDRemoveExtraSpaces = 1
  -- 取消空白行注释时，连同去掉多余的空格
  vg.NERDTrimTrailingWhitespace = 1
  -- 按代码左对齐注释
  vg.NERDDefaultAlign = "left"
  -- 将空行一起处理
  vg.NERDCommentEmptyLines = 1
  -- 检查并注释选中范围中未注释的行
  vg.NERDToggleCheckAllLines = 1
end)("scrooloose/nerdcommenter");

(function()
  vg.translator_default_engines = { "bing", "youdao", "haici" }
end)("voldikss/vim-translator");

(function()
  vg.nvim_tree_side = "left"
  vg.nvim_tree_width = 30
  vg.nvim_tree_quit_on_open = 0
  vg.nvim_tree_indent_markers = 1
  vg.nvim_tree_git_hl = 1
  vg.nvim_tree_root_folder_modifier = ":~"
  vg.nvim_tree_width_allow_resize = 1
  vg.nvim_tree_show_icons = { git = 1, folders = 1, files = 1 }

  vg.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "",
      staged = "",
      unmerged = "",
      renamed = "➜",
      untracked = "六",
    },
    folder = { default = "", open = "", symlink = "" },
  }
end)("kyazdani42/nvim-tree.lua");

(function()
  vg.fzf_layout = {
    window = {
      width = 0.9,
      height = 0.9,
    },
  }
end)("junegunn/fzf.vim");

(function()
  -- 大纲列表不延迟
  vg.vista_cursor_delay = 0
  vg.vista_executive_for = { python = "coc" }
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
  vg.floaterm_keymap_new = "<Leader>tr"
  vg.floaterm_keymap_prev = "<Leader>["
  vg.floaterm_keymap_next = "<Leader>]"
  vg.floaterm_keymap_toggle = "<Leader>tt"
end)("voldikss/vim-floaterm");

(function()
  vg.neoformat_enabled_python = { "black" }
  -- 默认格式化对齐
  vg.neoformat_basic_format_align = 1
  -- 默认转换 tab 字符为空格
  vg.neoformat_basic_format_retab = 1
  -- 默认去掉行尾空格
  vg.neoformat_basic_format_trim = 1
end)("sbdchd/neoformat");

(function()
  vg.go_def_reuse_buffer = 1
  vg.go_fmt_autosave = 0
end)("fatih/vim-go");

(function()
  vg.ale_enabled = 0
  vg.ale_disable_lsp = 1
  vg.ale_set_highlights = 0
  vg.ale_echo_msg_format = "%severity% ⏽ %linter% ⏽ %code% ⏽ %s"

  vg.ale_sign_column_always = 1
  vg.ale_sign_error = ""
  vg.ale_sign_warning = ""
  vg.ale_sign_info = ""
  vg.ale_echo_msg_error_str = ""
  vg.ale_echo_msg_warning_str = ""
  vg.ale_echo_msg_info_str = ""

  vg.ale_completion_delay = 500
  vg.ale_echo_delay = 20
  vg.ale_lint_delay = 500
  vg.ale_lint_on_text_changed = "normal"
  vg.ale_lint_on_insert_leave = 1

  -- compile_commands.json still not work well with clang easily
  -- see https://github.com/w0rp/ale/issues/1163#issuecomment-352585720
  vg.ale_c_build_dir_names = { "build", "debug", "bin" }
  vg.ale_c_parse_compile_commands = 1

  -- see https://github.com/MaskRay/ccls/wiki/Customization
  vg.ale_c_ccls_init_options = { cacheDirectory = "~/.cache/ccls" }

  -- 未明确指定 linter 的依然会使用全部可能的linter
  -- 除非 vg.ale_linters_explicit = 1
  -- 显示指定要使用的 linter
  vg.ale_linters = {
    c = { "clangtidy", "ccls", "cppcheck" },
    cpp = { "clangtidy", "ccls", "cppcheck" },
    go = { "golangci-lint" },
    javascript = { "eslint" },
  }

  -- 使用全局 pylint，这样可以使用 venv 中对应版本的 pylint
  vg.ale_python_pylint_use_global = 1
  vg.ale_python_pylint_auto_pipenv = 1
  vg.ale_python_pylint_options = "--rcfile ~/.config/pylintrc"

  vg.ale_go_golangci_lint_options = "--enable-all --disable wsl --disalbe gofumpt"
end)("w0rp/ale");

(function()
  vg.coc_start_at_startup = 0
  vg.coc_global_extensions = {
    "coc-css",
    "coc-dictionary",
    "coc-emoji",
    "coc-eslint",
    "coc-go",
    "coc-jedi",
    "coc-json",
    "coc-lists",
    "coc-marketplace",
    "coc-prettier",
    "coc-rust-analyzer",
    "coc-snippets",
    "coc-syntax",
    "coc-tsserver",
    "coc-vimlsp",
    "coc-word",
    "coc-yaml",
  }
end)("neoclide/coc.nvim")
