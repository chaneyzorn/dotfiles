local M = {}

function M.pre() end

function M.post()
  require("colorizer").setup()
end

return M
