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
    },
    init = function()
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99

      -- vim.o.foldenable = true
      -- vim.o.foldmethod = "indent"
      -- vim.o.foldmethod = "expr"
      -- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    end,
    config = function()
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
