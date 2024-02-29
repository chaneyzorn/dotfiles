return {
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
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
        "<leader>ci",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
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
        python = { { "ruff_format", "black" } },
        javascript = { { "prettier" } },
        sh = { "shfmt" },
        yaml = { "yamlfmt" },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "davidmh/cspell.nvim",
    },
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    init = function()
      local U = require("neo.tools")

      U.nmap("[e", function()
        vim.diagnostic.goto_prev()
      end)
      U.nmap("]e", function()
        vim.diagnostic.goto_next()
      end)
      U.nmap("<Leader>ds", function()
        vim.diagnostic.open_float()
      end)
      U.nmap("<Leader>dl", function()
        vim.diagnostic.setloclist()
      end)

      U.nmap("<Leader>cv", U.EnableCodingVision)
      U.nmap("<Leader>cx", U.DisableCodingVision)
      U.nmap("<Leader>zg", U.RefreshCSpell)

      require("neo.keybind").leader_help({
        cv = "Coding Vision",
        cx = "Coding XVision",
        zg = "Refresh CSpell",
        ds = "diagnostic.open_float",
        dl = "diagnostic.setloclist",
      })
    end,
    config = function()
      local nls = require("null-ls")
      local bt = nls.builtins

      local cspell = require("cspell")
      local cspell_config = {
        find_json = function()
          return vim.fn.expand("~/.config/nvim/spell/cspell.json")
        end,
        on_add_to_dictionary = function(payload)
          os.execute(string.format("sort -u %s -o %s", payload.dictionary_path, payload.dictionary_path))
        end,
      }

      nls.setup({
        sources = {
          -- c/c++
          bt.formatting.clang_format,
          bt.diagnostics.cppcheck,

          -- golang
          bt.formatting.gofmt,
          bt.formatting.goimports,
          bt.diagnostics.golangci_lint,

          -- lua
          bt.formatting.stylua,
          bt.diagnostics.selene,

          -- javascript / css / json / yaml
          bt.formatting.prettier.with({
            disabled_filetypes = { "yaml" },
          }),
          bt.formatting.yamlfmt,
          bt.diagnostics.stylelint,
          bt.diagnostics.yamllint,

          -- shell
          bt.formatting.shfmt.with({
            extra_filetypes = { "zsh" },
          }),

          -- markdown
          bt.diagnostics.markdownlint,

          -- other
          cspell.diagnostics.with({
            config = cspell_config,
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity.HINT
            end,
          }),
          cspell.code_actions.with({ config = cspell_config }),
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
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local signs = { Error = "󰅚", Warn = "", Info = "", Hint = "󰌶" }
      local symbols = { Error = "", Warn = "", Info = "", Hint = "󰛨" }

      vim.diagnostic.config({
        virtual_text = {
          prefix = "",
          format = function(diagnostic)
            if diagnostic.severity == vim.diagnostic.severity.ERROR then
              return string.format("%s: %s %s", diagnostic.source or "", diagnostic.message, symbols.Error)
            elseif diagnostic.severity == vim.diagnostic.severity.WARN then
              return string.format("%s: %s %s", diagnostic.source or "", diagnostic.message, symbols.Warn)
            elseif diagnostic.severity == vim.diagnostic.severity.INFO then
              return string.format("%s: %s %s", diagnostic.source or "", diagnostic.message, symbols.Info)
            elseif diagnostic.severity == vim.diagnostic.severity.HINT then
              return string.format("%s: %s %s", diagnostic.source or "", diagnostic.message, symbols.Hint)
            end

            return diagnostic.message
          end,
        },
      })

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, linehl = "", numhl = "" })
      end

      -- lsp server setup: see https://github.com/VonHeikemen/lsp-zero.nvim
      local lspconfig = require("lspconfig")
      local lsp_defaults = lspconfig.util.default_config
      local folding_caps = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      }
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities(),
        folding_caps
      )

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
          nmap("<C-k>", vim.lsp.buf.signature_help, { desc = "Lsp signature help" })
          nmap("<C-K>", vim.lsp.buf.hover, { desc = "Lsp hover doc" })
          nmap("<Leader>gd", vim.lsp.buf.declaration, { desc = "Lsp to declaration" })

          -- use trouble.nvim as lsp list
          nmap("<C-j>", "<Cmd>TroubleToggle lsp_definitions<CR>", { desc = "Trouble lsp def" })
          nmap("<Leader>gi", "<Cmd>TroubleToggle lsp_implementations<CR>", { desc = "Trouble lsp imp" })
          nmap("<Leader>gg", "<Cmd>TroubleToggle lsp_definitions<CR>", { desc = "Trouble lsp def" })
          nmap("<Leader>gt", "<Cmd>TroubleToggle lsp_type_definitions<CR>", { desc = "Trouble lsp type" })
          nmap("<Leader>gr", "<Cmd>TroubleToggle lsp_references<CR>", { desc = "Trouble ls ref" })

          nmap("<Leader>ca", vim.lsp.buf.code_action, { desc = "Lsp code action" })
          vmap("<Leader>ca", vim.lsp.buf.code_action, { desc = "Lsp code action" })
          nmap("<Leader>cf", vim.lsp.buf.format, { desc = "Lsp code format" })
          nmap("<Leader>rn", vim.lsp.buf.rename, { desc = "Lsp rename" })
        end,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = "Mason",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      require("mason").setup()

      local enhance_server_opts = {
        ["lua_ls"] = function(opts)
          local runtime_path = vim.split(package.path, ";")
          table.insert(runtime_path, "lua/?.lua")
          table.insert(runtime_path, "lua/?/init.lua")

          opts.settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
                path = runtime_path,
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
              },
              telemetry = {
                enable = false,
              },
            },
          }
        end,
      }

      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "clangd",
          "eslint",
          "gopls",
          "jsonls",
          "lua_ls",
          "pyright",
          "ruff_lsp",
          "rust_analyzer",
          "tsserver",
        },
        handlers = {
          function(server_name)
            local opts = {
              autostart = false,
              on_attach = function(client)
                client.server_capabilities.document_formatting = false
                client.server_capabilities.document_range_formatting = false
              end,
            }

            if enhance_server_opts[server_name] then
              enhance_server_opts[server_name](opts)
            end

            require("lspconfig")[server_name].setup(opts)
          end,
        },
      })
    end,
  },
}
