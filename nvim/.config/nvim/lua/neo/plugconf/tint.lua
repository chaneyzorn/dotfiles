local M = {}

function M.pre() end

function M.post()
  if vim.api.nvim_win_set_hl_ns then
    require("tint").setup()
  end
end

function M.keybind() end

return M
