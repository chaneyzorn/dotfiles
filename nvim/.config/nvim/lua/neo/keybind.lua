-- keybind.lua
-- NOTE :h <Plug> can NOT be used in noremap
-- TODO split

local which_key_map = {}

which_key_map.b = {
  ["name"] = "buffers",
  ["d"] = { "<Cmd>bdelete<CR>", "delete buffer" },
}

which_key_map.c = {
  ["name"] = "coding",
  ["k"] = { "<Cmd>set spell!<CR>", "Toggle spell check" },
}

which_key_map.f = {
  ["name"] = "files/search",
}

which_key_map.g = {
  ["name"] = "git/goto",
}

which_key_map.w = {
  ["name"] = "windows",
  ["p"] = { "<C-W>p", "pre window" },
  ["n"] = { "<Cmd>vnew<CR>", "new window" },
  ["c"] = { "<C-W>c", "close current window" },
  ["o"] = { "<C-W>o", "close other windows" },
  ["s"] = { "<C-W>s", "h split window" },
  ["v"] = { "<C-W>v", "v split window" },
  ["w"] = { "<C-W>w", "next window" },
  ["h"] = { "<C-W>h", "mv to left window" },
  ["j"] = { "<C-W>j", "mv to down window" },
  ["l"] = { "<C-W>l", "mv to right window" },
  ["k"] = { "<C-W>k", "mv to up window" },
  ["["] = { "<C-W>5<", "resize win<5" },
  ["]"] = { "<C-W>5>", "resize win>5" },
  ["="] = { "<Cmd>resize +5<CR>", "resize win+5" },
  ["-"] = { "<Cmd>resize -5<CR>", "resize win-5" },
  ["/"] = { "<C-W>=", "resize win==" },
}

which_key_map.t = {
  ["name"] = "tab/translate/tags",
  ["n"] = { "<Cmd>tabnew<CR>", "new tab" },
  ["c"] = { "<Cmd>tabclose<CR>", "close current tab" },
  ["o"] = { "<Cmd>tabonly<CR>", "close other tabs" },
  ["]"] = { "<Cmd>tabnext<CR>", "next tab" },
  ["["] = { "<Cmd>tabprevious<CR>", "pre tab" },
  ["f"] = { "<Cmd>tabfirst<CR>", "first tab" },
  ["l"] = { "<Cmd>tablast<CR>", "last tab" },
}

which_key_map.y = {
  ["name"] = "yank",
  ["y"] = { "<Cmd>%y+<CR>", "yank all to sys-clip" },
  ["o"] = { require("neo.tools").YankOneLine, "yank one line to sys-clip" },
}

which_key_map.v = {
  ["name"] = "vim",
  ["m"] = { require("neo.tools").ToggleMouse, "toggle mouse" },
  ["q"] = { "<Cmd>wa<CR>:q<CR>", "save all and quit" },
  ["x"] = { "<Cmd>qa!<CR>", "quit without save" },
}

local M = {}

-- Key mapping
function M.map(mode, key, action, opts)
  opts = vim.tbl_extend("keep", opts or {}, { noremap = true, silent = true, expr = false })
  vim.keymap.set(mode, key, action, opts)
end

function M.plugmap(mode, key, action, opts)
  noremap = true
  if type(action) == "string" and vim.startswith(action, "<Plug>") then
    noremap = false
  end
  opts = vim.tbl_extend("keep", opts or {}, { noremap = noremap })
  M.map(mode, key, action, opts)
end

function M.nmap(key, action, opts)
  M.plugmap("n", key, action, opts)
end

function M.vmap(key, action, opts)
  M.plugmap("v", key, action, opts)
end

function M.imap(key, action, opts)
  M.plugmap("i", key, action, opts)
end

function M.xmap(key, action, opts)
  M.plugmap("x", key, action, opts)
end

local add_help = function(fk, help)
  local first_key = fk:sub(1, 1)
  if not which_key_map[first_key] then
    which_key_map[first_key] = {}
  end

  local second_key = fk:sub(2, 2)
  local exist_help = which_key_map[first_key][second_key]
  if exist_help then
    vim.notify(
      "keymap <Leader>" .. fk .. " already exists for: " .. exist_help .. " replace to: " .. help,
      vim.log.levels.WARN
    )
  end
  which_key_map[first_key][second_key] = help
end

M.leader_help = function(key_help_tb)
  for k, v in pairs(key_help_tb) do
    add_help(k, v)
  end
end

M.register_keymap = function()
  local U = require("neo.tools")

  -- without leader key

  -- easy switch
  U.nmap("[b", "<Cmd>bprevious<CR>")
  U.nmap("]b", "<Cmd>bnext<CR>")
  U.nmap("[t", "<Cmd>tabprevious<CR>")
  U.nmap("]t", "<Cmd>tabnext<CR>")
  U.nmap("[w", "<C-W>p")
  U.nmap("]w", "<C-W>w")

  U.nmap("<C-s>", "<Cmd>update<CR>")
  U.vmap("<C-s>", "<Esc><Cmd>update<CR>")
  U.imap("<C-s>", "<Esc><Cmd>update<CR>")

  U.nmap("<C-c>", "<Esc><Cmd>quit<CR>")

  -- 可视化复制选中内容到 clipboard
  U.vmap("<C-y>", [["+y]])
  -- Paste from clipboard
  U.nmap("<C-p>", [["+p]])
  U.vmap("<C-p>", [["+p]])

  local wk = require("which-key")
  wk.register(which_key_map, { prefix = "<Leader>" })
end

return M
