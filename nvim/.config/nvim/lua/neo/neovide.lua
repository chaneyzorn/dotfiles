-- https://github.com/neovide/neovide

if vim.loop.os_uname().sysname == "Darwin" then
  vim.o.guifont = "JetBrains Mono,Symbols Nerd Font:h14"
else
  vim.o.guifont = "JetBrains Mono,Symbols Nerd Font:h10"
end

vim.g.neovide_fullscreen = false
vim.g.neovide_cursor_animation_length = 0.01
vim.g.neovide_cursor_trail_length = 0.1
vim.g.neovide_transparency = 1.0
vim.g.neovide_cursor_vfx_mode = "railgun"
