local M = {}

function M.pre() end

function M.post()
  require("luasnip.loaders.from_vscode").lazy_load()
end

function M.keybind() end

return M
