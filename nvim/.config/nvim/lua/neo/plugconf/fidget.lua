local M = {}

function M.pre() end

function M.post()
  require("fidget").setup({
    text = {
      spinner = "dots",
    },
    timer = {
      fidget_decay = 100,
      task_decay = 100,
    },
  })
end

function M.keybind() end

return M
