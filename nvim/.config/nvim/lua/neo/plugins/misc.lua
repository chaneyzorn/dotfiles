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
      require("mini.ai").setup()
      require("mini.icons").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.trailspace").setup()

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
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      indent = {
        indent = { char = "┊" },
        scope = { char = "┊" },
      },
    },
  },
  {
    dir = vim.fn.expand("~/Projects/iself/xdo.nvim"),
    dev = true,
    cmd = { "Xdo" },
  },
}
