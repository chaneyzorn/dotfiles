return {
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
      require("fidget").setup({
        notification = {
          window = {
            normal_hl = "DiagnosticHint",
          },
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    init = function()
      vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
    end,
    keys = {
      {
        "<leader>ck",
        function()
          require("conform").format({}, function(err, did_edit)
            if err then
              require("fidget").notify("conform: " .. err, vim.log.levels.ERROR)
            elseif did_edit then
              require("fidget").notify("conform success: content changed")
            else
              require("fidget").notify("conform success: no changes")
            end
          end)
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        go = { "goimports", "gofmt" },
        lua = { "stylua" },
        python = { "ruff_format" },
        javascript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        sh = { "shfmt" },
        zsh = { "shfmt" },
        yaml = { "yamlfmt" },
        toml = { "taplo" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<leader>dd",
        function()
          vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end,
        desc = "loclist diagnostic",
      },
      {
        "<leader>dl",
        function()
          vim.diagnostic.setloclist()
        end,
        desc = "loclist diagnostic",
      },
      {
        "<leader>df",
        function()
          vim.diagnostic.open_float()
        end,
        desc = "diagnostic float hover",
      },
      {
        "<leader>zg",
        function()
          require("lint").try_lint("cspell")
          require("fidget").notify("CSpell Refreshed")
        end,
        desc = "refresh cspell",
      },
    },
    config = function()
      vim.diagnostic.config({
        float = {
          border = "rounded",
          source = true,
          prefix = function(diagnostic, _, _)
            local symbols = { "", "", "", "󰛨 " }
            local symbol = symbols[diagnostic.severity] or "?"
            return symbol
          end,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "󰌶",
          },
        },
        virtual_text = {
          source = true,
          prefix = "",
          format = function(diagnostic)
            local symbols = { "", "", "", "󰛨 " }
            local symbol = symbols[diagnostic.severity] or "?"
            return string.format("%s %s", diagnostic.message, symbol)
          end,
        },
      })

      local lint = require("lint")
      lint.linters_by_ft = {
        markdown = { "markdownlint-cli2", "vale" },
        c = { "cppcheck" },
        cpp = { "cppcheck" },
        css = { "stylelint" },
        yaml = { "yamllint" },
      }

      -- config cspell
      local function get_cspell_conf()
        local cspell_conf = vim.fs.find(function(name)
          return vim.list_contains({
            ".cspell.json",
            "cspell.json",
            ".cSpell.json",
            "cSpell.json",
            "cspell.config.js",
            "cspell.config.cjs",
            "cspell.config.json",
            "cspell.config.yaml",
            "cspell.config.yml",
            "cspell.yaml",
            "cspell.yml",
          }, name)
        end, { limit = math.huge, type = "file", path = "./" })
        if #cspell_conf > 0 then
          return cspell_conf[1]
        end
        return vim.fs.abspath("~/.config/nvim/spell/cspell.json")
      end
      lint.linters.cspell.args = {
        "lint",
        "--no-color",
        "--no-progress",
        "--no-summary",
        "--config",
        get_cspell_conf(),
        function()
          return "stdin://" .. vim.api.nvim_buf_get_name(0)
        end,
      }
      lint.linters.cspell = require("lint.util").wrap(lint.linters.cspell, function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity.HINT
        return diagnostic
      end)

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = vim.api.nvim_create_augroup("BufWriteLint", { clear = true }),
        callback = function()
          if vim.g.nvim_lint_enabled then
            require("lint").try_lint()
            require("lint").try_lint("cspell")
          end
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<leader>cv",
        function()
          vim.o.spell = true
          vim.g.nvim_lint_enabled = true
          require("lint").try_lint()
          require("lint").try_lint("cspell")

          -- TODO: LSP start
          -- vim.cmd("LspStart")
          vim.lsp.enable({
            "biome",
            "lua_ls",
            "pyright",
            "ruff",
            "gopls",
            "golangci_lint_ls",
            "ts_ls",
            "ccls",
            "clangd",
            "typos-lsp",
          })
          require("fidget").notify("IntelliSense Enabled")
        end,
        desc = "Enable IntelliSense",
      },
      {
        "<leader>cx",
        function()
          -- TODO: LSP stop
          -- vim.cmd("LspStop")

          vim.o.spell = false
          vim.diagnostic.reset()
          vim.g.nvim_lint_enabled = false

          require("fidget").notify("IntelliSense Disabled")
        end,
        desc = "Disabled IntelliSense",
      },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP Attach Hook",
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = ev.buf
            vim.keymap.set(mode, l, r, opts)
          end

          local function nmap(l, r, opts)
            map("n", l, r, opts)
          end

          local function vmap(l, r, opts)
            map("v", l, r, opts)
          end

          -- See `:help vim.lsp.*` for documentation on any of the below functions
          nmap("<Leader>gs", vim.lsp.buf.signature_help, { desc = "Lsp signature help" })
          nmap("<Leader>gk", vim.lsp.buf.hover, { desc = "Lsp hover doc" })
          nmap("<Leader>gd", vim.lsp.buf.declaration, { desc = "Lsp to declaration" })

          -- use trouble.nvim as lsp list
          nmap("<Leader>gi", "<Cmd>Trouble lsp_implementations toggle<CR>", { desc = "Trouble lsp imp" })
          nmap("<Leader>gg", "<Cmd>Trouble lsp_definitions toggle<CR>", { desc = "Trouble lsp def" })
          nmap("<Leader>gt", "<Cmd>Trouble lsp_type_definitions toggle<CR>", { desc = "Trouble lsp type" })
          nmap("<Leader>gr", "<Cmd>Trouble lsp_references toggle<CR>", { desc = "Trouble lsp ref" })

          nmap("<Leader>ca", vim.lsp.buf.code_action, { desc = "Lsp code action" })
          vmap("<Leader>ca", vim.lsp.buf.code_action, { desc = "Lsp code action" })
          nmap("<Leader>cf", vim.lsp.buf.format, { desc = "Lsp code format" })
          nmap("<Leader>cr", vim.lsp.buf.rename, { desc = "Lsp rename" })
        end,
      })
    end,
  },
}
