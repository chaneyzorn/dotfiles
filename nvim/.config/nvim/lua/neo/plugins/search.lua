return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      { "<leader>rg", "<cmd>GrugFar<CR>", desc = "Grug find and replace" },
    },
    config = function()
      require("grug-far").setup({
        disableBufferLineNumbers = false,
        startInInsertMode = false,
        normalModeSearch = true,
        wrap = false,
        resultsSeparatorLineChar = "─",
        icons = {
          actionEntryBullet = "  ",
        },
        engines = {
          ripgrep = {
            path = "rg",
            extraArgs = "--hidden",
          },
        },
        folding = {
          foldcolumn = "0",
        },
        helpLine = {
          enabled = false,
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
          file_ignore_patterns = {
            -- lua patterns: https://www.lua.org/pil/20.2.html
            "node_modules/",
            "%.git/",
          },
        },
        pickers = { find_files = { hidden = true } },
      })
    end,
  },
}
