local wezterm = require("wezterm")

local hostname = wezterm.hostname()

local M = {
  font = wezterm.font_with_fallback({ "JetBrains Mono", "Symbols Nerd Font" }),
  font_size = 10.0,
  color_scheme = "chaney_dark",
  color_schemes = {
    chaney_dark = {
      foreground = "#839496",
      background = "#002b36",
      cursor_bg = "#eee8d5",
      cursor_fg = "black",
      cursor_border = "#52ad70",
      selection_fg = "black",
      selection_bg = "#fffacd",
      scrollbar_thumb = "#222222",
      split = "black",
      ansi = { "#073642", "#dc322f", "#EBCB8B", "#AAB288", "#9DA786", "#d33682", "#16D5B6", "#eee8d5" },
      brights = { "#22444D", "#cb4b16", "#586e75", "#657b83", "#839496", "#6c71c4", "#93a1a1", "#fdf6e3" },
    },
  },
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  colors = {
    tab_bar = {
      background = "#213549",
      active_tab = {
        bg_color = "#002b36",
        fg_color = "#16d5b6",
        intensity = "Bold",
        underline = "None",
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = "#213549",
        fg_color = "#808080",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },
      inactive_tab_hover = {
        bg_color = "#405260",
        fg_color = "#16d5b6",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },
      new_tab = {
        bg_color = "#123848",
        fg_color = "#16d5b6",
        intensity = "Bold",
      },
      new_tab_hover = {
        bg_color = "#3b3052",
        fg_color = "#909090",
        intensity = "Bold",
        underline = "Single",
      },
    },
  },
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  window_background_opacity = 1.0,
  scrollback_lines = 100000,
  enable_scroll_bar = false,
  exit_behavior = "Close",
}

if wezterm.target_triple == "x86_64-apple-darwin" then
  M.font_size = 14.0
end

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
  return "$" .. tab.active_pane.foreground_process_name .. "@" .. hostname
end)

return M
