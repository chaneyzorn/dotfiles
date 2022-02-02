local M = {}

function M.pre()
  local vg = vim.g

  vg.indent_blankline_char = "┊"
  -- vg.indent_blankline_char_list = {'|', '¦', '┆', '┊'}
  -- 以下类型的 buffer 里不显示缩进线
  vg.indent_blankline_filetype_exclude = { "help", "terminal", "list", "nofile", "make", "go" }
  vg.indent_blankline_buftype_exclude = { "help", "terminal", "list", "nofile" }
  vg.indent_blankline_show_current_context = true
  vg.indent_blankline_context_patterns = {
    "class",
    "function",
    "method",
    "block",
    "list_literal",
    "selector",
    "^if",
    "^table",
    "if_statement",
    "while",
    "for",
  }
end

function M.post() end

return M
