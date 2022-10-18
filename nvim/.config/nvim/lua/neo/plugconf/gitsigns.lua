local M = {}

function M.pre() end

function M.post()
  require("gitsigns").setup({
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "      <author_time:%Y-%m-%d>   <author>   <summary>",
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = "│",
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      change = {
        hl = "GitSignsChange",
        text = "│",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delete = {
        hl = "GitSignsDelete",
        text = "_",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = "",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        hl = "GitSignsChange",
        text = "│",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
    },
  })
end

function M.keybind()
  local U = require("neo.tools")

  U.nmap("]c", "&diff ? ']c' : '<Cmd>Gitsigns next_hunk<CR>'", { expr = true })
  U.nmap("[c", "&diff ? '[c' : '<Cmd>Gitsigns prev_hunk<CR>'", { expr = true })
  U.nmap("<Leader>gb", "<Cmd>Gitsigns blame_line<CR>", { silent = false })
  U.nmap("<Leader>gd", "<Cmd>Gitsigns preview_hunk<CR>")
  U.nmap("<Leader>gu", "<Cmd>Gitsigns reset_hunk<CR>")

  require("neo.keybind").leader_help({
    gb = "gitblame 当前行",
    gd = "展示当前行变动diff",
    gu = "将当前行回退到版本控制",
  })
end

return M
