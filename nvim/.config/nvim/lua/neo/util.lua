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

function M.esc()
  local keys = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(keys, "m", false)
end

--- Create a new tmux window and switch to the current working directory
function M.tmux_new_window_with_cwd()
  if not vim.env.TMUX then
    vim.notify("Not in a tmux session, cannot execute tmux commands", vim.log.levels.ERROR)
    return
  end

  local current_cwd = vim.fn.getcwd()
  if current_cwd == "" then
    vim.notify("Failed to get current working directory", vim.log.levels.ERROR)
    return
  end

  local tmux_win_cmd = {
    "tmux",
    "new-window",
    "-c",
    current_cwd,
    "-n",
    "nvim-term: " .. vim.fs.basename(current_cwd),
  }

  vim.system(tmux_win_cmd, {
    cwd = current_cwd,
  }, function(result)
    vim.schedule(function()
      if result.code ~= 0 then
        local error_msg = result.stderr and result.stderr ~= "" and result.stderr or "Unknown error"
        vim.notify(
          string.format("Tmux command execution failed: %s (code: %d)", error_msg, result.code),
          vim.log.levels.ERROR
        )
      else
        vim.notify(string.format("New tmux window created with CWD: %s", current_cwd), vim.log.levels.INFO)
      end
    end)
  end)
end

return M
