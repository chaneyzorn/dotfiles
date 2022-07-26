-- setting.lua

local vo = vim.o
local vg = vim.g
local vwo = vim.wo
local vbo = vim.bo

-- 设置空格键为 leader
vg.mapleader = " "
vg.maplocalleader = " "

-- 设置编码为 utf-8
vo.encoding = "UTF-8"

-- 按键序列超时时长
vo.timeoutlen = 500

-- 设置读取当前目录下配置，并且禁用危险命令
vo.exrc = true
vo.secure = true

-- 使光标下方至少显示五行高度
vo.scrolloff = 5

-- 显示行号
vo.number = true
vwo.number = true

-- 相对行号
-- vo.relativenumber = true
-- vwo.relativenumber = true

-- 高亮光标所在的行
vo.cursorline = true

-- 总是显示指示列
vo.signcolumn = "yes"

-- Smaller updatetime for CursorHold & CursorHoldI & swapfile
vo.updatetime = 300

-- Don't pass messages to |ins-completion-menu|
vo.shortmess = vo.shortmess .. "c"

-- 开启新行时对齐到当前行; 使用合适的空格替代插入 <Tab>
vo.autoindent = true
vo.smartindent = true
vo.expandtab = true

-- 设置缩进为4个空格 一个 <Tab> 等同于4个空格 每4个空格等同于一个 <Tab>
vo.shiftround = true
vo.shiftwidth = 4
vo.tabstop = 4
vo.softtabstop = 4

-- 设置 tab 字符的显示
vo.list = true
vim.opt.listchars = {
  tab = "»·",
  trail = "∙",
  precedes = "←",
  extends = "→",
  eol = "¬",
  nbsp = "␣",
}

vim.opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
}

-- 设置搜索高亮
vo.hlsearch = true
vo.incsearch = true

-- 搜索大小写不敏感，除非包含大写字母
vo.ignorecase = true
vo.smartcase = true

-- 设置背景颜色
vo.background = "dark"

-- 在终端中使用 gui 高亮色，以支持 true color
vo.termguicolors = true

-- 使用增强状态栏后不再需要 vim 的模式提示
vo.showmode = false
-- 设置命令行高为2，提供足够的显示空间
vo.cmdheight = 2
-- vim 命令补全，提供类似 zsh 补全的可视待选项
vo.wildmenu = true

-- 当文件被外部程序修改时，自动加载
vo.autoread = true
vbo.autoread = true

-- 禁止折行
vo.wrap = false
vwo.wrap = false

-- 启用拼写检查 :h spell
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

vg.python_host_prog = vim.fn.glob("~/Pyvenv/venv2.7/bin/python2")
vg.python3_host_prog = vim.fn.glob("~/Pyvenv/venv3/bin/python3")

-- disable netrw
vg.loaded_netrw = 1
vg.loaded_netrwPlugin = 1
