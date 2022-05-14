local M = {}

function M.pre() end

function M.post()
  require("leap").set_default_keymaps()
end

function M.keybind() end

return M
