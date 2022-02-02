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

return M
