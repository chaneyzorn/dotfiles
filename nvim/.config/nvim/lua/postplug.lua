-- postplug.lua
-- 与插件定制功能相关的配置，在插件载入后配置（调用型的配置）
(function()
  vim.api.nvim_exec([[
    colorscheme space_vim_theme

    hi Comment              ctermfg=59      guifg=#00688B
    hi CursorLine           ctermbg=238     guibg=#133440
    hi WildMenu             ctermfg=172     ctermbg=238    guifg=#d78700 guibg=#444444 guisp=NONE cterm=NONE,bold gui=NONE,bold
    hi StatusLine           ctermfg=173     ctermbg=233    guifg=#e18254 guibg=#262626 guisp=NONE cterm=NONE gui=NONE
    hi NormalFloat          ctermfg=173     ctermbg=233    guifg=#e18254 guibg=#212121 guisp=NONE cterm=NONE gui=NONE
    hi CocHighlightText     ctermfg=236     ctermbg=47     guifg=#303030 guibg=#f2cc8f
  ]], '')
end)('liuchengxu/space-vim-theme');

(function()
  -- 使用下划线标记光标下相同的单词
  vim.api.nvim_exec([[hi illuminatedWord cterm=underline gui=underline]], '')
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
