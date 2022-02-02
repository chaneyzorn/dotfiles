local M = {}

function M.pre()
  local vg = vim.g

  -- 设置高亮单词延时
  vg.Illuminate_delay = 50
  -- 设置在部分 buffer 中不做高亮
  vg.Illuminate_ftblacklist = {
    "nerdtree",
    "NvimTree",
    "qf",
    "help",
    "list",
    "vista",
    "man",
  }
end

function M.post()
  vim.api.nvim_exec(
    [[
    augroup illuminate_augroup
      autocmd!
      autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
    augroup END
    ]],
    false
  )
end

return M
