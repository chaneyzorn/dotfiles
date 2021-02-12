-- keybind.lua
-- vim 快捷键设定
-- 注意 <Plug> 不能使用在 noremap 中
local U = require("neo.tools")

-- vim-which-key 插件配置
local which_key_map = {name = "Leader"}

-- 定义窗口相关的快捷键
-- 以下形式表示以 <Leader>w 为前缀的快捷键，map 中的键为后续按键，以此类推
-- 当 map 中的值是 list 时，第一列表示新定义的按键映射，第二列是这个快捷键的说明
-- 当 map 中的值是 字符串 时，表示为已有快捷键的说明
which_key_map.w = {
  ["name"] = "+windows",
  ["p"] = {"<C-W>p", "上一窗口"},
  ["n"] = {":vnew", "新建窗口"},
  ["c"] = {"<C-W>c", "关闭当前窗口"},
  ["o"] = {"<C-W>o", "关闭其他窗口"},
  ["s"] = {"<C-W>s", "水平分割窗口"},
  ["v"] = {"<C-W>v", "垂直分割窗口"},
  ["w"] = {"<C-W>w", "选择下一个窗口"},
  ["h"] = {"<C-W>h", "选择左边的窗口"},
  ["j"] = {"<C-W>j", "选择下边的窗口"},
  ["l"] = {"<C-W>l", "选择右边的窗口"},
  ["k"] = {"<C-W>k", "选择上边的窗口"},
  ["["] = {"<C-W>5<", "向左扩大窗口"},
  ["]"] = {"<C-W>5>", "向右扩大窗口"},
  ["="] = {":resize +5", "向下扩大窗口"},
  ["-"] = {":resize -5", "向上扩大窗口"},
  ["/"] = {"<C-W>=", "令窗口平分长度"},
}

-- 定义 tab、翻译 相关的快捷键

-- 翻译光标下的文本，在命令行回显翻译内容
U.nmap("<Leader>tw", "<Plug>Translate")
U.vmap("<Leader>tw", "<Plug>TranslateV")
-- 翻译光标下的文本，在窗口中显示翻译内容
U.nmap("<Leader>ts", "<Plug>TranslateW")
U.vmap("<Leader>ts", "<Plug>TranslateWV")
U.nmap("<Leader>th", "<Plug>TranslateF")
U.nmap("<Leader>tx", "<Plug>TranslateX")

-- vista 快捷键配置
U.nmap("<Leader>tb", ":<C-u>Vista!!<CR>")

which_key_map.t = {
  ["name"] = "+tab/translate/tags",
  ["n"] = {"tabnew", "打开新 tab"},
  ["c"] = {"tabclose", "关闭当前tab"},
  ["o"] = {"tabonly", "关闭其他tab"},
  ["]"] = {"tabnext", "下一个tab"},
  ["["] = {"tabprevious", "上一个tab"},
  ["f"] = {"tabfirst", "第一个tab"},
  ["l"] = {"tablast", "最后一个tab"},
  ["w"] = "翻译单词",
  ["r"] = "新建浮窗终端",
  ["s"] = "展示翻译",
  ["t"] = "切换浮窗终端",
  ["h"] = "翻译历史记录",
  ["x"] = "翻译clipboard",
  ["b"] = "显示大纲",
}

-- 定义 buffer 相关的快捷键
which_key_map.b = {
  ["name"] = "+buffers",
  ["t"] = {"bfirst", "first-buffer"},
  ["l"] = {"blast", "last-buffer"},
  ["b"] = {"bnext", "next-buffer"},
  ["p"] = {"bprevious", "previous-buffer"},
  ["d"] = {"bdelete", "delete-buffer"},
  ["h"] = {"Startify", "home-buffer"},
}

-- 定义文件相关的快捷键

-- 搜索窗口
U.nmap("<Leader>fw", ":<C-U>LeaderfWindow<CR>")
-- 内容关键词 fuzzy 搜索
U.nmap("<Leader>fd", ":<C-U>Leaderf rg<CR>")
-- 光标下单词搜索文件
U.nmap("<Leader>fq", ":<C-U>LeaderfFileCword<CR>")
-- 内容关键词搜索
U.nmap("<Leader>fe", "<Plug>LeaderfRgPrompt")
-- 光标下单词搜索
U.nmap("<Leader>fc", "<Plug>LeaderfRgBangCwordRegexBoundary<CR>")
-- 可视化下被选中的内容搜索
U.vmap("<Leader>fc", "<Plug>LeaderfRgBangVisualRegexNoBoundary<CR>")

-- 快速保存
U.nmap("<Leader>fs", ":update<CR>")
U.vmap("<Leader>fs", "<Esc>:update<CR>")
U.imap("<Leader>fs", "<Esc>:update<CR>")
U.nmap("<C-s>", ":update<CR>")
U.vmap("<C-s>", "<Esc>:update<CR>")
U.imap("<C-s>", "<Esc>:update<CR>")
-- 重新加载文件
U.nmap("<Leader>fr", ":edit<CR>")

which_key_map.f = {
  ["name"] = "+files/search",
  ["b"] = "查找 buffer",
  ["f"] = "查找文件",
  ["q"] = "查找光标下的文件",
  ["e"] = "查找文件内容",
  ["w"] = "查找窗口",
  ["d"] = "模糊查找文件内容",
  ["c"] = "查找光标下的单词",
  ["r"] = "重新加载文件",
  ["s"] = "保存文件",
  ["t"] = {":NvimTreeToggle", "切换显示目录树"},
  ["l"] = {":NvimTreeFindFile", "在目录树中定位"},
}

-- 定义 git 和 跳转相关的快捷键
U.nmap("<Leader>gb", ":<C-u>call gitblame#echo()<CR>", {silent = false})

-- coc 快捷键配置, 代码跳转
U.nmap("<Leader>gg", "<Plug>(coc-definition)")
U.nmap("<Leader>gs", "<Plug>(coc-declaration)")
U.nmap("<Leader>gt", "<Plug>(coc-type-definition)")
U.nmap("<Leader>gi", "<Plug>(coc-implementation)")
U.nmap("<Leader>gr", "<Plug>(coc-references)")

-- ale 快捷键配置
U.nmap("<Leader>gl", "<Plug>(ale_toggle)", {silent = false})
U.nmap("<Leader>ge", "<Plug>(ale_next_wrap_error)")
U.nmap("<Leader>gE", "<Plug>(ale_previous_wrap_error)")
U.nmap("<Leader>gw", "<Plug>(ale_next_wrap)")
U.nmap("<Leader>gW", "<Plug>(ale_previous_wrap)")

-- vim-signify 快捷键配置
U.nmap("<Leader>gd", ":SignifyHunkDiff<CR>")
U.nmap("<Leader>gu", ":SignifyHunkUndo<CR>")

which_key_map.g = {
  ["name"] = "+git/goto",
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
  ["B"] = {":Gblame", "gitblame全文件"},
}

-- 定义 coding 快捷键

-- better-whitespace 快捷键配置
U.vmap("<Leader>ct", ":StripWhitespace<CR>")
U.nmap("<Leader>ct", ":<C-u>StripWhitespace<CR>")

-- coc 快捷键配置
U.nmap("<Leader>ct", "<Plug>(coc-format)")
U.vmap("<Leader>ct", "<Plug>(coc-format-selected)")
U.nmap("<Leader>cp", ":<C-u>CocCommand<CR>")
-- 手动启动 Coc Service
U.nmap("<Leader>cx", ":<C-u>CocStart<CR>")

-- sbdchd/neoformat 快捷键配置
U.nmap("<Leader>cf", ":<C-u>Neoformat<CR>")
U.vmap("<Leader>cf", ":<C-u>Neoformat<CR>")

-- nerdcommenter 快捷键配置
-- 根据选中的第一行反转注释状态
U.xmap("<Leader>cc", "<Plug>NERDCommenterToggle")
U.nmap("<Leader>cc", "<Plug>NERDCommenterToggle")
-- 反转注释状态
U.xmap("<Leader>ci", "<Plug>NERDCommenterInvert")
U.nmap("<Leader>ci", "<Plug>NERDCommenterInvert")
-- 风格精致的注释
U.xmap("<Leader>cs", "<Plug>NERDCommenterSexy")
U.nmap("<Leader>cs", "<Plug>NERDCommenterSexy")

-- multiple-cursor 快捷键
U.nmap("<Leader>cr", ":MultipleCursorsFind<Space>")
U.vmap("<Leader>cr", ":MultipleCursorsFind<Space>")

-- ultisnips 快捷键
U.nmap("<Leader>co", ":<C-u>UltiSnipsEdit<CR>")

-- 拼写检查
U.nmap("<Leader>ck", ":set spell!<CR>")

which_key_map.c = {
  ["name"] = "+code/coc/comment",
  ["c"] = "根据首行反转注释",
  ["d"] = "生成代码文档",
  ["i"] = "反转注释",
  ["s"] = "精致注释",
  ["f"] = "格式化代码",
  ["t"] = "coc全格式化代码",
  ["k"] = "拼写检查",
  ["p"] = "coc下拉菜单",
  ["r"] = "多光标选中匹配",
  ["o"] = "编辑当前类型代码片段",
}

-- 定义 yank to system clipboard"
-- see :help clipboard

-- Copy to clipboard
-- 可视化复制选中内容到 clipboard
U.vmap("<C-y>", [["+y]])
-- normal 模式复制当前行到 clipboard
U.nmap("<C-y>", ":lua require('neo.tools').YankOneLine()<CR>")
-- normal 模式复制全部内容 clipboard
U.nmap("<Leader>yy", ":<C-u>%y+<CR>")

-- Paste from clipboard
U.nmap("<C-p>", [["+p]])
U.vmap("<C-p>", [["+p]])

-- 定义 vim 控制的控制键

-- <C-l> 消除高亮/重绘面
U.nmap("<C-l>", ":noh<CR>:redraw<CR>")
U.nmap("<Leader>vl", ":noh<CR>:redraw<CR>")
-- <C-m> 切换鼠标
U.nmap("<Leader>vm", ":lua require('neo.tools').ToggleMouse()<CR>")
-- 保存全部文件并退出
U.nmap("<Leader>vq", ":wa<CR>:q<CR>")
-- 不做任何保存直接退出
U.nmap("<Leader>vQ", ":qa!<CR>")

-- 我的快捷键
U.nmap("<Leader>vs", ":vsplit $ISCRATCH<CR>")

which_key_map.v = {
  ["name"] = "+vim/my",
  ["m"] = "切换鼠标",
  ["l"] = "消除高亮&重绘界面",
  ["q"] = "保存全部文件并退出",
  ["Q"] = "不做任何保存直接退出",
  ["r"] = {":source $MYVIMRC", "重新加载vimrc"},
  ["s"] = "快捷笔记",
}

-- 元访问器只对 vim.g 有效，因此 vim.g.which_key_map.x
-- 不会触发元访问器来更新 vim.g.which_key_map 中的 x
vim.g.which_key_map = which_key_map
-- 显式绑定到 "\"，写成 <Leader> 无效
vim.fn["which_key#register"]("\\", "g:which_key_map")

-- 绑定单独的 <Leader> 键作为 WhichKey 的快捷键
U.nmap("<Leader>", ":<C-u>WhichKey '\\'<CR>")
U.vmap("<Leader>", ":<C-u>WhichKeyVisual '\\'<CR>")
U.nmap("<Localleader>", ":<C-u>WhichKey '\\'<CR>")
U.vmap("<Localleader>", ":<C-u>WhichKeyVisual '\\'<CR>")
