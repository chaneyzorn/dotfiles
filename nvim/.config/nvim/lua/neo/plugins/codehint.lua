return {
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "ggandor/leap.nvim",
    keys = {
      { "<M-j>", "<Plug>(leap-forward)", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "<M-k>", "<Plug>(leap-backward)", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "<M-f>", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function()
      local leap_lualine = vim.api.nvim_create_augroup("LeapLualine", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = leap_lualine,
        pattern = "LeapEnter",
        callback = function()
          vim.g.u_leap_enter = true
          require("lualine").refresh({
            scope = "tabpage",
            place = { "statusline" },
          })
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        group = leap_lualine,
        pattern = "LeapLeave",
        callback = function()
          vim.g.u_leap_enter = false
          require("lualine").refresh({
            scope = "tabpage",
            place = { "statusline" },
          })
        end,
      })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<M-p>",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "<M-o>",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "<M-r>",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "<M-f>",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<M-g>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
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
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    cmd = {
      "TodoQuickFix",
      "TodoLocList",
      "TodoTrouble",
      "TodoTelescope",
    },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
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
      })
    end,
  },
}
