" postplugconf.vim
" 与插件定制功能相关的配置，在插件载入后配置（调用型的配置）


" Plug 'liuchengxu/space-vim-theme'
" ================================================================================
colorscheme space_vim_theme

hi Comment    guifg=#00688B ctermfg=59
hi CursorLine ctermbg=238 guibg=#133440
hi WildMenu   ctermfg=172 ctermbg=238 guifg=#d78700 guibg=#444444 guisp=NONE cterm=NONE,bold gui=NONE,bold
hi StatusLine ctermfg=173 ctermbg=233 guifg=#e18254 guibg=#262626 guisp=NONE cterm=NONE gui=NONE



" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install'}
" ================================================================================

call coc#add_extension(
    \ 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-css',
    \ 'coc-json', 'coc-vimlsp', 'coc-yaml', 'coc-snippets',
    \ 'coc-python', 'coc-lists', 'coc-marketplace', 'coc-pairs',
    \ 'coc-dictionary', 'coc-word', 'coc-emoji', 'coc-syntax', 'coc-go'
    \ )


" end preplugconf
