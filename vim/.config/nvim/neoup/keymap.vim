" 切换鼠标
noremap <C-m> :call mouse#ToggleMouse()<CR>
" 消除高亮\重绘界面
noremap <silent> <C-l> :noh<CR>:redraw<CR>

" 顺手一点的窗口宽度调整
nnoremap <silent> <C-w>[ :vertical resize -5<CR>
nnoremap <silent> <C-w>] :vertical resize +5<CR>

" 快速编辑和生效 .vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" 切换显示目录树
noremap <silent> <Leader>h :NERDTreeToggle<CR>
" 切换显示tag列表
noremap <silent> <Leader>t :TagbarToggle<CR>
" 切换显示代码缩进尺
noremap <silent> <Leader>ci :IndentLinesToggle<CR>

" 快速保存
nnoremap <silent> <Leader>ss :write<CR>
vnoremap <silent> <Leader>ss <Esc>:write<CR>
inoremap <silent> <Leader>ss <Esc>:write<CR>

" <C-p> 文件定位 <C-n> Buffer定位 <C-f> 内容搜索
noremap <C-f> :Leaderf rg<CR>

" 快捷注释文本
nmap <C-\> <Plug>NERDCommenterInvert
" 注意 <Plug> 序列只在递归映射中有效

" linter 跳转
nmap <Leader>en <Plug>(ale_next)
nmap <Leader>ep <Plug>(ale_previous)
nmap <Leader>ts :ALEToggle<CR>

