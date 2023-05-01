local M = {}

function M.pre() end

function M.post()
  require("leap").set_default_keymaps(true)
end

function M.keybind() end

return M
