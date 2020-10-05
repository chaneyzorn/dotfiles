" postplugconf.vim
" 与插件定制功能相关的配置，在插件载入后配置（调用型的配置）


" Plug 'liuchengxu/space-vim-theme'
" ================================================================================
colorscheme space_vim_theme

hi Comment    guifg=#00688B ctermfg=59
hi CursorLine ctermbg=238 guibg=#133440
hi WildMenu   ctermfg=172 ctermbg=238 guifg=#d78700 guibg=#444444 guisp=NONE cterm=NONE,bold gui=NONE,bold
hi StatusLine ctermfg=173 ctermbg=233 guifg=#e18254 guibg=#262626 guisp=NONE cterm=NONE gui=NONE


" Plug 'RRethy/vim-illuminate'
" ================================================================================

" 使用下划线标记光标下相同的单词
hi illuminatedWord cterm=underline gui=underline



" build-in terminal color
" ================================================================================
" xfce4/terminal/colorschemes/chaney_dark.theme

let g:terminal_color_0  = "#073642"
let g:terminal_color_1  = "#dc322f"
let g:terminal_color_2  = "#EBCB8B"
let g:terminal_color_3  = "#AAB288"
let g:terminal_color_4  = "#9DA786"
let g:terminal_color_5  = "#d33682"
let g:terminal_color_6  = "#16D5B6"
let g:terminal_color_7  = "#eee8d5"
let g:terminal_color_8  = "#22444D"
let g:terminal_color_9  = "#cb4b16"
let g:terminal_color_10 = "#586e75"
let g:terminal_color_11 = "#657b83"
let g:terminal_color_12 = "#839496"
let g:terminal_color_13 = "#6c71c4"
let g:terminal_color_14 = "#93a1a1"
let g:terminal_color_15 = "#fdf6e3"

let g:terminal_ansi_colors = [
    \ "#073642","#dc322f","#EBCB8B","#AAB288","#9DA786","#d33682","#16D5B6","#eee8d5",
    \ "#22444D","#cb4b16","#586e75","#657b83","#839496","#6c71c4","#93a1a1","#fdf6e3"
    \ ]


" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ================================================================================

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" end preplugconf
