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
    version = "*",
    config = function()
      require("mini.indentscope").setup({
        symbol = "┊",
        options = {
          try_as_border = true,
        },
      })

      require("mini.ai").setup()
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local disabled_filetypes = require("hardtime.config").config.disabled_filetypes
      require("hardtime").setup({
        disabled_filetypes = vim.list_extend(vim.deepcopy(disabled_filetypes), {
          "git",
          "gitsigns.blame",
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
