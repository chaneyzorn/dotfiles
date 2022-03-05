local M = {}

function M.pre() end

function M.post()
  require("fidget").setup({
    text = {
      spinner = "dots",
    },
  })
end

function M.keybind() end

return M
