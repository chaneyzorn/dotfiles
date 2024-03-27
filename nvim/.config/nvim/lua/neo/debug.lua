local M = {}

function M.print_rtp()
  local count = 0
  for _, value in ipairs(vim.api.nvim_list_runtime_paths()) do
    print(value)
    count = count + 1
  end
  print("total: ", count)
end

return M

-- plugins considered
-- "JoosepAlviste/nvim-ts-context-commentstring",
-- "cbochs/grapple.nvim"
-- "flash.nvim"
