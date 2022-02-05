local M = {}

function M.pre() end

function M.post()
  local nls = require("null-ls")
  nls.setup({
    sources = {
      -- c/c++
      nls.builtins.formatting.clang_format,
      nls.builtins.diagnostics.cppcheck,

      -- python
      nls.builtins.formatting.black,
      nls.builtins.diagnostics.pylint,
      nls.builtins.diagnostics.flake8,

      -- golang
      nls.builtins.formatting.gofmt,
      nls.builtins.formatting.goimports,
      nls.builtins.diagnostics.golangci_lint,

      -- lua
      nls.builtins.formatting.stylua,
      nls.builtins.diagnostics.luacheck,

      -- javascript / css / json / yaml
      nls.builtins.formatting.prettier,
      nls.builtins.diagnostics.eslint,
      nls.builtins.diagnostics.stylelint,
      nls.builtins.diagnostics.jsonlint,
      nls.builtins.diagnostics.yamllint,

      -- shell
      nls.builtins.diagnostics.shellcheck,

      -- markdown
      nls.builtins.diagnostics.markdownlint,

      -- other
      nls.builtins.diagnostics.cspell.with({
        extra_args = { "--config", vim.fn.expand("~/.config/nvim/neo-cspell.yaml") },
      }),
      nls.builtins.completion.spell,
    },
  })

  -- disable all diagnostics capacity at init
  nls.disable({ method = nls.methods.DIAGNOSTICS })
end

function M.keybind() end

return M
