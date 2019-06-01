" keymap.vim
" vim 快捷键设定

" vim-which-key 插件配置
" ======================================================================
let g:which_key_map =  {
    \ 'name' : 'Leader',
    \ }

" 显式绑定到 '\'，写成 <Leader> 无效
call which_key#register('\', "g:which_key_map")

nnoremap <silent> <Leader>      :<c-u>WhichKey '\'<CR>
nnoremap <silent> <Localleader> :<c-u>WhichKey '\'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '\'<CR>


" 定义窗口相关的快捷键
" ======================================================================
" 以下形式表示以 <Leader>w 为前缀的快捷键，map 中的键为后续按键，以此类推
" 当 map 中的值是 list 时，第一列表示新定义的按键映射，第二列是这个快捷键的说明
" 当 map 中的值是 字符串 时，表示为已有快捷键的说明


let g:which_key_map.w = {
    \ 'name' : '+windows' ,
    \ 'w' : ['<C-W>w'     , '切换窗口']          ,
    \ 'c' : ['<C-W>c'     , '关闭窗口']          ,
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


" 定义文件相关的快捷键
" ======================================================================

" Leaderf 的配置项
let g:Lf_ShortcutF = '<Leader>ff' 
noremap <C-f>        :Leaderf rg<CR>

" 快速保存
nnoremap <silent> <Leader>fs    :update<CR>
vnoremap <silent> <Leader>fs    <Esc>:update<CR>
inoremap <silent> <Leader>fs    <Esc>:update<CR>

let g:which_key_map.f = {
    \ 'name' : '+files/search'      ,
    \ 'f' :                         '查找文件'           ,
    \ 's' :                         '保存文件'           ,
    \ 't' : [':NERDTreeToggle'   ,  '切换显示目录树']    ,
    \ 'l' : [':NERDTreeFind'     ,  '在目录树中定位']    ,
    \ }


" 定义 buffer 相关的快捷键
" ======================================================================

" Leaderf 的配置项
let g:Lf_ShortcutB = '<Leader>bf' 

let g:which_key_map.b = {
    \ 'name' : '+buffers'      ,
    \ 'f' :                         '查找 buffer'           ,
    \ }


" 定义 vim 控制的控制键
" ======================================================================

" <C-l> 消除高亮\重绘面
noremap <silent> <Leader>vl          :noh<CR>:redraw<CR>
" <C-m> 切换鼠标
noremap <Leader>vm                   :call mouse#ToggleMouse()<CR>

let g:which_key_map.v = {
    \ 'name' : '+vim'            ,
    \ 'm' :                         '切换鼠标'           ,
    \ 'l' :                         '消除高亮&重绘界面'  ,
    \ 'r' : [':source $MYVIMRC'  ,  '重新加载vimrc']     ,
    \ }

" ======================================================================
" 切换显示tag列表
noremap <silent> <Leader>t      :TagbarToggle<CR>

