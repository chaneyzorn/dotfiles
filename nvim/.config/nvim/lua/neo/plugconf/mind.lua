local M = {}

function M.pre() end

function M.post()
  require("mind").setup()
end

function M.keybind() end

return M
