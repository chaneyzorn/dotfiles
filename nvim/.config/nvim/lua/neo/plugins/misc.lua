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
    keys = {
      {
        "<leader>fb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Pick buffers",
      },
      {
        "<leader>fg",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Pick git status",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.files({ hidden = true })
        end,
        desc = "Pick files",
      },
      {
        "<leader>fr",
        function()
          Snacks.picker.grep({ hidden = true })
        end,
        desc = "Pick live search",
      },
      {
        "<leader>fc",
        function()
          Snacks.picker.grep_word({ hidden = true })
        end,
        desc = "Pick search cursor",
      },
    },
    opts = {
      indent = {
        indent = { char = "┊" },
        scope = { char = "┊" },
        filter = function(buf)
          if vim.b[buf].snacks_indent == false then
            return false
          end
          if vim.bo[buf].filetype == "snacks_picker_preview" then
            return false
          end
          if vim.bo[buf].buftype == "nofile" then
            return false
          end
          return true
        end,
      },
      picker = {
        layout = {
          preset = function()
            return vim.o.columns >= 120 and "telescope" or "vertical"
          end,
        },
      },
    },
  },
  {
    dir = vim.fn.expand("~/Projects/iself/xdo.nvim"),
    dev = true,
    cmd = { "Xdo" },
  },
}
