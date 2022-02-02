-- keybind.lua
-- vim 快捷键设定
-- 注意 <Plug> 不能使用在 noremap 中
local U = require("neo.tools")
local wk = require("which-key")

-- which-key.nvim 插件配置
local which_key_map = {}

-- leader-w: 定义窗口相关的快捷键

-- 以下形式表示以 <Leader>w 为前缀的快捷键，map 中的键为后续按键，以此类推
-- 当 map 中的值是 list 时，第一列表示新定义的按键映射，第二列是这个快捷键的说明
-- 当 map 中的值是 字符串 时，表示为已有快捷键的说明
which_key_map.w = {
  ["name"] = "windows",
  ["p"] = { "<C-W>p", "上一窗口" },
  ["n"] = { "<Cmd>vnew<CR>", "新建窗口" },
  ["c"] = { "<C-W>c", "关闭当前窗口" },
  ["o"] = { "<C-W>o", "关闭其他窗口" },
  ["s"] = { "<C-W>s", "水平分割窗口" },
  ["v"] = { "<C-W>v", "垂直分割窗口" },
  ["w"] = { "<C-W>w", "选择下一个窗口" },
  ["h"] = { "<C-W>h", "选择左边的窗口" },
  ["j"] = { "<C-W>j", "选择下边的窗口" },
  ["l"] = { "<C-W>l", "选择右边的窗口" },
  ["k"] = { "<C-W>k", "选择上边的窗口" },
  ["["] = { "<C-W>5<", "向左扩大窗口" },
  ["]"] = { "<C-W>5>", "向右扩大窗口" },
  ["="] = { "<Cmd>resize +5<CR>", "向下扩大窗口" },
  ["-"] = { "<Cmd>resize -5<CR>", "向上扩大窗口" },
  ["/"] = { "<C-W>=", "令窗口平分长度" },
}

-- leader-t: 定义 tab、翻译 相关的快捷键

-- 翻译光标下的文本，在命令行回显翻译内容
U.nmap("<Leader>tw", "<Plug>Translate")
U.vmap("<Leader>tw", "<Plug>TranslateV")
-- 翻译光标下的文本，在窗口中显示翻译内容
U.nmap("<Leader>ts", "<Plug>TranslateW")
U.vmap("<Leader>ts", "<Plug>TranslateWV")
U.nmap("<Leader>th", "<Plug>TranslateF")
U.nmap("<Leader>tx", "<Plug>TranslateX")

-- vista 快捷键配置
U.nmap("<Leader>tb", "<Cmd>Vista!!<CR>")

which_key_map.t = {
  ["name"] = "tab/translate/tags",
  ["n"] = { "tabnew", "打开新 tab" },
  ["c"] = { "tabclose", "关闭当前tab" },
  ["o"] = { "tabonly", "关闭其他tab" },
  ["]"] = { "tabnext", "下一个tab" },
  ["["] = { "tabprevious", "上一个tab" },
  ["f"] = { "tabfirst", "第一个tab" },
  ["l"] = { "tablast", "最后一个tab" },
  ["w"] = "翻译单词",
  ["r"] = "新建浮窗终端",
  ["s"] = "展示翻译",
  ["t"] = "切换浮窗终端",
  ["h"] = "翻译历史记录",
  ["x"] = "翻译clipboard",
  ["b"] = "显示大纲",
}

-- leader-b: 定义 buffer 相关的快捷键

which_key_map.b = {
  ["name"] = "buffers",
  ["b"] = { "<Cmd>BufferLineCycleNext<CR>", "next-buffer" },
  ["h"] = { "<Cmd>BufferLineCyclePrev<CR>", "previous-buffer" },
  ["p"] = { "<Cmd>BufferLinePick<CR>", "pick-buffer" },
  ["l"] = { "blast", "last-buffer" },
  ["f"] = { "bfirst", "first-buffer" },
  ["d"] = { "bdelete", "delete-buffer" },
}

-- leader-f: 定义文件相关的快捷键

-- find files
U.nmap("<Leader>ff", "<Cmd>Telescope find_files<CR>")
-- find buffers
U.nmap("<Leader>fb", "<Cmd>Telescope buffers<CR>")
-- 内容关键词 fuzzy 搜索
U.nmap("<Leader>fg", "<Cmd>Telescope live_grep<CR>")
-- 光标下单词搜索
U.nmap("<Leader>fc", "<Cmd>Telescope grep_string<CR>")
-- find git diff
U.nmap("<Leader>fd", "<Cmd>Telescope git_status<CR>")

-- 强制保存
U.nmap("<Leader>fs", "<Cmd>SudaWrite<CR>")
U.vmap("<Leader>fs", "<Esc><Cmd>SudaWrite<CR>")
-- 快速保存
U.nmap("<C-s>", "<Cmd>update<CR>")
U.vmap("<C-s>", "<Esc><Cmd>update<CR>")
U.imap("<C-s>", "<Esc><Cmd>update<CR>")
-- 重新加载文件
U.nmap("<Leader>fr", "<Cmd>edit<CR>")

which_key_map.f = {
  ["name"] = "files/search",
  ["b"] = "查找 buffer",
  ["d"] = "查找被修改的文件",
  ["f"] = "查找文件",
  ["g"] = "查找文件内容",
  ["c"] = "查找光标下的单词",
  ["r"] = "重新加载文件",
  ["s"] = "提权保存",
  ["t"] = { "<Cmd>NvimTreeToggle<CR>", "切换显示目录树" },
  ["l"] = { "<Cmd>NvimTreeFindFile<CR>", "在目录树中定位" },
}

-- leader-g: 定义 git 和 跳转相关的快捷键

-- coc
U.nmap("<C-j>", "<Plug>(coc-definition)")
U.nmap("<Leader>gg", "<Plug>(coc-definition)")
U.nmap("<Leader>gs", "<Plug>(coc-declaration)")
U.nmap("<Leader>gt", "<Plug>(coc-type-definition)")
U.nmap("<Leader>gi", "<Plug>(coc-implementation)")
U.nmap("<Leader>gr", "<Plug>(coc-references)")

-- ale
U.nmap("<Leader>gl", "<Plug>(ale_toggle)", { silent = false })
U.nmap("<Leader>ge", "<Plug>(ale_next_wrap_error)")
U.nmap("<Leader>gE", "<Plug>(ale_previous_wrap_error)")
U.nmap("<Leader>gw", "<Plug>(ale_next_wrap)")
U.nmap("<Leader>gW", "<Plug>(ale_previous_wrap)")

-- gitsigns
U.nmap("]c", "&diff ? ']c' : '<Cmd>Gitsigns next_hunk<CR>'", { expr = true })
U.nmap("[c", "&diff ? '[c' : '<Cmd>Gitsigns prev_hunk<CR>'", { expr = true })
U.nmap("<Leader>gb", "<Cmd>Gitsigns blame_line<CR>", { silent = false })
U.nmap("<Leader>gd", "<Cmd>Gitsigns preview_hunk<CR>")
U.nmap("<Leader>gu", "<Cmd>Gitsigns reset_hunk<CR>")

which_key_map.g = {
  ["name"] = "git/goto",
  ["l"] = "开启/关闭 ale lint",
  ["e"] = "跳转到下一个错误",
  ["E"] = "跳转到上一个错误",
  ["w"] = "跳转到下一个警告",
  ["W"] = "跳转到上一个警告",
  ["g"] = "跳转到定义",
  ["s"] = "跳转到申明",
  ["t"] = "跳转到类型",
  ["i"] = "跳转到实现",
  ["r"] = "展示所有引用",
  ["d"] = "展示当前行变动diff",
  ["u"] = "将当前行回退到版本控制",
  ["b"] = "gitblame当前行",
  ["B"] = { "<Cmd>Git blame<CR>", "gitblame全文件" },
}

-- leader-c: 定义 coding 快捷键

-- better-whitespace 快捷键配置
U.vmap("<Leader>ct", "<Cmd>StripWhitespace<CR>")
U.nmap("<Leader>ct", "<Cmd>StripWhitespace<CR>")

-- coc 快捷键配置
U.nmap("<Leader>ct", "<Plug>(coc-format)")
U.vmap("<Leader>ct", "<Plug>(coc-format-selected)")
U.nmap("<Leader>cp", "<Cmd>CocCommand<CR>")
-- 手动启动 Coc Service
U.nmap("<Leader>cx", "<Cmd>CocStart<CR>")
U.nmap("<Leader>cv", "<Cmd>CocStart<CR>:ALEEnable<CR>:call spelunker#toggle()<CR>")

-- sbdchd/neoformat 快捷键配置
U.nmap("<Leader>cf", "<Cmd>Neoformat<CR>")
U.vmap("<Leader>cf", "<Cmd>Neoformat<CR>")

-- 拼写检查
U.nmap("<Leader>ck", "<Cmd>set spell!<CR>")

which_key_map.c = {
  ["name"] = "coding",
  ["d"] = "生成代码文档",
  ["f"] = "格式化代码",
  ["t"] = "coc全格式化代码",
  ["k"] = "拼写检查",
  ["p"] = "coc下拉菜单",
  ["x"] = "开启 coc lsp",
  ["v"] = "开启代码智能辅助",
}

-- leader-y: 定义 yank to system clipboard"
-- see :help clipboard

-- Copy to clipboard
-- 可视化复制选中内容到 clipboard
U.vmap("<C-y>", [["+y]])
-- normal 模式复制当前行到 clipboard
U.nmap("<C-y>", "<Cmd>lua require('neo.tools').YankOneLine()<CR>")
-- normal 模式复制全部内容到 clipboard
U.nmap("<Leader>yy", "<Cmd>%y+<CR>")

-- Paste from clipboard
U.nmap("<C-p>", [["+p]])
U.vmap("<C-p>", [["+p]])

which_key_map.y = {
  ["name"] = "yank",
  ["y"] = "复制全部内容到 clipboard",
}

-- leader-v: 定义 vim 控制的控制键

-- <C-m> 切换鼠标
U.nmap("<Leader>vm", "<Cmd>lua require('neo.tools').ToggleMouse()<CR>")
-- 保存全部文件并退出
U.nmap("<Leader>vq", "<Cmd>wa<CR>:q<CR>")
-- 不做任何保存直接退出
U.nmap("<Leader>vQ", "<Cmd>qa!<CR>")

-- 我的快捷键
U.nmap("<Leader>vs", "<Cmd>vsplit $ISCRATCH<CR>")

which_key_map.v = {
  ["name"] = "vim/my",
  ["m"] = "切换鼠标",
  ["q"] = "保存全部文件并退出",
  ["Q"] = "不做任何保存直接退出",
  ["s"] = "快捷笔记",
}

-- 元访问器只对 vim.g 有效，因此 vim.g.which_key_map.x
-- 不会触发元访问器来更新 vim.g.which_key_map 中的 x
-- vim.g.which_key_map = which_key_map

wk.register(which_key_map, { prefix = "<Leader>" })
