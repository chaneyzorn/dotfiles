local M = {}

function M.pre() end

function M.post()
  require("diffview").setup({
    diff_binaries = false,
    use_icons = true,
    enhanced_diff_hl = false,
  })
end

return M
