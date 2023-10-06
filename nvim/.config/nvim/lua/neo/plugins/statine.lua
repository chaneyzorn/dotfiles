return {
  {
    "akinsho/nvim-bufferline.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "BufReadPre",

    init = function()
      local U = require("neo.tools")

      U.nmap("<Leader>bb", "<Cmd>BufferLineCycleNext<CR>")
      U.nmap("<Leader>bh", "<Cmd>BufferLineCyclePrev<CR>")
      U.nmap("<Leader>bp", "<Cmd>BufferLinePick<CR>")

      require("neo.keybind").leader_help({
        bb = "Next buffer",
        bh = "Previous buffer",
        bp = "Pick a buffer",
      })
    end,

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
