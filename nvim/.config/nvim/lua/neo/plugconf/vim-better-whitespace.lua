local M = {}

function M.pre()
  local vg = vim.g

  -- 使用 g:better_whitespace_filetypes_blacklist 无效
  -- https://github.com/ntpeters/vim-better-whitespace/issues/108
  vim.cmd([[ autocmd FileType help DisableWhitespace ]])
  -- 禁用默认 keymap
  vg.better_whitespace_operator = ""
end

function M.post() end

function M.keybind()
  local U = require("neo.tools")
  U.vmap("<Leader>ct", "<Cmd>StripWhitespace<CR>")
  U.nmap("<Leader>ct", "<Cmd>StripWhitespace<CR>")

  require("neo.keybind").leader_help({
    ct = "清除尾部空格",
  })
end

return M
