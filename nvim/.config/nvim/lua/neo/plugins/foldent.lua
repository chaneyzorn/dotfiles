return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      require("ibl").setup({
        indent = { char = "┊" },
        scope = { enabled = false },
      })
    end,
  },
  {
    "gh-liu/fold_line.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.fold_line_current_fold_only = true
      vim.g.fold_line_char_open_start = "╭"
      vim.g.fold_line_char_open_end = "╰"
    end,
    config = function()
      vim.api.nvim_set_hl(0, "FoldLine", { link = "IblIdent" })
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "BufRead",
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
        desc = "Open all folds",
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
        desc = "Close all folds",
      },
      {
        "az",
        "<cmd>lua require('ufo').foldScope('outer')<CR>",
        mode = { "o", "x" },
        desc = "text-obj: a-fold",
      },
      {
        "iz",
        "<cmd>lua require('ufo').foldScope('inner')<CR>",
        mode = { "o", "x" },
        desc = "text-obj: i-fold",
      },
    },
    init = function()
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
    end,
    config = function()
      local getFoldScope = function()
        local lnum = vim.fn.line(".")
        local startLine = vim.fn.foldclosed(lnum)
        local endLine = vim.fn.foldclosedend(lnum)
        if startLine < 0 then
          vim.cmd.foldclose({ mods = { silent = true, emsg_silent = true } })
          startLine = vim.fn.foldclosed(lnum)
          endLine = vim.fn.foldclosedend(lnum)
          vim.cmd.foldopen({ mods = { silent = true, emsg_silent = true } })
        end
        if startLine < 0 then
          return lnum, lnum
        end
        return startLine, endLine
      end

      local lineWiseSelect = function(startLine, endLine)
        -- save last position in jumplist like vim native textobj
        vim.cmd.normal({ "m`", bang = true })
        vim.api.nvim_win_set_cursor(0, { startLine, 0 })
        if not vim.fn.mode():find("V") then
          vim.cmd.normal({ "V", bang = true })
        end
        -- move cursor to end of visual
        vim.cmd.normal({ "o", bang = true })
        vim.api.nvim_win_set_cursor(0, { endLine, 0 })
      end

      local ufo = require("ufo")

      ufo.foldScope = function(scope)
        local sl, el = getFoldScope()
        vim.cmd.foldopen({
          mods = { emsg_silent = true, silent = true },
          range = { sl, el },
        })
        if scope == "inner" then
          local tailFt = { "python" }
          sl = vim.fn.min({ sl + 1, el })
          if not vim.tbl_contains(tailFt, vim.bo.ft) then
            el = vim.fn.max({ el - 1, sl })
          elseif string.match(vim.fn.getline(el), "^%s*[}%])]+") then
            el = vim.fn.max({ el - 1, sl })
          end
        end
        lineWiseSelect(sl, el)
      end

      ufo.setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
