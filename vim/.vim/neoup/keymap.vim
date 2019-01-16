" 顺手一点的窗口宽度调整
nnoremap <silent> <C-w>[ :vertical resize -5<CR>
nnoremap <silent> <C-w>] :vertical resize +5<CR>
" 快速编辑和生效 .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" 切换显示目录树
noremap <silent> <C-h> :NERDTreeToggle<CR>
" 快速保存
nnoremap <silent> <leader>sf :write<CR>
vnoremap <silent> <leader>sf <Esc>:write<CR>
inoremap <silent> <leader>sf <Esc>:write<CR>

