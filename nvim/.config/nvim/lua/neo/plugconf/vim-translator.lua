local M = {}

function M.pre()
  local vg = vim.g
  vg.translator_default_engines = { "bing", "youdao", "haici" }
end

function M.post() end

return M
