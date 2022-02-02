local M = {}

function M.pre() end

function M.post()
  require("Comment").setup()
end

return M
