return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        dimInactive = true,
        overrides = function(colors)
          local theme = colors.theme
          return {
            SpellBad = { link = "NONE" },
            SpellCap = { link = "NONE" },
            SpellRare = { link = "NONE" },
            SpellLocal = { link = "NONE" },
            TSError = { link = "NONE" },

            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            Floaterm = { bg = "NONE" },
            FloatermBorder = { bg = "NONE", fg = "gray" },
            GitSignsCurrentLineBlame = { link = "Comment" },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          }
        end,
      })
      -- setup must be called before loading
      -- vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.15,
        },
        term_colors = true,
        integrations = {
          fidget = true,
          mason = true,
          neotree = true,
          lsp_trouble = true,
          which_key = true,
        },
      })
      -- setup must be called before loading
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
