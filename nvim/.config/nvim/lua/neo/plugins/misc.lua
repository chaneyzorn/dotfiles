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
    opts = {},
  },
}
