return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
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
      -- vim.cmd.colorscheme("kanagawa-dragon")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.15,
        },
        term_colors = true,
        custom_highlights = function(colors)
          return {
            NvimTreeExecFile = { fg = colors.flamingo, bold = true },
          }
        end,
        integrations = {
          fidget = true,
          mason = true,
          neotree = true,
          nvimtree = true,
          lsp_trouble = true,
          which_key = true,
        },
      })
      -- setup must be called before loading
      if not vim.g.neovide then
        vim.cmd.colorscheme("catppuccin")
      end
    end,
  },
  {
    "sainnhe/everforest",
    priority = 1000,
    config = function()
      if vim.g.neovide then
        vim.o.background = "light"
        vim.api.nvim_create_autocmd("ColorScheme", {
          group = vim.api.nvim_create_augroup("EverforestCustom", {}),
          pattern = "everforest",
          callback = function()
            local config = vim.fn["everforest#get_configuration"]()
            local palette = vim.fn["everforest#get_palette"](config.background, config.colors_override)
            local set_hl = vim.fn["everforest#highlight"]

            set_hl("NvimTreeNormal", palette.fg, palette.bg0)
            set_hl("NvimTreeEndOfBuffer", palette.bg0, palette.bg0)
            set_hl("NvimTreeVertSplit", palette.bg0, palette.bg0)
            set_hl("NvimTreeCursorLine", palette.none, palette.bg_dim)
          end,
        })
        vim.cmd.colorscheme("everforest")
      end
    end,
  },
}
