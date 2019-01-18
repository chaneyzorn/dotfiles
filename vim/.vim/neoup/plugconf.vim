" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" ================================================================================

" 状态栏使用 powerline 字体
let g:airline_powerline_fonts = 1
" 选择一个状态栏主题
let g:airline_theme = 'minimalist'
" 显示 ale 诊断信
let g:airline#extensions#ale#enabled = 1



" Plug 'liuchengxu/space-vim-dark'
" ================================================================================

" 使用 space-vim-dark 色彩方案
colorscheme space-vim-dark
" 设置背景色深度
let g:space_vim_dark_background = 235
" 设置注释使用斜体，使背景色透明
highlight Comment    cterm=italic guifg=#00688B ctermfg=59
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE



" Plug 'luochen1990/rainbow'
" ================================================================================

" 自动启用彩虹括号，设置为0以手动启用
let g:rainbow_active = 1



" Plug 'Yggdroot/indentLine'
" ================================================================================

" 自动启用彩虹括号，设置为0以手动启用
" 默认不显示缩进线
let g:indentLine_enabled = 0



" Plug 'scrooloose/nerdcommenter'
" ================================================================================

" 不使用默认的键位
let g:NERDCreateDefaultMappings = 0
" 空格间隔，比如 /* int foo=2; */
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1
" 取消空白行注释时，连同去掉多余的空格
let g:NERDTrimTrailingWhitespace = 1
" 按代码左对齐注释
let g:NERDDefaultAlign = 'left'
" 将空行一起处理
let g:NERDCommentEmptyLines = 1
" 检查并注释选中范围中未注释的行
let g:NERDToggleCheckAllLines = 1



" Plug 'scrooloose/nerdtree'
" ================================================================================

" 不显示书签和帮助
let NERDTreeMinimalUI=1
" 默认显示隐藏文件
let NERDTreeShowHidden=1
" 忽略以下类型文件
let NERDTreeIgnore = ['\~$', '\.swp$', '\.pyc$']

augroup nerdtree
    autocmd!
    autocmd bufenter * :call <SID>ExitLastNERDTree()
augroup end

function! s:ExitLastNERDTree()
    if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
        execute "normal! :q\<cr>"
    endif
endfunction



" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" ================================================================================

let g:Lf_HideHelp = 1
let g:Lf_WindowHeight = 0.30
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_CacheDirectory = expand('~/.vim/cache')

let g:Lf_RootMarkers = ['.root', '.svn', '.git', '.hg', '.vim', '.idea', '.project']
let g:Lf_WildIgnore = {
    \ 'dir': ['.svn','.git','.hg', 'build', 'debug'],
    \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
    \ }

let g:Lf_MruMaxFiles = 2048
let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']

let g:Lf_ShortcutF = '<C-p>'
let g:Lf_ShortcutB = '<C-n>'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:Lf_NormalMap = {
        \ "File":     [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
		\ "Buffer":   [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
		\ "Mru":      [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
		\ "Tag":      [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
		\ "BufTag":   [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
		\ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
		\ }



" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
" ================================================================================

" 不使用默认键位
let g:gutentags_plus_nomap = 1
" 使用 pygments 辅助 gtags 支持更多的语言
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/share/gtags/gtags.conf'
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = ["ctags", "gtags_cscope"]

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')
" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px', '--c-kinds=+px']
" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']



" Plug 'w0rp/ale'
" ================================================================================

let g:ale_set_highlights = 0
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '✹'
let g:ale_sign_info = '•'
let g:ale_echo_msg_error_str = '✖ Error'
let g:ale_echo_msg_warning_str = '✹ Warning'
let g:ale_echo_msg_info_str = '• Info'

let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" compile_commands.json still not work well with clang easily
" see https://github.com/w0rp/ale/issues/1163#issuecomment-352585720
let g:ale_c_build_dir_names = ['build', 'debug', 'bin']
let g:ale_c_parse_compile_commands = 1

" see https://github.com/MaskRay/ccls/wiki/Customization
let g:ale_c_ccls_init_options = {
    \    'cacheDirectory': '~/.cache/ccls',
    \ }

" 未指定的依然会使用全部可能的linter
" 除非 let g:ale_linters_explicit = 1
let g:ale_linters = {
    \    'c': ['clangtidy', 'ccls', 'cppcheck'],
    \    'cpp': ['clangtidy', 'ccls', 'cppcheck'],
    \ }



" Plug 'Valloric/YouCompleteMe'
" ================================================================================
" 
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_server_log_level = 'info'
" let g:ycm_min_num_identifier_candidate_chars = 2
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_complete_in_strings = 1
" let g:ycm_confirm_extra_conf = 0
" " let g:ycm_global_ycm_extra_conf = expand('~/.vim/ycm_extra_conf.py')
" 
" let g:ycm_semantic_triggers =  {
" \   'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
" \   'cs,lua,javascript': ['re!\w{2}'],
" \}



" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install'}
" ================================================================================

"  使用<TAB>键采纳补全结果
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

