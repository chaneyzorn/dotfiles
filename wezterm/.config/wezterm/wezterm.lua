local wezterm = require("wezterm")

local hostname = wezterm.hostname()

local M = {
  font = wezterm.font_with_fallback({ "JetBrains Mono", "Noto Sans CJK SC", "Symbols Nerd Font Mono" }),
  font_size = 12.0,
  adjust_window_size_when_changing_font_size = false,
  color_scheme = "Catppuccin Mocha",
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  scrollback_lines = 100000,
  enable_scroll_bar = false,
  exit_behavior = "Close",

  -- https://github.com/wez/wezterm/issues/1928
  -- custom_block_glyphs = false,
  selection_word_boundary = " \t\n{}[]()\"'`│,;:!@#$&-=+\\",

  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,

  use_ime = false,
}

local function ends_with(str, ending)
  return ending == "" or str:sub(-#ending) == ending
end

-- x86_64-apple-darwin
-- aarch64-apple-darwin
if ends_with(wezterm.target_triple, "apple-darwin") then
  M.font_size = 14.0
  M.window_background_opacity = 0.8
  M.macos_window_background_blur = 20
  M.window_decorations = "TITLE | RESIZE | MACOS_FORCE_ENABLE_SHADOW"
end

if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
  M.window_background_opacity = 0.9
  M.window_decorations = "RESIZE"
  M.window_padding = { left = 1, right = 1, top = 0, bottom = 0 }
end

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  M.window_background_opacity = 0.8
  M.win32_system_backdrop = "Acrylic"
  M.default_prog = { "I:/msys64/msys2_shell.cmd", "-defterm", "-here", "-no-start", "-ucrt64", "-shell", "zsh" }
  M.default_cwd = "I:/msys64/home/Chaney/"
end

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
  return "$" .. tab.active_pane.foreground_process_name
end)

return M
