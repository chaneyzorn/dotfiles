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

      -- javascript
      nls.builtins.formatting.prettier,
      nls.builtins.diagnostics.eslint,

      -- markdown
      nls.builtins.diagnostics.markdownlint,

      -- other
      nls.builtins.completion.spell,
    },
  })
end

function M.keybind() end

return M
