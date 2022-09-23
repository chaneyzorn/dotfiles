local M = {}

function M.pre() end

function M.post()
  require("virt-column").setup()
end

function M.keybind() end

return M
