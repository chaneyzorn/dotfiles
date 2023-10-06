return {
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      text = {
        spinner = "dots",
      },
      timer = {
        fidget_decay = 100,
        task_decay = 100,
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local nls = require("null-ls")
      local bt = nls.builtins
      nls.setup({
        sources = {
          -- c/c++
          bt.formatting.clang_format,
          bt.diagnostics.cppcheck,

          -- python
          bt.formatting.black,
          bt.diagnostics.ruff,

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
    end,
  },
  {
    "neovim/nvim-lspconfig",
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
        gg = "Go to definitions",
        gD = "Go to declaration",
        gi = "Go to implementation",
        gt = "Go to type definitions",
        gr = "Go to references",
        ca = "LSP Code Action",
        cf = "LSP Code format",
        rn = "LSP rename",
        cv = "Coding Vision",
        cx = "Coding XVision",
        zg = "Refresh CSpell",
        ds = "diagnostic.open_float",
        dl = "diagnostic.setloclist",
      })
    end,

    config = function()
      local signs = { Error = "󰅚", Warn = "", Info = "", Hint = "󰌶" }
      local symbols = { Error = "", Warn = "", Info = "", Hint = "󰛨" }

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
        desc = "LSP actions",
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }

          local U = require("neo.tools")

          U.nmap("<C-k>", function()
            vim.lsp.buf.signature_help()
          end, opts)
          U.nmap("<C-K>", function()
            vim.lsp.buf.hover()
          end, opts)

          U.nmap("<Leader>gD", function()
            vim.lsp.buf.declaration()
          end, opts)
          U.nmap("<Leader>gi", function()
            vim.lsp.buf.implementation()
          end, opts)

          -- use trouble.nvim as lsp list
          U.nmap("<C-j>", "<Cmd>TroubleToggle lsp_definitions<CR>", opts)
          U.nmap("<Leader>gg", "<Cmd>TroubleToggle lsp_definitions<CR>", opts)
          U.nmap("<Leader>gt", "<Cmd>TroubleToggle lsp_type_definitions<CR>", opts)
          U.nmap("<Leader>gr", "<Cmd>TroubleToggle lsp_references<CR>", opts)

          U.nmap("<Leader>ca", function()
            vim.lsp.buf.code_action()
          end, opts)
          U.vmap("<Leader>ca", function()
            vim.lsp.buf.code_action()
          end, opts)
          U.nmap("<Leader>cf", function()
            vim.lsp.buf.format()
          end, opts)
          U.nmap("<Leader>rn", function()
            vim.lsp.buf.rename()
          end, opts)
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
          "lua_ls",
          "rust_analyzer",
          "tsserver",
          "pyright",
          "gopls",
          "clangd",
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
