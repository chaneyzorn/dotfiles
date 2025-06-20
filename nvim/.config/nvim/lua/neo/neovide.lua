-- https://github.com/neovide/neovide

if not vim.g.neovide then
  return nil
end

vim.o.mouse = "a"
vim.o.linespace = 6
vim.opt.guicursor = {
  "n-v-c-sm:block",
  "i-ci-ve:ver25",
  "r-cr-o:hor20",
  "n:blinkwait1000-blinkoff500-blinkon800-Cursor/lCursor",
  "i:blinkwait300-blinkoff500-blinkon500-Cursor/lCursor",
  "c:blinkwait250-blinkoff350-blinkon350-Cursor/lCursor",
  "sm:block-blinkwait175-blinkoff150-blinkon175",
}

-- see https://github.com/neovide/neovide/issues/1196
if vim.uv.os_uname().sysname == "Darwin" then
  vim.o.guifont = "JetBrainsMono Nerd Font:h13"
else
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
end

vim.g.neovide_input_macos_option_key_is_meta = "both"
vim.g.neovide_fullscreen = false
vim.g.neovide_opacity = 0.9
vim.g.neovide_normal_opacity = 0.9
vim.g.neovide_window_blurred = true
vim.g.neovide_show_border = true
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_corner_radius = 0.3

vim.g.neovide_cursor_animation_length = 0.01
vim.g.neovide_cursor_trail_length = 0.1
vim.g.neovide_cursor_vfx_mode = { "railgun", "wireframe" }
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
