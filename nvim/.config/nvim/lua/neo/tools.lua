local U = {}
local fn = vim.fn

-- Key mapping
function U.map(mode, key, action, opts)
  opts = vim.tbl_extend("keep", opts or {}, { noremap = true, silent = true, expr = false })
  vim.api.nvim_set_keymap(mode, key, action, opts)
end

function U.plugmap(mode, key, action, opts)
  opts = vim.tbl_extend("keep", opts or {}, { noremap = not vim.startswith(action, "<Plug>") })
  U.map(mode, key, action, opts)
end

function U.nmap(key, action, opts)
  U.plugmap("n", key, action, opts)
end

function U.vmap(key, action, opts)
  U.plugmap("v", key, action, opts)
end

function U.imap(key, action, opts)
  U.plugmap("i", key, action, opts)
end

function U.xmap(key, action, opts)
  U.plugmap("x", key, action, opts)
end

-- 复制当前行到 system clipboard
-- action like ^"+yg_ but without moving cursor
function U.YankOneLine()
  fn.setreg("+", fn.trim(fn.getline(".")))
  print("[YankOneLine] one line yanked to system clipboard")
end

-- toggle mouse
function U.ToggleMouse()
  if vim.o.mouse == "" then
    vim.o.mouse = "a"
    print("[ToggleMouse] mouse enabled")
  else
    vim.o.mouse = ""
    print("[ToggleMouse] mouse disabled")
  end
end

-- 获取换行符模式
function U.GetLineEnd()
  local label = { unix = "LF", mac = "CR", dos = "CRLF" }
  return label[vim.bo.fileformat]
end

return U
