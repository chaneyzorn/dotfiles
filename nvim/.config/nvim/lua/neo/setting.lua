-- setting.lua

local vo = vim.o
local vg = vim.g

vg.mapleader = " "

vo.mouse = ""

vo.encoding = "UTF-8"
vim.cmd.language("en_US.UTF-8")

vo.timeoutlen = 500

-- load config from exrc: .nvim.lua .nvimrc .exrc
vo.exrc = true
vo.secure = true

-- show at least 5 lines around cursorline
vo.scrolloff = 5
vo.cursorline = true

vo.number = true
vo.relativenumber = true

vo.splitright = true

-- show ruler virt-line at textwidth +1
vo.colorcolumn = "+1"

-- always show signcolumn
vo.signcolumn = "yes"

-- set the default border for all floating windows
-- vo.winborder = "rounded"

vo.showtabline = 0

-- Smaller updatetime for CursorHold & CursorHoldI & swapfile
vo.updatetime = 300

vo.autoindent = true
vo.smartindent = true
vo.expandtab = true

-- one tab as four spaces
vo.shiftround = true
vo.shiftwidth = 4
vo.tabstop = 4
vo.softtabstop = 4

vo.list = true
vim.opt.listchars = {
  tab = "»·",
  trail = "∙",
  precedes = "←",
  extends = "→",
  -- eol = "¬",
  nbsp = "␣",
}

vim.opt.fillchars = {
  eob = " ",
  fold = "·",
  foldopen = "",
  foldsep = "│",
  foldclose = "",
  diff = "╱",
}

vo.hlsearch = true
vo.incsearch = true
vo.ignorecase = true
vo.smartcase = true

vo.termguicolors = true

vo.showmode = false
vo.wildmenu = true

vo.autoread = true

-- disable line wrap
vo.wrap = false

vo.spell = false
vo.spelllang = "en,cjk"
vo.spellcapcheck = ""
vo.spelloptions = "camel"

vo.tags = "./.tags;,.tags,~/.cache/tags/sys-.tags"
vo.path = table.concat({
  ".",
  "/usr/include",
  "/usr/include/*",
  "/usr/lib/*/include",
  "/usr/lib/gcc/**/include",
}, ",")

if vim.env.UV_TOOL_DIR then
  vg.python3_host_prog = vim.env.UV_TOOL_DIR .. "/neovim-sh/bin/python"
else
  vg.python3_host_prog = vim.fn.exepath("python3")
end
vg.loaded_ruby_provider = 0
vg.loaded_perl_provider = 0

-- disable netrw
vg.loaded_netrw = 1
vg.loaded_netrwPlugin = 1

-- setting for ssh connection
if require("neo.util").via_ssh() then
  vim.g.clipboard = "osc52"
end
