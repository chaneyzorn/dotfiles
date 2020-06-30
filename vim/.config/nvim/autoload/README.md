# autoload 文件夹应该被预置

由于 stow 使用符号链接来管理文件，这形成了以下这个复杂的间接链接：

```
~/.vim --> dotfiles/vim/.vim --> .config/nvim
```

plug.vim 在拉取文件时，会自动在 `~/.vim/autoload` 创建文件夹，可惜
这个尝试并不会成功，因为文件夹会被创建在 `~/.vim/autoload` 而不是
在 `~/.config/nvim/autoload` ，这会使得 nvim 并不能正常的加载 plug.vim

所以 autoload 文件夹应该被预置给 nvim，这样 nvim 和 vim 都将可以正常
访问到这个文件夹。
