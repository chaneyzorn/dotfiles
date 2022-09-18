local M = {}

function M.pre() end

function M.post()
  require("cinnamon").setup({
    default_keymaps = true,
    extra_keymaps = true,
    extended_keymaps = true,
    override_keymaps = false,

    default_delay = 3,
    hide_cursor = true,
    scroll_limit = 100,
  })
end

function M.keybind() end

return M
