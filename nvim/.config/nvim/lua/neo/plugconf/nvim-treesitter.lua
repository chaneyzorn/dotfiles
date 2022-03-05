local M = {}

function M.pre()
  -- disable auto fold: use `zi` to toggle it
  vim.o.foldenable = false
  vim.o.foldmethod = "expr"
  vim.o.foldexpr = "nvim_treesitter#foldexpr()"
end

function M.post()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    ignore_install = {},
    highlight = {
      enable = true,
      disable = {},
    },
    rainbow = {
      enable = true,
      disable = {},
      extended_mode = true,
      max_file_lines = nil,
      -- colors = {}, -- table of hex strings
      -- termcolors = {"Tan", "PaleGreen", "SkyBlue", "Gold", "Orchid", "Orange", "Fuchsia", "Ivory"},
    },
  })
end

function M.keybind() end

return M
