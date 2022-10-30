local M = {}

function M.pre() end

function M.post()
  local nls = require("null-ls")
  local bt = nls.builtins
  nls.setup({
    sources = {
      -- c/c++
      bt.formatting.clang_format,
      bt.diagnostics.cppcheck,

      -- python
      bt.formatting.black.with({
        command = vim.fn.expand("~/.local/bin/black"),
      }),
      bt.diagnostics.pylint,

      -- golang
      bt.formatting.gofmt,
      bt.formatting.goimports,
      bt.diagnostics.golangci_lint,

      -- lua
      bt.formatting.stylua,
      bt.diagnostics.luacheck,

      -- javascript / css / json / yaml
      bt.formatting.prettier,
      bt.diagnostics.eslint,
      bt.diagnostics.stylelint,
      bt.diagnostics.jsonlint,
      bt.diagnostics.yamllint,

      -- shell
      bt.formatting.shfmt.with({
        extra_filetypes = { "zsh" },
      }),
      bt.diagnostics.shellcheck,

      -- markdown
      bt.diagnostics.markdownlint,

      -- other
      bt.diagnostics.cspell.with({
        extra_args = { "--config", vim.fn.expand("~/.config/nvim/neo-cspell.yaml") },
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = vim.diagnostic.severity.HINT
        end,
      }),
    },
    should_attach = function(bufnr)
      local file_type = vim.api.nvim_buf_get_option(bufnr, "filetype")
      if vim.tbl_contains({ "NvimTree" }, file_type) then
        return false
      end

      local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
      if buftype ~= "" then
        return false
      end

      return true
    end,
  })

  -- disable all diagnostics capacity at init
  nls.disable({ method = nls.methods.DIAGNOSTICS })
end

function M.keybind() end

return M
