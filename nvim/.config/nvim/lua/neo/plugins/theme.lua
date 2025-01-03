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
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.15,
        },
        term_colors = true,
        styles = {
          comments = { "italic" },
          conditionals = {},
          keywords = { "bold" },
          functions = { "bold" },
          types = { "bold" },
        },
        custom_highlights = function(colors)
          return {
            NvimTreeExecFile = { fg = colors.flamingo, bold = true },
          }
        end,
        integrations = {
          blink_cmp = true,
          fidget = true,
          mason = true,
          neotree = true,
          nvimtree = true,
          lsp_trouble = true,
          which_key = true,
        },
      })
      -- setup must be called before loading
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
