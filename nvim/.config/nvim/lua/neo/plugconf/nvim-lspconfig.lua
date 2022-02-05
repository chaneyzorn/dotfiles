local M = {}

function M.pre() end

function M.post()
  local signs = { Error = "", Warn = "", Info = "", Hint = "" }
  local symbols = { Error = " ", Warn = " ", Info = " ", Hint = " " }

  vim.diagnostic.config({
    virtual_text = {
      prefix = "",
      format = function(diagnostic)
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
          return string.format("%s: %s %s", diagnostic.source, diagnostic.message, symbols.Error)
        elseif diagnostic.severity == vim.diagnostic.severity.WARN then
          return string.format("%s: %s %s", diagnostic.source, diagnostic.message, symbols.Warn)
        elseif diagnostic.severity == vim.diagnostic.severity.INFO then
          return string.format("%s: %s %s", diagnostic.source, diagnostic.message, symbols.Info)
        elseif diagnostic.severity == vim.diagnostic.severity.HINT then
          return string.format("%s: %s %s", diagnostic.source, diagnostic.message, symbols.Hint)
        end

        return diagnostic.message
      end,
    },
  })

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, linehl = "", numhl = "" })
  end

  -- lsp server setup: see nvim-lsp-install.lua
end

function M.keybind()
  local U = require("neo.tools")

  U.nmap("[e", "<Cmd>lua vim.diagnostic.goto_prev()<CR>")
  U.nmap("]e", "<Cmd>lua vim.diagnostic.goto_next()<CR>")

  U.nmap("<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>")
  U.nmap("<C-K>", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  U.nmap("<C-j>", "<Cmd>lua vim.lsp.buf.definition()<CR>")

  U.nmap("<Leader>gg", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  U.nmap("<Leader>gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  U.nmap("<Leader>gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
  U.nmap("<Leader>gt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>")
  U.nmap("<Leader>gr", "<Cmd>lua vim.lsp.buf.references()<CR>")

  U.nmap("<Leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
  U.nmap("<Leader>cf", "<Cmd>lua vim.lsp.buf.formatting()<CR>")
  U.nmap("<Leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>")
  U.nmap("<Leader>cv", "<Cmd>lua require('neo.tools').EnableCodingVision()<CR>")
  U.nmap("<Leader>cx", "<Cmd>lua require('neo.tools').DisableCodingVision()<CR>")
  U.nmap("<Leader>zg", "<Cmd>lua require('neo.tools').RefreshCSpell()<CR>")

  require("neo.keybind").leader_help({
    gg = "跳转到定义",
    gD = "跳转到申明",
    gi = "跳转到实现",
    gt = "跳转到类型",
    gr = "跳转到引用",

    ca = "Code Action",
    cf = "格式化代码",
    rn = "重命名符号",
    cv = "Coding Vision",
    cx = "Coding XVision",
    zg = "Refresh CSpell",
  })
end

return M
