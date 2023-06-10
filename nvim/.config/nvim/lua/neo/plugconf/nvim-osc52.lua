local M = {}

function M.pre() end

function M.post() end

function M.keybind()
  vim.keymap.set("n", "<leader>yr", function()
    require("osc52").copy_operator()
  end, { expr = true })

  vim.keymap.set("n", "<leader>yl", "<leader>yr_", { remap = true })

  vim.keymap.set("v", "<leader>yr", function()
    require("osc52").copy_visual()
  end)

  require("neo.keybind").leader_help({
    yr = "osc52 yank",
    yl = "osc52 yank one line",
  })
end

return M
