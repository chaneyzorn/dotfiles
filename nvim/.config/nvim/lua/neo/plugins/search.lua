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
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>la",
        function()
          require("harpoon"):list():add()
          vim.notify("added to harpoon list")
        end,
        desc = "Harpoon add to list",
      },
      {
        "<leader>lr",
        function()
          require("harpoon"):list():remove()
          vim.notify("removed from harpoon list")
        end,
        desc = "Harpoon remove from list",
      },
      {
        "<leader>ls",
        function()
          local h = require("harpoon")
          h.ui:toggle_quick_menu(h:list())
        end,
        desc = "Harpoon list file",
      },
      {
        "<leader>ll",
        function()
          local file_paths = {}
          local harpoon_files = require("harpoon"):list()
          for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
          end

          local tc = require("telescope.config").values
          local tp = require("telescope.pickers")
          local tf = require("telescope.finders")
          tp.new({}, {
            prompt_title = "Harpoon",
            finder = tf.new_table({ results = file_paths }),
            previewer = tc.file_previewer({}),
            sorter = tc.generic_sorter({}),
          }):find()
        end,
        desc = "Harpoon telescope list",
      },
      {
        "]f",
        function()
          require("harpoon"):list():next({ ui_nav_wrap = true })
        end,
        desc = "Harpoon next",
      },
      {
        "[f",
        function()
          require("harpoon"):list():prev({ ui_nav_wrap = true })
        end,
        desc = "Harpoon next",
      },
    },
    config = function()
      require("harpoon"):setup()
    end,
  },
}
