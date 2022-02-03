local M = {}

function M.pre() end

function M.post()
  require("indent_blankline").setup({
    char = "┊",
    -- char_list = {'|', '¦', '┆', '┊'}
    show_current_context = true,
    filetype_exclude = { "help", "terminal", "list", "nofile", "make", "go" },
    buftype_exclude = { "help", "terminal", "list", "nofile" },
  })
end

function M.keybind() end

return M
