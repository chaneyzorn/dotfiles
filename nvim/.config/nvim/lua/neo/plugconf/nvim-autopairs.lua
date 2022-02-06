local M = {}

function M.pre() end

function M.post()
  require("nvim-autopairs").setup({})

  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end

function M.keybind() end

return M
