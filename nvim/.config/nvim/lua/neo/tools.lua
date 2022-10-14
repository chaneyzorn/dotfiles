local U = {}
local fn = vim.fn

U.colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

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

-- copy current line to system clipboard
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

function U.EnableCodingVision()
  -- enable diagnostics
  local nls = require("null-ls")
  nls.enable({ method = nls.methods.DIAGNOSTICS })
  -- enable LSP server, from lspconfig
  vim.cmd("LspStart")
  -- enable spell check
  vim.o.spell = true

  print("Coding Vision Enabled")
end

function U.DisableCodingVision()
  -- disable diagnostics
  local nls = require("null-ls")
  nls.disable({ method = nls.methods.DIAGNOSTICS })
  -- disable LSP server, from lspconfig
  vim.cmd("LspStop")
  -- disable spell check
  vim.o.spell = false

  print("Coding Vision Disabled")
end

function U.RefreshCSpell()
  local nls = require("null-ls")
  nls.enable({ name = "cspell", method = nls.methods.DIAGNOSTICS })

  print("CSpell Refreshed")
end

return U
