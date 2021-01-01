-- myconf.vim
-- vim 内置选项的自定义设定
-- 部分默认设定由 Plug 'tpope/vim-sensible' 指定
local go = vim.o
local gg = vim.g

-- 设置编码为 utf-8
go.encoding = "UTF-8"

-- 按键序列超时时长
go.timeoutlen = 500

-- 设置读取当前目录下配置，并且禁用危险命令
go.exrc = true
go.secure = true

-- 使光标下方至少显示五行高度
go.scrolloff = 5

-- 显示行号
go.number = true
-- 高亮光标所在的行
go.cursorline = true

-- 总是显示指示列
go.signcolumn = "yes"

-- Smaller updatetime for CursorHold & CursorHoldI & swapfile
go.updatetime = 300

-- Don't pass messages to |ins-completion-menu|
go.shortmess = go.shortmess .. "c"

-- 开启新行时对齐到当前行; 使用合适的空格替代插入 <Tab>
go.autoindent = true
go.smartindent = true
go.expandtab = true

-- 设置缩进为4个空格 一个 <Tab> 等同于4个空格 每4个空格等同于一个 <Tab>
go.shiftround = true
go.shiftwidth = 4
go.tabstop = 4
go.softtabstop = 4

-- 设置 tab 字符的显示
go.list = true
go.listchars = "tab:>·"

-- 设置窗口分割线为连续实线
go.fillchars = "vert:│"

-- 设置搜索高亮
go.hlsearch = true
go.incsearch = true

-- 搜索大小写不敏感，除非包含大写字母
go.ignorecase = true
go.smartcase = true

-- 设置背景颜色
go.background = "dark"

-- 在终端中使用 gui 高亮色，以支持 true color
go.termguicolors = true

-- 使用增强状态栏后不再需要 vim 的模式提示
go.showmode = false
-- 设置命令行高为2，提供足够的显示空间
go.cmdheight = 2
-- vim 命令补全，提供类似 zsh 补全的可视待选项
go.wildmenu = true

-- 当文件被外部程序修改时，自动加载
go.autoread = true

-- 禁止折行
go.wrap = false

-- 启用拼写检查 :h spell
go.spell = false
go.spelllang = "en,cjk"

go.tags = "./.tags;,.tags,~/.cache/tags/sys-.tags"
go.path = table.concat({
  ".",
  "/usr/include",
  "/usr/include/*",
  "/usr/lib/*/include",
  "/usr/lib/gcc/**/include",
}, ",")

gg.python_host_prog = "~/Pyvenv/venv2.7/bin/python2"
gg.python3_host_prog = "~/Pyvenv/venv3/bin/python3"

-- disable netrw
gg.loaded_netrw = 1
gg.loaded_netrwPlugin = 1
