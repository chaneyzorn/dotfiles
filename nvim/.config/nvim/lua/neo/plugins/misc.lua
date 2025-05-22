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
      require("mini.surround").setup()
      require("mini.trailspace").setup()

      require("mini.indentscope").setup({
        symbol = "┊",
        options = {
          try_as_border = true,
        },
      })
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
        pattern = { "help", "NvimTree", "snacks_picker_preview" },
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
      {
        "<leader>zz",
        function()
          Snacks.zen.zen()
        end,
        desc = "Toggle zen mode",
      },
      {
        "<leader>za",
        function()
          Snacks.zen.zoom()
        end,
        desc = "Toggle zen zoom",
      },
    },
    opts = {
      picker = {},

      indent = {
        indent = { char = "┊" },
        scope = {
          char = "┊",
          -- use mini.indentscope
          enabled = false,
        },
        filter = function(buf)
          if vim.b[buf].snacks_indent == false then
            return false
          end

          if vim.bo[buf].filetype == "snacks_picker_preview" then
            return false
          end

          local bt = vim.bo[buf].buftype
          if bt == "nofile" or bt == "help" then
            return false
          end

          return true
        end,
      },

      scroll = {
        filter = function(buf)
          return vim.g.neovide == nil
            and vim.g.snacks_scroll ~= false
            and vim.b[buf].snacks_scroll ~= false
            and vim.bo[buf].buftype ~= "terminal"
        end,
      },

      zen = {},
    },
  },
  {
    "fnune/recall.nvim",
    keys = {
      { "<leader>mm", "<Cmd>RecallToggle<CR>", desc = "" },
      { "<leader>mn", "<Cmd>RecallNext<CR>", desc = "" },
      { "<leader>mp", "<Cmd>RecallPrevious<CR>", desc = "" },
      { "<leader>mc", "<Cmd>RecallClear<CR>", desc = "" },
      {
        "<leader>ml",
        function()
          require("recall.snacks").pick()
        end,
        desc = "",
      },
      {
        "<leader>fm",
        function()
          require("recall.snacks").pick()
        end,
        desc = "",
      },
    },
    opts = {
      sign_highlight = "DiagnosticSignHint",
    },
  },
  {
    "chentoast/marks.nvim",
    event = "BufReadPost",
    opts = {},
  },
  {
    dir = vim.fn.expand("~/Projects/iself/xdo.nvim"),
    dev = true,
    cmd = { "Xdo", "Xdov", "Vdo", "Vdov", "XdoLog" },
  },
}
