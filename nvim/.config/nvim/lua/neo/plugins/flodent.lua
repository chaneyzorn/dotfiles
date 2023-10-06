return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    init = function()
      vim.o.foldenable = false
      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr(v:lnum)"
    end,
    config = function()
      require("ibl").setup({
        indent = { char = "┊" },
        scope = {
          char = "│",
          show_start = false,
          show_end = false,
        },
      })
      require("mini.indentscope").setup({
        symbol = "┊",
        options = {
          try_as_border = true,
        },
      })
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    enabled = false,
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "BufRead",

    init = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      -- vim.o.foldmethod = "indent"
      -- vim.o.foldmethod = "expr"
      -- vim.o.foldexpr = "nvim_treesitter#foldexpr()"

      vim.keymap.set("n", "zR", function()
        require("ufo").openAllFolds()
      end)
      vim.keymap.set("n", "zM", function()
        require("ufo").closeAllFolds()
      end)
    end,

    config = function()
      local ft_map = {}

      local virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" 󰁂  [%d lines] "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local hlGroup = chunk[2]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "ModeMsg" })
        return newVirtText
      end

      -- https://github.com/kevinhwang91/nvim-ufo/issues/63
      -- https://github.com/kevinhwang91/nvim-ufo/blob/main/doc/example.lua
      local function customizeSelector(bufnr)
        local function handleFallbackException(err, providerName)
          if type(err) == "string" and err:match("UfoFallbackException") then
            return require("ufo").getFolds(providerName, bufnr)
          else
            return require("promise").reject(err)
          end
        end

        return require("ufo")
          .getFolds(bufnr, "lsp")
          :catch(function(err)
            return handleFallbackException(err, "treesitter")
          end)
          :catch(function(err)
            return handleFallbackException(err, "indent")
          end)
      end

      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          if not filetype then
            return { "indent" }
          end
          return ft_map[filetype] or customizeSelector
        end,
        fold_virt_text_handler = virt_text_handler,
      })
    end,
  },
}
