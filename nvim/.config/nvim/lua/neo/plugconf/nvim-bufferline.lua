local M = {}

function M.pre() end

function M.post()
  require("bufferline").setup({
    options = {
      view = "multiwindow",
      numbers = "none",
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 18,
      max_prefix_length = 15,
      tab_size = 18,
      diagnostics = false,
      diagnostics_indicator = function(count, level, diagnostics_dict)
        return "(" .. count .. ")"
      end,
      custom_filter = function(buf_number)
        return true
      end,
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

return M
