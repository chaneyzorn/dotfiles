" init.vim
" nvim 启动时的初始化文件
" see :help vimrc
"
" 使用大写 K 键 (shift + k) 跳转到鼠标所在单词的 vim 帮助页面

" 将本文件所在的目录设置为全局的 vim 配置家目录
" <sfile:p> 当前文件的全路径
" ':h' 去除最后一段后的路径
let g:neohome = fnameescape(fnamemodify(resolve(expand('<sfile>:p')), ':h'))

" 定义一个简化的方便引入 vim 源文件的命令
command! -nargs=1 IncScript execute 'source '.g:neohome.'/'.'<args>'

IncScript neoup/myconf.vim
IncScript neoup/preplugconf.vim
IncScript neoup/plugins.vim
IncScript neoup/postplugconf.vim
IncScript neoup/keymap.vim

