local M = {}

function M.pre()
  local vg = vim.g

  vg.coc_start_at_startup = 0
  vg.coc_global_extensions = {
    "coc-css",
    "coc-dictionary",
    "coc-emoji",
    "coc-eslint",
    "coc-go",
    "coc-jedi",
    "coc-json",
    "coc-lists",
    "coc-marketplace",
    "coc-prettier",
    "coc-rust-analyzer",
    "coc-snippets",
    "coc-syntax",
    "coc-tsserver",
    "coc-vimlsp",
    "coc-word",
    "coc-yaml",
  }
end

function M.post() end

function M.keybind()
  local U = require("neo.tools")

  U.nmap("<C-j>", "<Plug>(coc-definition)")
  U.nmap("<Leader>gg", "<Plug>(coc-definition)")
  U.nmap("<Leader>gn", "<Plug>(coc-declaration)")
  U.nmap("<Leader>gt", "<Plug>(coc-type-definition)")
  U.nmap("<Leader>gi", "<Plug>(coc-implementation)")
  U.nmap("<Leader>gr", "<Plug>(coc-references)")

  U.nmap("<Leader>cp", "<Cmd>CocCommand<CR>")
  U.nmap("<Leader>cx", "<Cmd>CocStart<CR>")
  U.nmap("<Leader>cv", "<Cmd>CocStart<CR>:ALEEnable<CR>:call spelunker#toggle()<CR>")

  require("neo.keybind").leader_help({
    gg = "跳转到定义",
    gn = "跳转到申明",
    gt = "跳转到类型",
    gi = "跳转到实现",
    gr = "展示所有引用",
    cp = "coc下拉菜单",
    cx = "开启 coc lsp",
    cv = "开启代码智能辅助",
  })
end

return M
