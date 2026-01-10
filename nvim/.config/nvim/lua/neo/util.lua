local M = {}

function M.print_rtp()
  local count = 0
  for _, value in ipairs(vim.api.nvim_list_runtime_paths()) do
    print(value)
    count = count + 1
  end
  print("total: ", count)
end

function M.via_ssh()
  return vim.env.SSH_CONNECTION and vim.env.SSH_CONNECTION ~= ""
end

return M
