return {
  {
    "farmergreg/vim-lastplace",
    event = "BufReadPre",
  },
  {
    "lambdalisue/suda.vim",
    event = "CmdlineEnter",
    cmd = {
      "SudaWrite",
    },
  },
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require("mini.indentscope").setup({
        symbol = "┊",
        options = {
          try_as_border = true,
        },
      })

      require("mini.ai").setup()
      require("mini.icons").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()

      -- see :h mini.nvim-disabling-recipes
      local mini_disable = vim.api.nvim_create_augroup("MiniDisable", { clear = true })
      vim.api.nvim_create_autocmd({ "TermOpen" }, {
        group = mini_disable,
        pattern = "*",
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = mini_disable,
        pattern = { "help", "NvimTree" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })

      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#8b848b" })
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local disabled_filetypes = require("hardtime.config").config.disabled_filetypes
      require("hardtime").setup({
        restriction_mode = "hint",
        disabled_filetypes = vim.list_extend(vim.deepcopy(disabled_filetypes), {
          "git",
          "gitsigns.blame",
          "grug-far",
        }),
        -- restriction_mode = "hint",
        disabled_keys = {
          ["<Up>"] = {},
          ["<Down>"] = {},
          ["<Left>"] = {},
          ["<Right>"] = {},
        },
      })
    end,
  },
}
