local M = {}

local filetypes_denylist = {
  "dirvish",
  "fugitive",
  "nerdtree",
  "NvimTree",
  "DiffviewFiles",
  "qf",
  "help",
  "list",
  "vista",
  "man",
}

function M.pre()
  -- I don't know why
  vim.g.Illuminate_ftblacklist = filetypes_denylist
end

function M.post()
  require("illuminate").configure({
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 100,
    filetypes_denylist = filetypes_denylist,
    under_cursor = true,
  })
end

function M.keybind() end

return M
