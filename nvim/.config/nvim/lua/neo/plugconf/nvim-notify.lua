local M = {}

function M.pre() end

function M.post()
  require("notify").setup({
    max_width = 80,
  })

  vim.notify = require("notify")
end

function M.keybind() end

return M
