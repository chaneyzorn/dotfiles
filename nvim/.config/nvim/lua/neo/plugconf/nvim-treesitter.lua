local M = {}

function M.pre() end

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
