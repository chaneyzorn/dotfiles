local M = {}

function M.pre()
  local vg = vim.g

  -- https://github.com/lambdalisue/suda.vim/issues/29
  -- vg.suda_smart_edit = 1
end

function M.post() end

return M
