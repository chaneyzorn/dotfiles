" keymap.vim
" vim 快捷键设定

" vim-which-key 插件配置
let g:which_key_map =  {
    \ 'name' : '+Leader',
    \ }

let g:which_key_map.w = {
    \ 'name' : '+windows' ,
    \ 'w' : ['<C-W>w'     , '切换窗口']          ,
    \ 'c' : ['<C-W>c'     , '关闭窗口']          ,
    \ 's' : ['<C-W>s'     , '水平分割窗口']      ,
    \ 'v' : ['<C-W>v'     , '垂直分割窗口']      ,
    \ 'h' : ['<C-W>h'     , '选择左边的窗口']    ,
    \ 'j' : ['<C-W>j'     , '选择下边的窗口']    ,
    \ 'l' : ['<C-W>l'     , '选择右边的窗口']    ,
    \ 'k' : ['<C-W>k'     , '选择上边的窗口']    ,
    \ '[' : ['<C-W>5<'    , '向左扩大窗口']      ,
    \ ']' : ['<C-W>5>'    , '向右扩大窗口']      ,
    \ '=' : [':resize +5'  , '向下扩大窗口']      ,
    \ '-' : [':resize -5'  , '向上扩大窗口']      ,
    \ '/' : ['<C-W>='     , '令窗口平分长度']    ,
    \ }

let g:which_key_map.f = {
    \ 'name' : '+files'   ,
    \ }

" 显示绑定到 '\'，写成 <Leader> 无效
call which_key#register('\', "g:which_key_map")

nnoremap <silent> <Leader>      :<c-u>WhichKey '\'<CR>
nnoremap <silent> <Localleader> :<c-u>WhichKey '\'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '\'<CR>

" <C-m> 切换鼠标
noremap <C-m>                   :call mouse#ToggleMouse()<CR>
" <C-l> 消除高亮\重绘界面
noremap <silent> <C-l>          :noh<CR>:redraw<CR>

" 顺手一点的窗口宽度调整
nnoremap <silent> <C-w>[        :vertical resize -5<CR>
nnoremap <silent> <C-w>]        :vertical resize +5<CR>

" 快速编辑和生效 .vimrc
nnoremap <Leader>ev             :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv             :source $MYVIMRC<CR>

" 切换显示目录树
noremap <silent> <Leader>h      :NERDTreeToggle<CR>
" 在目录树中定位到当前 buffer 文件
noremap <silent> <Leader>rt     :NERDTreeFind<CR>
" 切换显示tag列表
noremap <silent> <Leader>t      :TagbarToggle<CR>

" 快速保存
nnoremap <silent> <Leader>ss    :update<CR>
vnoremap <silent> <Leader>ss    <Esc>:write<CR>
inoremap <silent> <Leader>ss    <Esc>:write<CR>

" <C-p> 文件定位 <C-n> Buffer定位 <C-f> 内容搜索
noremap <C-f>                   :Leaderf rg<CR>

