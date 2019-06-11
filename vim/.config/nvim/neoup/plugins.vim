" plugins.vim
" Plug 插件管理器管理的插件目录


" 安装插件包到 plugged 目录
call plug#begin('~/.vim/plugged')
" 个人自定义的一些工具
Plug g:neohome.'/moetools'

" 一组最通用的默认配置
Plug 'tpope/vim-sensible'
" vim 启动第一屏
Plug 'mhinz/vim-startify'


" 指示快捷键
Plug 'liuchengxu/vim-which-key'
" 增强的状态栏
Plug 'vim-airline/vim-airline'
" 状态栏主题包
Plug 'vim-airline/vim-airline-themes'
" 颜色主题
Plug 'liuchengxu/space-vim-dark'
Plug 'joshdick/onedark.vim'
" 显示文件类型图标
Plug 'ryanoasis/vim-devicons'

" 显示出尾部的无用空格
Plug 'ntpeters/vim-better-whitespace'
" 彩虹显示匹配的括号
Plug 'luochen1990/rainbow'
" 补全成对括号
Plug 'jiangmiao/auto-pairs'
" 成对操作括号和引号等
Plug 'tpope/vim-surround'
" 显示缩进线
Plug 'Yggdroot/indentLine'
" 高亮光标下相同的单词
" Plug 'itchyny/vim-cursorword'
Plug 'RRethy/vim-illuminate'
" 多光标编辑操作
" Plug 'mg979/vim-visual-multi'
Plug 'terryma/vim-multiple-cursors'
" 管理 fcitx 状态
Plug 'lilydjwg/fcitx.vim'

" 支持 editorconfig
Plug 'editorconfig/editorconfig-vim'
" 显示来自版本控制的修改状态
Plug 'mhinz/vim-signify'
" 集成 git 支持
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/vim-fugitive'
" 显示目录树
Plug 'scrooloose/nerdtree'
" 文件管理器
Plug 'mcchrish/nnn.vim'
" 侧栏显示文件结构大纲
Plug 'liuchengxu/vista.vim'
Plug 'majutsushi/tagbar'

" 书签标记跳转
Plug 'MattesGroeger/vim-bookmarks'
" 提权保存文件
Plug 'lambdalisue/suda.vim'
" 快速移动
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
" 模糊搜索
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" 代码格式化
Plug 'sbdchd/neoformat'
" 快捷注释文本
Plug 'scrooloose/nerdcommenter'
" 全面而且统一的语法高亮和缩进
Plug 'sheerun/vim-polyglot'
" 显示函数签名
Plug 'Shougo/echodoc'

" 为 python 提供补全和跳转
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" 自动排序 python import
Plug 'fisadev/vim-isort', { 'for': 'python' }


" 提供 golang 支持
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }


" 语法检查
Plug 'w0rp/ale'
" 自动补全, lsp-client
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install'}
" Plug 'Valloric/YouCompleteMe'

" 自动调用 ctags/gtags 为 c/c++ 源码生成tags数据，用于查看和跳转
Plug 'ludovicchabant/vim-gutentags', { 'for': ['c', 'cpp'] }
" 自动管理 gtags 对多个数据库的连接
Plug 'skywind3000/gutentags_plus'


call plug#end()

