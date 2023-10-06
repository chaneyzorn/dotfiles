-- TODO: split which-key
return {
  {
    "numToStr/Comment.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    opts = {},
  },
  {
    "tpope/vim-surround",
    event = "BufReadPre",
  },
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function()
      require("leap").set_default_keymaps(true)
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = true,
  },
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
    "lukas-reineke/virt-column.nvim",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    opts = {},
  },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require("illuminate").configure({
        filetypes_denylist = {
          "dirvish",
          "fugitive",
          "NvimTree",
          "DiffviewFiles",
          "qf",
          "help",
          "list",
          "vista",
          "man",
        },
      })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "folke/twilight.nvim",
    cmd = {
      "Twilight",
      "TwilightEnable",
    },
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    opts = {},
  },
}
