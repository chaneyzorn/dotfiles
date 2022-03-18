local M = {}

function M.pre() end

function M.post()
  require("bufferline").setup({
    options = {
      numbers = "none",
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 18,
      max_prefix_length = 15,
      tab_size = 18,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = false,
      sort_by = "directory",
    },
  })
end

function M.keybind()
  local U = require("neo.tools")

  U.nmap("<Leader>bb", "<Cmd>BufferLineCycleNext<CR>")
  U.nmap("<Leader>bh", "<Cmd>BufferLineCyclePrev<CR>")
  U.nmap("<Leader>bp", "<Cmd>BufferLinePick<CR>")

  require("neo.keybind").leader_help({
    bb = "上一个 buffer tag",
    bh = "下一个 buffer tag",
    bp = "选择一个 buffer tag",
  })
end

return M
