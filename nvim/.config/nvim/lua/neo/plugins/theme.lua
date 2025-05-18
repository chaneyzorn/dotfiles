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
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
