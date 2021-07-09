-- postplug.lua
-- 与插件定制功能相关的配置，在插件载入后配置（调用型的配置）
(function()
  -- colorscheme space_vim_theme
  vim.api.nvim_exec([[
    colorscheme sonokai

    hi Floaterm             guibg=NONE
    hi FloatermBorder       guibg=NONE      guifg=gray
    hi clear TSError
  ]], false)
end)('liuchengxu/space-vim-theme');

(function()
  -- 使用下划线标记光标下相同的单词
  vim.api.nvim_exec([[
    augroup illuminate_augroup
      autocmd!
      autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
    augroup END
  ]], false)
end)('RRethy/vim-illuminate');

(function()
  require('colorizer').setup()
end)('norcalli/nvim-colorizer.lua');

(function()
  -- xfce4/terminal/colorschemes/chaney_dark.theme
  vim.g.terminal_color_0 = "#073642"
  vim.g.terminal_color_1 = "#dc322f"
  vim.g.terminal_color_2 = "#EBCB8B"
  vim.g.terminal_color_3 = "#AAB288"
  vim.g.terminal_color_4 = "#9DA786"
  vim.g.terminal_color_5 = "#d33682"
  vim.g.terminal_color_6 = "#16D5B6"
  vim.g.terminal_color_7 = "#eee8d5"
  vim.g.terminal_color_8 = "#22444D"
  vim.g.terminal_color_9 = "#cb4b16"
  vim.g.terminal_color_10 = "#586e75"
  vim.g.terminal_color_11 = "#657b83"
  vim.g.terminal_color_12 = "#839496"
  vim.g.terminal_color_13 = "#6c71c4"
  vim.g.terminal_color_14 = "#93a1a1"
  vim.g.terminal_color_15 = "#fdf6e3"

  vim.g.terminal_ansi_colors = {
    "#073642",
    "#dc322f",
    "#EBCB8B",
    "#AAB288",
    "#9DA786",
    "#d33682",
    "#16D5B6",
    "#eee8d5",
    "#22444D",
    "#cb4b16",
    "#586e75",
    "#657b83",
    "#839496",
    "#6c71c4",
    "#93a1a1",
    "#fdf6e3",
  }
end)('build-in terminal color');

(function()
  require('bufferline').setup {
    options = {
      view = "multiwindow",
      numbers = "none",
      number_style = "none",
      mappings = false,
      buffer_close_icon = '',
      modified_icon = '',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 15,
      tab_size = 18,
      diagnostics = false,
      diagnostics_indicator = function(count, level, diagnostics_dict)
        return "(" .. count .. ")"
      end,
      custom_filter = function(buf_number)
        return true
      end,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = false,
      sort_by = 'directory',
    },
  }
end)("akinsho/nvim-bufferline.lua");

(function()
  local actions = require('telescope.actions')
  require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
      },
      file_ignore_patterns = {"node_modules", ".git"},
    },
    pickers = {find_files = {hidden = true}},
  }
end)("nvim-telescope/telescope.nvim");

(function()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    ignore_install = {},
    highlight = {enable = true, disable = {}},
  }
end)("nvim-treesitter/nvim-treesitter")
