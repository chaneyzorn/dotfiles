-- https://github.com/neovide/neovide

if not vim.g.neovide then
  return nil
end

if vim.loop.os_uname().sysname == "Darwin" then
  vim.o.guifont = "JetBrains Mono:h14"
else
  vim.o.guifont = "JetBrains Mono:h10"
end

vim.g.neovide_input_macos_option_key_is_meta = "both"
vim.g.neovide_fullscreen = false
vim.g.neovide_transparency = 1.0
vim.g.neovide_window_blurred = true
vim.g.neovide_show_border = true
vim.g.neovide_floating_shadow = false

vim.g.neovide_cursor_animation_length = 0.01
vim.g.neovide_cursor_trail_length = 0.1
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_position_animation_length = 0

vim.g.neovide_hide_mouse_when_typing = true

-- IME input config
vim.g.neovide_user_ime_enabled = false

local function set_ime(args)
  if args.event:match("Enter$") then
    vim.g.neovide_input_ime = vim.g.neovide_user_ime_enabled
  else
    vim.g.neovide_input_ime = false
  end
end

local ime_input = vim.api.nvim_create_augroup("NeovideImeInput", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
  group = ime_input,
  pattern = "*",
  callback = set_ime,
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
  group = ime_input,
  pattern = "[/\\?]",
  callback = set_ime,
})

vim.keymap.set("n", "<leader>ve", function()
  vim.g.neovide_user_ime_enabled = not vim.g.neovide_user_ime_enabled
  if vim.g.neovide_user_ime_enabled then
    vim.notify("User IME enabled")
  else
    vim.notify("User IME disabled")
  end
end, { desc = "Toggle neovide user IME" })

vim.keymap.set("n", "<leader>vf", function()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end, { desc = "Toggle neovide fullscreen" })
