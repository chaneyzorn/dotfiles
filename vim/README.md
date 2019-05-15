# 使用 GNU stow 管理的 vim 配置文件

同时支持 vim 和 nvim.

主配置文件都写在 nvim 的标准启动文件 `init.vim` 中，然后由 `vimrc` source 源文件引入。

在 stow 管理的 vim 文件夹下，创建一个相对路径的符号链接，从 `.vim` 指向 `./.config/nvim` :

```
ln -rs ./.config/nvim .vim
```

然后在执行 `stow -S vim` 之后，nvim 配置和 `.vim` 会保持相对位置的同时，双双放置到正确的位置。

注意，位于家目录和位于 stow 管理的 vim 文件夹下， `.vim` 与 `nvim` 的相对位置是一样的，所以 stow 的管理才简单有效。

