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
      require("colorizer").setup({
        options = {
          display = {
            mode = "virtualtext",
            virtualtext = {
              char = "●",
              position = "before",
            },
          },
        },
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPost",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local fts = {
        "bash",
        "c",
        "cpp",
        "css",
        "dockerfile",
        "go",
        "gomod",
        "gosum",
        "html",
        "ini",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "just",
        "kdl",
        "lua",
        "make",
        "markdown",
        "nginx",
        "printf",
        "proto",
        "python",
        "regex",
        "ruby",
        "rust",
        "ssh_config",
        "swift",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "xresources",
        "yaml",
        "zig",
      }
      require("nvim-treesitter").install(fts)
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          local lang = vim.treesitter.language.get_lang(ev.match)
          if lang and vim.treesitter.language.add(lang) then
            vim.treesitter.start()
          end
        end,
      })
    end,
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
    opts = {
      experimental = {
        check_rtp_message = false,
      },
    },
  },
  {
    "OXY2DEV/helpview.nvim",
    ft = "help",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "mcauley-penney/visual-whitespace.nvim",
    event = "ModeChanged *:[vV\22]",
    opts = {
      fileformat_chars = {
        unix = "¬",
        mac = "←",
        dos = "↙",
      },
    },
  },
}
