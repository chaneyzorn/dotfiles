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
      bt.formatting.black,
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
      bt.completion.spell,
    },
  })

  -- disable all diagnostics capacity at init
  nls.disable({ method = nls.methods.DIAGNOSTICS })
end

function M.keybind() end

return M
