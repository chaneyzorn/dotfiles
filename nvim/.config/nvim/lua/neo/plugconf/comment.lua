local M = {}

function M.pre() end

function M.post()
  require("Comment").setup()
end

function M.keybind() end

return M
