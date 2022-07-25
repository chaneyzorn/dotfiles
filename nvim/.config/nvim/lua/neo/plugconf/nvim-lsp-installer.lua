local M = {}

function M.pre() end

function M.post()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- kevinhwang91/nvim-ufo
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  -- Add additional capabilities supported by nvim-cmp
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  local enhance_server_opts = {
    ["sumneko_lua"] = function(opts)
      local runtime_path = vim.split(package.path, ";")
      table.insert(runtime_path, "lua/?.lua")
      table.insert(runtime_path, "lua/?/init.lua")

      opts.settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
            -- Setup your lua path
            path = runtime_path,
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      }
    end,
  }

  require("nvim-lsp-installer").on_server_ready(function(server)
    local opts = {
      -- apply to all lsp servers
      autostart = false,
      capabilities = capabilities,
      on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
      end,
    }

    if enhance_server_opts[server.name] then
      enhance_server_opts[server.name](opts)
    end

    server:setup(opts)
  end)
end

function M.keybind() end

return M
