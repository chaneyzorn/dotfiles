return {
  {
    "akinsho/nvim-bufferline.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "BufReadPre",
    keys = {
      { "<leader>bb", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<leader>bh", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
      { "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick a buffer" },
    },
    opts = {
      options = {
        always_show_bufferline = false,
        show_buffer_close_icons = false,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          { "mode" },
        },
        lualine_b = {
          {
            "branch",
            icon = "",
          },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = "󰛨 " },
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = {
              modified = "󰃉 ",
              readonly = " ",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
        },
        lualine_x = {
          { "encoding" },
          {
            "fileformat",
            symbols = {
              unix = " LF",
              dos = " CRLF",
              mac = " CR",
            },
          },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
