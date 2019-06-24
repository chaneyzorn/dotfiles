" keymap.vim
" vim 快捷键设定

" vim-which-key 插件配置
" ======================================================================
let g:which_key_map = {}
let g:which_key_map['name'] =  'Leader'

" 显式绑定到 '\'，写成 <Leader> 无效
call which_key#register('\', "g:which_key_map")

" 绑定单独的 <Leader> 键作为 WhichKey 的快捷键
nnoremap <silent> <Leader>      :<c-u>WhichKey '\'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '\'<CR>
nnoremap <silent> <Localleader> :<c-u>WhichKey '\'<CR>
vnoremap <silent> <Localleader> :<c-u>WhichKeyVisual '\'<CR>


" 快速选择 window | tab | buffer
for s:i in range(1, 9)
  " <Leader>w[1-9] 选择 window [1-9]
  execute 'nnoremap <Leader>w'.s:i ' :'.s:i.'wincmd w<CR>'

  " <Leader>t[1-9] 选择 tab [1-9]
  execute 'nnoremap <Leader>t'.s:i s:i.'gt'

  " <Leader>b[1-9] 选择 buffer [1-9]
  execute 'nnoremap <Leader>b'.s:i ':b'.s:i.'<CR>'
endfor
unlet s:i


" 定义窗口相关的快捷键
" ======================================================================
" 以下形式表示以 <Leader>w 为前缀的快捷键，map 中的键为后续按键，以此类推
" 当 map 中的值是 list 时，第一列表示新定义的按键映射，第二列是这个快捷键的说明
" 当 map 中的值是 字符串 时，表示为已有快捷键的说明



let g:which_key_map.w = {
    \ 'name' : '+windows' ,
    \ 'w' : ['<C-W>w'     , '下一窗口']          ,
    \ 'p' : ['<C-W>p'     , '上一窗口']          ,
    \ 'n' : [':vnew'      , '新建窗口']          ,
    \ 'c' : ['<C-W>c'     , '关闭当前窗口']      ,
    \ 'o' : ['<C-W>o'     , '关闭其他窗口']      ,
    \ 's' : ['<C-W>s'     , '水平分割窗口']      ,
    \ 'v' : ['<C-W>v'     , '垂直分割窗口']      ,
    \ 'h' : ['<C-W>h'     , '选择左边的窗口']    ,
    \ 'j' : ['<C-W>j'     , '选择下边的窗口']    ,
    \ 'l' : ['<C-W>l'     , '选择右边的窗口']    ,
    \ 'k' : ['<C-W>k'     , '选择上边的窗口']    ,
    \ '[' : ['<C-W>5<'    , '向左扩大窗口']      ,
    \ ']' : ['<C-W>5>'    , '向右扩大窗口']      ,
    \ '=' : [':resize +5' , '向下扩大窗口']      ,
    \ '-' : [':resize -5' , '向上扩大窗口']      ,
    \ '/' : ['<C-W>='     , '令窗口平分长度']    ,
    \ }


" 定义 tab、翻译 相关的快捷键
" ======================================================================

" 翻译光标下的文本，在命令行回显翻译内容
nmap <silent> <Leader>tw <Plug>Translate
vmap <silent> <Leader>tw <Plug>TranslateV
" 翻译光标下的文本，在窗口中显示翻译内容
nmap <silent> <Leader>ts <Plug>TranslateW
vmap <silent> <Leader>ts <Plug>TranslateWV
nmap <silent> <Leader>th <Plug>TranslateF

" vista 快捷键配置
nnoremap <silent> <Leader>tb :Vista!!<CR>

let g:which_key_map.t = {
    \ 'name': '+tab/translate/tags',
    \ '1' :                  'tab-1'          ,
    \ '2' :                  'tab-2'          ,
    \ '3' :                  'tab-3'          ,
    \ '4' :                  'tab-4'          ,
    \ '5' :                  'tab-5'          ,
    \ '6' :                  'tab-6'          ,
    \ '7' :                  'tab-7'          ,
    \ '8' :                  'tab-8'          ,
    \ '9' :                  'tab-9'          ,
    \ 'n' : ['tabnew'      , '打开新 tab' ]   ,
    \ 'c' : ['tabclose'    , '关闭当前tab']   ,
    \ 'o' : ['tabonly'     , '关闭其他tab']   ,
    \ 't' : ['tabnext'     , '下一个tab' ]    ,
    \ 'p' : ['tabprevious' , '上一个tab' ]    ,
    \ 'f' : ['tabfirst'    , '第一个tab' ]    ,
    \ 'l' : ['tablast'     , '最后一个tab' ]  ,
    \ 'w' :                  '翻译单词'       ,
    \ 's' :                  '展示翻译'       ,
    \ 'h' :                  '翻译历史记录'   ,
    \ 'b' :                  '切换大纲展示'   ,
    \ }


" 定义 buffer 相关的快捷键
" ======================================================================

" Leaderf 的配置项
let g:Lf_ShortcutB = '<Leader>bf'

let g:which_key_map.b = {
    \ 'name' : '+buffers'      ,
    \ '1' :                'buffer-1'         ,
    \ '2' :                'buffer-2'         ,
    \ '3' :                'buffer-3'         ,
    \ '4' :                'buffer-4'         ,
    \ '5' :                'buffer-5'         ,
    \ '6' :                'buffer-6'         ,
    \ '7' :                'buffer-7'         ,
    \ '8' :                'buffer-8'         ,
    \ '9' :                'buffer-9'         ,
    \ 'f' :                '查找 buffer'      ,
    \ 't' : ['bfirst'    , 'first-buffer']    ,
    \ 'l' : ['blast'     , 'last-buffer']     ,
    \ 'b' : ['bnext'     , 'next-buffer']     ,
    \ 'p' : ['bprevious' , 'previous-buffer'] ,
    \ 'd' : ['bdelete'   , 'delete-buffer']   ,
    \ 'h' : ['Startify'  , 'home-buffer']     ,
    \ }


" 定义文件相关的快捷键
" ======================================================================

" Leaderf 的配置项
let g:Lf_ShortcutF = '<Leader>ff'
" 内容关键词搜索
nnoremap <C-f>           :<C-U>Leaderf rg<CR>
nnoremap <Leader>fw      :<C-U>Leaderf rg<CR>
" 光标下单词搜索文件
nnoremap <Leader>fq      :<C-U>LeaderfFileCword<CR>
" 注意 <Plug> 不能使用在 noremap 中
" 光标下单词搜索
nmap <Leader>fc   <Plug>LeaderfRgBangCwordRegexBoundary<CR>
" 可视化下被选中的内容搜索
vmap <Leader>fc   <Plug>LeaderfRgBangVisualRegexNoBoundary<CR>

" 快速保存
nnoremap <silent> <Leader>fs    :update<CR>
vnoremap <silent> <Leader>fs    <Esc>:update<CR>
inoremap <silent> <Leader>fs    <Esc>:update<CR>
nnoremap <silent> <C-s>         :update<CR>
vnoremap <silent> <C-s>         <Esc>:update<CR>
inoremap <silent> <C-s>         <Esc>:update<CR>

" 重新加载文件
nnoremap <silent> <Leader>fr    :edit<CR>

let g:which_key_map.f = {
    \ 'name' : '+files/search'      ,
    \ 'f' :                         '查找文件'           ,
    \ 'q' :                         '查找光标下的文件'   ,
    \ 'w' :                         '查找文件内容'       ,
    \ 'c' :                         '查找光标下的单词'   ,
    \ 'r' :                         '重新加载文件'       ,
    \ 's' :                         '保存文件'           ,
    \ 't' : [':NERDTreeToggle'   ,  '切换显示目录树']    ,
    \ 'l' : [':NERDTreeFind'     ,  '在目录树中定位']    ,
    \ }


" 定义 git 和 跳转相关的快捷键
" ======================================================================

nnoremap <Leader>gb  :<C-u>call gitblame#echo()<CR>

" coc 快捷键配置, 代码跳转
nmap <silent> <Leader>gg <Plug>(coc-definition)
nmap <silent> <Leader>gs <Plug>(coc-declaration)
nmap <silent> <Leader>gt <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" ale 快捷键配置
nnoremap      <Leader>gl :ALELint<CR>
nmap <silent> <Leader>ge <Plug>(ale_next_wrap_error)
nmap <silent> <Leader>gE <Plug>(ale_previous_wrap_error)
nmap <silent> <Leader>gw <Plug>(ale_next_wrap)
nmap <silent> <Leader>gW <Plug>(ale_previous_wrap)

let g:which_key_map.g = {
    \ 'name' : '+git/goto'      ,
    \ 'l' :                        '生成lint信息'          ,
    \ 'e' :                        '跳转到下一个错误'      ,
    \ 'E' :                        '跳转到上一个错误'      ,
    \ 'w' :                        '跳转到下一个警告'      ,
    \ 'W' :                        '跳转到上一个警告'      ,
    \ 'g' :                        '跳转到定义'            ,
    \ 's' :                        '跳转到申明'            ,
    \ 't' :                        '跳转到类型'            ,
    \ 'i' :                        '跳转到实现'            ,
    \ 'r' :                        '展示所有引用'          ,
    \ 'b' :                        'gitblame当前行'        ,
    \ 'B' : [':Gblame'         ,   'gitblame全文件']       ,
    \ }


" 定义 coding 快捷键
" ======================================================================

" coc 快捷键配置
nmap     <silent> <Leader>cf <Plug>(coc-format)
vmap     <silent> <Leader>cf <Plug>(coc-format-selected)
nnoremap <silent> <Leader>cp :CocCommand<CR>
inoremap <silent><expr> <c-space> coc#refresh()


" nerdcommenter 快捷键配置
" 切换到第二种注释符
nmap  <slient>  <Leader>ca           <Plug>NERDCommenterAltDelims
" 在当前行之后放置注释符并进入插入模式
nmap  <slient>  <Leader>cA           <Plug>NERDCommenterAppend
" 注释并对齐
xmap  <slient>  <Leader>cb           <Plug>NERDCommenterAlignBoth
nmap  <slient>  <Leader>cb           <Plug>NERDCommenterAlignBoth
" 注释代码
xmap  <slient>  <Leader>cc           <Plug>NERDCommenterComment
nmap  <slient>  <Leader>cc           <Plug>NERDCommenterComment
" 反转注释状态
xmap  <slient>  <Leader>ci           <Plug>NERDCommenterInvert
nmap  <slient>  <Leader>ci           <Plug>NERDCommenterInvert
" 注释并左对齐
xmap  <slient>  <Leader>cl           <Plug>NERDCommenterAlignLeft
nmap  <slient>  <Leader>cl           <Plug>NERDCommenterAlignLeft
" 最少注释符的块注释
xmap  <slient>  <Leader>cm           <Plug>NERDCommenterMinimal
nmap  <slient>  <Leader>cm           <Plug>NERDCommenterMinimal
" 嵌套注释
xmap  <slient>  <Leader>cn           <Plug>NERDCommenterNested
nmap  <slient>  <Leader>cn           <Plug>NERDCommenterNested
" 风格精致的注释
xmap  <slient>  <Leader>cs           <Plug>NERDCommenterSexy
nmap  <slient>  <Leader>cs           <Plug>NERDCommenterSexy
" 取消一层注释
xmap  <slient>  <Leader>cu           <Plug>NERDCommenterUncomment
nmap  <slient>  <Leader>cu           <Plug>NERDCommenterUncomment
xmap  <slient>  <Leader>cy           <Plug>NERDCommenterYank
nmap  <slient>  <Leader>cy           <Plug>NERDCommenterYank
" 从光标位置注释到行尾
nmap  <slient>  <Leader>c$           <Plug>NERDCommenterToEOL
" 根据选中的第一行反转注释状态
xmap  <slient>  <Leader>c<Space>     <Plug>NERDCommenterToggle
nmap  <slient>  <Leader>c<Space>     <Plug>NERDCommenterToggle


let g:which_key_map.c = {
    \ 'name': '+code/coc/comment'    ,
    \ 'a' :                        '切换副注释符'    ,
    \ 'A' :                        '行尾注释'        ,
    \ 'b' :                        '对齐注释'        ,
    \ 'c' :                        '注释代码'        ,
    \ 'i' :                        '反转注释'        ,
    \ 'l' :                        '左对齐注释'      ,
    \ 'm' :                        '首尾块注释'      ,
    \ 'n' :                        '嵌套注释'        ,
    \ 's' :                        '精致注释'        ,
    \ 'u' :                        '取消注释'        ,
    \ 'y' :                        '？？注释'        ,
    \ '$' :                        '注释到行尾'      ,
    \ '<Spc>' :                    '根据首行反转注释',
    \ 'f' :                        '全格式化'        ,
    \ 'p' :                        'coc下拉注释'     ,
    \ }


" 定义 vim 控制的控制键
" ======================================================================

" <C-l> 消除高亮\重绘面
noremap <silent> <Leader>vl          :noh<CR>:redraw<CR>
" <C-m> 切换鼠标
noremap <Leader>vm                   :call mouse#ToggleMouse()<CR>
" 保存全部文件并退出
noremap <Leader>vq                   :wa<CR>:q<CR>
" 不做任何保存直接退出
noremap <Leader>vQ                   :qa!<CR>

let g:which_key_map.v = {
    \ 'name' : '+vim'            ,
    \ 'm' :                         '切换鼠标'              ,
    \ 'l' :                         '消除高亮&重绘界面'     ,
    \ 'q' :                         '保存全部文件并退出'    ,
    \ 'Q' :                         '不做任何保存直接退出'  ,
    \ 'r' : [':source $MYVIMRC'  ,  '重新加载vimrc']        ,
    \ }

