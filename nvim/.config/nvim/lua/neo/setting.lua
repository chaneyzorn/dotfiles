-- setting.lua

local vo = vim.o
local vg = vim.g
local vwo = vim.wo
local vbo = vim.bo

vg.mapleader = " "
vg.maplocalleader = " "

vo.mouse = ""

vo.encoding = "UTF-8"

vo.timeoutlen = 500

-- load config from exrc: .nvim.lua .nvimrc .exrc
vo.exrc = true
vo.secure = true

-- show at least 5 lines around cursorline
vo.scrolloff = 5
vo.cursorline = true

vo.number = true
vwo.number = true

-- vo.relativenumber = true
-- vwo.relativenumber = true

-- show ruler virt-line at textwidth +1
vo.colorcolumn = "+1"

-- always show signcolumn
vo.signcolumn = "yes"

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
}

vo.hlsearch = true
vo.incsearch = true
vo.ignorecase = true
vo.smartcase = true

vo.background = "dark"
vo.termguicolors = true

vo.showmode = false
vo.wildmenu = true

vo.autoread = true
vbo.autoread = true

-- disable line wrap
vo.wrap = false
vwo.wrap = false

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

vg.python3_host_prog = vim.env.PIPX_LOCAL_VENVS .. "/neovim-sh/bin/python"
vg.loaded_ruby_provider = 0
vg.loaded_perl_provider = 0

-- disable netrw
vg.loaded_netrw = 1
vg.loaded_netrwPlugin = 1
