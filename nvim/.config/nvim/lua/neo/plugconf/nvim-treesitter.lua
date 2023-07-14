local M = {}

function M.pre()
  -- vim.o.foldlevel = 99
  -- vim.o.foldlevelstart = 99
  -- vim.o.foldmethod = "indent"
  -- vim.o.foldmethod = "expr"
  -- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
end

function M.post()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    ignore_install = {},
    highlight = {
      enable = true,
      disable = {},
    },
  })
end

function M.keybind() end

return M
