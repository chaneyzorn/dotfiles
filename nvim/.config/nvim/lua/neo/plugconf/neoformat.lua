local M = {}

function M.pre()
  local vg = vim.g

  vg.neoformat_enabled_python = { "black" }
  -- 默认格式化对齐
  vg.neoformat_basic_format_align = 1
  -- 默认转换 tab 字符为空格
  vg.neoformat_basic_format_retab = 1
  -- 默认去掉行尾空格
  vg.neoformat_basic_format_trim = 1
end

function M.post() end

function M.keybind()
  local U = require("neo.tools")
  U.nmap("<Leader>cf", "<Cmd>Neoformat<CR>")
  U.vmap("<Leader>cf", "<Cmd>Neoformat<CR>")

  require("neo.keybind").leader_help({
    cf = "格式化代码",
  })
end

return M
