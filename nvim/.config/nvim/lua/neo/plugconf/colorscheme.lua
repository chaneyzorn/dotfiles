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

  -- use Mofiqul/vscode.nvim
  vim.g.vscode_style = "dark" -- light
  vim.g.vscode_transparent = 1
  vim.g.vscode_italic_comment = 1
  vim.g.vscode_disable_nvimtree_bg = false

  -- use marko-cerovac/material.nvim colorscheme
  vg.material_style = "deep ocean"

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

local config_scheme = function()
  require("material").setup({
    contrast = {
      sidebars = true,
      floating_windows = false,
      line_numbers = false,
      sign_column = false,
      cursor_line = false,
      non_current_windows = false,
      popup_menu = false,
    },
    italics = {
      comments = true,
      keywords = false,
      functions = false,
      strings = false,
      variables = false,
    },
    contrast_filetypes = {
      "terminal",
      "packer",
      "qf",
    },
    high_visibility = {
      lighter = false,
      darker = false,
    },
    disable = {
      borders = false,
      background = false,
      term_colors = false,
      eob_lines = false,
    },
    lualine_style = "default",
    async_loading = true,
    custom_highlights = {},
  })

  require("nightfox").setup({
    options = {
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      },
    },
  })
end

function M.post()
  -- config_scheme()

  vim.api.nvim_exec(
    -- colorscheme material
    -- colorscheme sonokai
    -- colorscheme nightfox
    -- colorscheme vscode
    [[
    colorscheme sonokai

    hi Floaterm             guibg=NONE
    hi FloatermBorder       guibg=NONE      guifg=gray

    hi! link SpellBad   None
    hi! link SpellCap   None
    hi! link SpellRare  None
    hi! link SpellLocal None
    hi! link TSError    None
    ]],
    false
  )
end

function M.keybind() end

return M
