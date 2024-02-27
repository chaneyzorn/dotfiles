return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
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
