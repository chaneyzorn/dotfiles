return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.2,
        },
        term_colors = true,
        styles = {
          comments = { "italic" },
          conditionals = {},
          keywords = { "bold" },
          functions = { "bold" },
          types = { "bold" },
        },
        integrations = {
          aerial = true,
          blink_cmp = true,
          diffview = true,
          fidget = true,
          flash = true,
          gitsigns = true,
          grug_far = true,
          lsp_trouble = true,
          markview = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
              ok = { "undercurl" },
            },
          },
          nvimtree = true,
          snacks = true,
          treesitter = true,
          which_key = true,
          ufo = true,
        },
      })
      -- setup must be called before loading
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({})
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("kanagawa").setup({})
    end,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_enable_italic = 1
    end,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_enable_italic = 1
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = 1
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("rose-pine").setup({})
    end,
  },
  {
    "uhs-robert/oasis.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oasis").setup({})
    end,
  },
  {
    "oskarnurm/koda.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("koda").setup({
        bold = true,
        italic = true,
        transparent = false,
      })
    end,
  },
  {
    "uhs-robert/color-chameleon.nvim",
    lazy = false,
    priority = 999,
    config = function()
      require("color-chameleon").setup({
        rules = {
          {
            colorscheme = "tokyonight-night",
            env = { SSH_CONNECTION = true },
          },
          {
            colorscheme = "rose-pine",
            condition = function()
              return vim.bo.readonly or not vim.bo.modifiable
            end,
          },
          {
            colorscheme = "everforest",
            background = "light",
            condition = function()
              return vim.g.neovide ~= nil
            end,
          },
        },
        default = {
          colorscheme = "catppuccin",
          background = "dark",
        },
      })
    end,
  },
}
