" 切换鼠标
noremap <Leader>m :call mouse#ToggleMouse()<CR>
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
" 快速保存
nnoremap <silent> <Leader>ss :write<CR>
vnoremap <silent> <Leader>ss <Esc>:write<CR>
inoremap <silent> <Leader>ss <Esc>:write<CR>

