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
        scope = { char = "┊" },
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
      scope = {},
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
    "olimorris/persisted.nvim",
    config = function()
      require("persisted").setup({
        autoload = true,
        should_save = function()
          local cwd = vim.fn.getcwd()
          local git_dir = vim.fs.joinpath(cwd, ".git")
          if vim.uv.fs_stat(git_dir) then
            return true
          end
          return false
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "PersistedSavePre",
        callback = function()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            -- not save nofile buffer
            if vim.bo[buf].buftype == "nofile" then
              if not vim.list_contains({ "NvimTree" }, vim.bo[buf].filetype) then
                vim.api.nvim_buf_delete(buf, { force = true })
              end
            end
          end
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "PersistedLoadPost",
        callback = function()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            local buf_name = vim.api.nvim_buf_get_name(buf)
            if string.find(buf_name, "NvimTree") then
              -- recover nvim-tree buf content after session loaded
              require("nvim-tree.api").tree.find_file({ open = true, focus = false })
              return
            end
          end
        end,
      })
    end,
  },
  {
    dir = vim.fn.expand("~/Projects/iself/xdo.nvim"),
    dev = true,
    cmd = { "Xdo", "Xdov", "Vdo", "Vdov", "XdoLog" },
  },
}
