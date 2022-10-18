local M = {}

function M.pre()
  local vg = vim.g

  -- use sainnhe/sonokai colorscheme
  vg.sonokai_style = "andromeda"
  vg.sonokai_enable_italic = 1
  vg.sonokai_disable_italic_comment = 0
  vg.sonokai_transparent_background = 0
  vg.sonokai_sign_column_background = "none"
  vg.sonokai_menu_selection_background = "green"

  -- xfce4/terminal/colorschemes/chaney_dark.theme
  vg.terminal_color_0 = "#073642"
  vg.terminal_color_1 = "#dc322f"
  vg.terminal_color_2 = "#EBCB8B"
  vg.terminal_color_3 = "#AAB288"
  vg.terminal_color_4 = "#9DA786"
  vg.terminal_color_5 = "#d33682"
  vg.terminal_color_6 = "#16D5B6"
  vg.terminal_color_7 = "#eee8d5"
  vg.terminal_color_8 = "#22444D"
  vg.terminal_color_9 = "#cb4b16"
  vg.terminal_color_10 = "#586e75"
  vg.terminal_color_11 = "#657b83"
  vg.terminal_color_12 = "#839496"
  vg.terminal_color_13 = "#6c71c4"
  vg.terminal_color_14 = "#93a1a1"
  vg.terminal_color_15 = "#fdf6e3"

  vg.terminal_ansi_colors = {
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
end

function M.post()
  require("kanagawa").setup({
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { bold = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,
    specialException = true,
    transparent = false,
    dimInactive = true,
    globalStatus = true,
    colors = {},
    overrides = {
      Floaterm = { bg = "NONE" },
      FloatermBorder = { bg = "NONE", fg = "gray" },
      GitSignsCurrentLineBlame = { link = "Comment" },
      SpellBad = { link = "NONE" },
      SpellCap = { link = "NONE" },
      SpellRare = { link = "NONE" },
      SpellLocal = { link = "NONE" },
      TSError = { link = "NONE" },
    },
  })
  -- vim.cmd("colorscheme sonokai")
  vim.cmd("colorscheme kanagawa")
end

function M.keybind() end

return M
