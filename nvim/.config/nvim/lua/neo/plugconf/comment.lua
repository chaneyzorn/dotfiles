local M = {}

function M.pre() end

function M.post()
  require("Comment").setup({
    toggler = {
      line = "<Leader>cc",
      block = "<Leader>cb",
    },
  })
end

function M.keybind()
  require("neo.keybind").leader_help({
    cc = "使用行注释",
    cb = "使用块注释",
  })
end

return M
