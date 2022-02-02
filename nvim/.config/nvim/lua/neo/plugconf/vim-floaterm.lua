local M = {}

function M.pre()
  local vg = vim.g

  -- floaterm 快捷键配置
  vg.floaterm_keymap_new = "<Leader>tr"
  vg.floaterm_keymap_prev = "<Leader>["
  vg.floaterm_keymap_next = "<Leader>]"
  vg.floaterm_keymap_toggle = "<Leader>tt"
end

function M.post() end

return M
