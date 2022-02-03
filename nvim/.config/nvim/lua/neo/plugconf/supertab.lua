local M = {}

function M.pre()
  local vg = vim.g

  vg.SuperTabDefaultCompletionType = "<c-n>"
end

function M.post() end

function M.keybind() end

return M
