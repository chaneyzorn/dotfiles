" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" ------------------------------------------------------------

" 状态栏使用 powerline 字体
let g:airline_powerline_fonts = 1
" 选择一个状态栏主题
let g:airline_theme = 'minimalist'



" Plug 'liuchengxu/space-vim-dark'
" ------------------------------------------------------------

" 使用 space-vim-dark 色彩方案
colorscheme space-vim-dark
" 设置背景色深度
let g:space_vim_dark_background = 235
" 设置注释使用斜体，使背景色透明
highlight Comment    cterm=italic guifg=#5c6370 ctermfg=59
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE



" Plug 'luochen1990/rainbow'
" ------------------------------------------------------------

" 自动启用彩虹括号，设置为0以手动启用
let g:rainbow_active = 1



" Plug 'Yggdroot/indentLine'
" ------------------------------------------------------------

" 自动启用彩虹括号，设置为0以手动启用
" 默认不显示缩进线
let g:indentLine_enabled = 0



" Plug 'scrooloose/nerdtree'
" ------------------------------------------------------------

" 默认显示隐藏文件
let NERDTreeShowHidden=1



" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
" ------------------------------------------------------------

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



" Plug 'Valloric/YouCompleteMe'
" ------------------------------------------------------------

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
let g:ycm_confirm_extra_conf = 0
" let g:ycm_global_ycm_extra_conf = expand('~/.vim/ycm_extra_conf.py')

let g:ycm_semantic_triggers =  {
\   'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
\   'cs,lua,javascript': ['re!\w{2}'],
\}



