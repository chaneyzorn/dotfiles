local M = {}

function M.pre() end

function M.post()
  require("illuminate").configure({
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 100,
    filetype_overrides = {},
    filetypes_denylist = {
      "dirvish",
      "fugitive",
      "nerdtree",
      "NvimTree",
      "qf",
      "help",
      "list",
      "vista",
      "man",
    },
    filetypes_allowlist = {},
    under_cursor = true,
  })
end

function M.keybind() end

return M
