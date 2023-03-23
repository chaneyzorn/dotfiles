local M = {}

function M.pre() end

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

local lspconfig = function(server_name)
  -- Add additional capabilities supported by nvim-cmp
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- kevinhwang91/nvim-ufo
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  local opts = {
    -- apply to all lsp servers
    autostart = false,
    capabilities = capabilities,
    on_attach = function(client)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
    end,
  }

  if enhance_server_opts[server_name] then
    enhance_server_opts[server_name](opts)
  end

  require("lspconfig")[server_name].setup(opts)
end

function M.post()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "tsserver",
      "pylsp",
      "gopls",
      "clangd",
    },
  })

  require("mason-lspconfig").setup_handlers({ lspconfig })
end

function M.keybind() end

return M
