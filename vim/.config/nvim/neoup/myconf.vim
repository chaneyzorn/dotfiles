" myconf.vim
" vim 内置选项的自定义设定
" 部分默认设定由 Plug 'tpope/vim-sensible' 指定

" 自动检查并安装 vim-plug 包管理器
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 设置 <Leader> 键
" let g:mapleader = " "
" let g:maplocaleader = ','
set timeoutlen=500

" 设置编码为 utf-8
set encoding=utf-8
" 设置读取当前目录下配置，并且禁用危险命令
set exrc secure
" 使光标下方至少显示五行高度
set scrolloff=5
" 显示行号 高亮光标所在的行
set number cursorline
" 显示相对行号
" set relativenumber
" 总是显示指示列
set signcolumn=auto:3
" Smaller updatetime for CursorHold & CursorHoldI & swapfile
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" 开启新行时对齐到当前行; 使用合适的空格替代插入 <Tab>
set autoindent smartindent expandtab
" 设置缩进为4个空格 一个 <Tab> 等同于4个空格 每4个空格等同于一个 <Tab>
set shiftround shiftwidth=4 tabstop=4 softtabstop=4
" 设置 tab 字符的显示
set list listchars=tab:>·
" 设置窗口分割线为连续实线
set fillchars=vert:\│
" 设置搜索高亮
set hlsearch incsearch
" 搜索大小写不敏感，除非包含大写字母
set ignorecase smartcase

" 设置背景颜色
set background=dark
" 在终端中使用gui高亮色，以支持 true color
set termguicolors
" 设置 true color 之后，以下设置纠正部分终端的颜色问题
" see :help xterm-true-color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" 使用增强状态栏后不再需要 vim 的模式提示
set noshowmode
" 设置命令行高为2，提供足够的显示空间
set cmdheight=2
" vim 命令补全，提供类似 zsh 补全的可视待选项
set wildmenu
" 当文件被外部程序修改时，自动加载
set autoread
" 禁止折行
set nowrap

set tags=./.tags;,.tags,~/.cache/tags/sys-.tags
set path=.,/usr/include,/usr/include/*,/usr/lib/*/include,/usr/lib/gcc/**/include

let g:python_host_prog = "~/Pyvenv/venv2.7/bin/python2"
let g:python3_host_prog = "~/Pyvenv/venv3/bin/python3"
