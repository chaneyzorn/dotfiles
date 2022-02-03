local M = {}

function M.pre()
  local vg = vim.g

  -- https://github.com/lambdalisue/suda.vim/issues/29
  -- vg.suda_smart_edit = 1
end

function M.post() end

function M.keybind()
  local U = require("neo.tools")
  U.nmap("<Leader>fs", "<Cmd>SudaWrite<CR>")
  U.vmap("<Leader>fs", "<Esc><Cmd>SudaWrite<CR>")

  require("neo.keybind").leader_help({
    fs = "请求管理员权限保存文件",
  })
end

return M
