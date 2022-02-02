local M = {}

function M.pre()
  local vg = vim.g

  vg.coc_start_at_startup = 0
  vg.coc_global_extensions = {
    "coc-css",
    "coc-dictionary",
    "coc-emoji",
    "coc-eslint",
    "coc-go",
    "coc-jedi",
    "coc-json",
    "coc-lists",
    "coc-marketplace",
    "coc-prettier",
    "coc-rust-analyzer",
    "coc-snippets",
    "coc-syntax",
    "coc-tsserver",
    "coc-vimlsp",
    "coc-word",
    "coc-yaml",
  }
end

function M.post() end

return M
