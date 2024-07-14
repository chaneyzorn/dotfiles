return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      { "<leader>rg", "<cmd>GrugFar<CR>", desc = "Grug find and replace" },
    },
    config = function()
      require("grug-far").setup({
        extraRgArgs = "--hidden",
        headerMaxWidth = 80,
        disableBufferLineNumbers = false,
        startInInsertMode = false,
        resultsSeparatorLineChar = "─",
        icons = {
          actionEntryBullet = "  ",
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
      { "<leader>fc", "<cmd>Telescope grep_string<CR>", desc = "Telescope search cursor" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
      { "<leader>fg", "<cmd>Telescope git_status<CR>", desc = "Telescope git status" },
      { "<leader>fr", "<cmd>Telescope live_grep<CR>", desc = "Telescope live search" },
    },
    config = function()
      local actions = require("telescope.actions")
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
          file_ignore_patterns = { "node_modules/", ".git/" },
        },
        pickers = { find_files = { hidden = true } },
      })
    end,
  },
  {
    "cbochs/grapple.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Grapple",
    keys = {
      {
        "<leader>la",
        function()
          require("grapple").tag()
          vim.notify("tagged to grapple list")
        end,
        desc = "Grapple tag",
      },
      {
        "<leader>lr",
        function()
          require("grapple").untag()
          vim.notify("untagged from grapple list")
        end,
        desc = "Grapple untag",
      },
      { "<leader>ls", "<cmd>Grapple toggle_tags<CR>", desc = "Grapple list" },
      { "<leader>ll", "<cmd>Telescope grapple tags<CR>", desc = "Grapple telescope list" },
      { "]f", "<cmd>Grapple cycle_tags next<CR>", desc = "Grapple next" },
      { "[f", "<cmd>Grapple cycle_tags prev<CR>", desc = "Grapple next" },
    },
    config = function()
      require("telescope").load_extension("grapple")
      require("grapple").setup({
        scope = "git_branch",
      })
    end,
  },
}
