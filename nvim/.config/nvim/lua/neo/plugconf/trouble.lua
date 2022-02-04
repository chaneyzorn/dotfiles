local M = {}

function M.pre() end

function M.post()
  require("trouble").setup({
    position = "bottom",
    height = 10,
    width = 50,
    icons = true,
    mode = "document_diagnostics",
    fold_open = "",
    fold_closed = "",
    group = true,
    padding = true,
    indent_lines = true,
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    auto_fold = false,
    auto_jump = { "lsp_definitions" },
    signs = {
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "﫠",
    },
    use_diagnostic_signs = false,
  })
end

function M.keybind()
  local U = require("neo.tools")

  U.nmap("<Leader>kk", "<Cmd>TroubleToggle<CR>")
  U.nmap("<Leader>kw", "<Cmd>Trouble workspace_diagnostics<CR>")
  U.nmap("<Leader>kd", "<Cmd>Trouble document_diagnostics<CR>")
  U.nmap("<Leader>kl", "<Cmd>Trouble loclist<CR>")
  U.nmap("<Leader>kq", "<Cmd>Trouble quickfix<CR>")
  U.nmap("<Leader>kr", "<Cmd>Trouble lsp_references<CR>")

  require("neo.keybind").leader_help({
    kk = "诊断列表",
    kw = "全局诊断列表",
    kd = "当前文档诊断列表",
    kl = "Trouble loclist",
    kq = "Trouble quickfix",
    kr = "Trouble lsp_references",
  })
end

return M
