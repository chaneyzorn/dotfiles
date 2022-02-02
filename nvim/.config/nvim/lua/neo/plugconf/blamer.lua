local M = {}

function M.pre()
  local vg = vim.g
  vg.blamer_enabled = 1
  vg.blamer_show_in_visual_modes = 0
  vg.blamer_show_in_insert_modes = 0

  vg.blamer_delay = 1000
  vg.blamer_prefix = "    "
  vg.blamer_template = "<committer-time>   <author>   <summary>"
  vg.blamer_date_format = "%Y-%m-%d"
end

function M.post() end

return M
