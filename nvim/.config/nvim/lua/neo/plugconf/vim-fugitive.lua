local M = {}

function M.pre() end

function M.post() end

function M.keybind()
  local U = require("neo.tools")
  U.nmap("<Leader>gB", "<Cmd>Git blame<CR>")

  require("neo.keybind").leader_help({
    gB = "展示全文件的 git-blame",
  })
end

return M
