return {
  {
    "folke/flash.nvim",
    opts = {},
    keys = {
      {
        "<leader>s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash jump",
      },
      {
        "<leader>o",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash treesitter",
      },
      {
        "<M-r>",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Flash remote",
      },
      {
        "<M-f>",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash treesitter search",
      },
      {
        "<M-g>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Flash search toggle",
      },
    },
  },
  {
    "lukas-reineke/virt-column.nvim",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    opts = {
      char = "▕",
    },
  },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require("illuminate").configure({
        filetypes_denylist = {
          "fugitive",
          "NvimTree",
          "DiffviewFiles",
          "qf",
          "help",
          "list",
          "man",
          "aerial",
        },
      })
    end,
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "TodoQuickFix",
      "TodoLocList",
    },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    keys = {
      {
        "<M-i>",
        function()
          local t = require("nvim-treesitter.ts_utils")
          t.goto_node(t.get_next_node(t.get_node_at_cursor(), true, true), false, true)
        end,
        desc = "tswalker prev",
      },
      {
        "<M-u>",
        function()
          local t = require("nvim-treesitter.ts_utils")
          t.goto_node(t.get_previous_node(t.get_node_at_cursor(), true, true), false, true)
        end,
        desc = "tswalker next",
      },
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            node_decremental = "grm",
            scope_incremental = "grc",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              -- ["az"] = { query = "@fold", query_group = "folds", desc = "text-obj: a-fold" },
              -- ["iz"] = { query = "@fold", query_group = "folds", desc = "text-obj: i-fold" },
            },
            selection_modes = {
              ["@fold"] = "V",
            },
          },
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "folke/ts-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "aaronik/treewalker.nvim",
    cmd = { "Treewalker" },
    keys = {
      -- movement
      { "<M-k>", "<cmd>Treewalker Up<CR>", mode = { "n", "v" }, desc = "Treewalker Up" },
      { "<M-j>", "<cmd>Treewalker Down<CR>", mode = { "n", "v" }, desc = "Treewalker Down" },
      { "<M-l>", "<cmd>Treewalker Right<CR>", mode = { "n", "v" }, desc = "Treewalker Right" },
      { "<M-h>", "<cmd>Treewalker Left<CR>", mode = { "n", "v" }, desc = "Treewalker Left" },
      -- swapping
      { "<M-p>", "<cmd>Treewalker SwapDown<CR>", mode = { "n" }, desc = "Treewalker SwapDown" },
      { "<M-o>", "<cmd>Treewalker SwapUp<CR>", mode = { "n" }, desc = "Treewalker SwapUp" },
      { "<M-.>", "<cmd>Treewalker SwapRight<CR>", mode = { "n" }, desc = "Treewalker SwapRight" },
      { "<M-,>", "<cmd>Treewalker SwapLeft<CR>", mode = { "n" }, desc = "Treewalker SwapLeft" },
    },
    opts = {},
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
  {
    "OXY2DEV/helpview.nvim",
    ft = "help",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
