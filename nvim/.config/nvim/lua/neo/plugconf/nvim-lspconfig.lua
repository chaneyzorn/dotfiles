local M = {}

function M.pre() end

function M.post()
  local signs = { Error = "", Warn = "", Info = "", Hint = "" }
  local symbols = { Error = "", Warn = "", Info = "", Hint = "ﯦ" }

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

  -- lsp server setup: see mason.lua
end

function M.keybind()
  local U = require("neo.tools")

  local nkset = function(key, func)
    vim.keymap.set("n", key, func)
  end

  nkset("[e", vim.diagnostic.goto_prev)
  nkset("]e", vim.diagnostic.goto_next)

  nkset("<C-k>", vim.lsp.buf.signature_help)
  nkset("<C-K>", vim.lsp.buf.hover)

  nkset("<Leader>gD", vim.lsp.buf.declaration)
  nkset("<Leader>gi", vim.lsp.buf.implementation)

  -- use trouble.nvim as lsp list
  U.nmap("<C-j>", "<Cmd>TroubleToggle lsp_definitions<CR>")
  U.nmap("<Leader>gg", "<Cmd>TroubleToggle lsp_definitions<CR>")
  U.nmap("<Leader>gt", "<Cmd>TroubleToggle lsp_type_definitions<CR>")
  U.nmap("<Leader>gr", "<Cmd>TroubleToggle lsp_references<CR>")

  nkset("<Leader>ca", vim.lsp.buf.code_action)
  nkset("<Leader>cf", vim.lsp.buf.format or vim.lsp.buf.formatting)
  nkset("<Leader>rn", vim.lsp.buf.rename)
  nkset("<Leader>cv", U.EnableCodingVision)
  nkset("<Leader>cx", U.DisableCodingVision)
  nkset("<Leader>zg", U.RefreshCSpell)

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
