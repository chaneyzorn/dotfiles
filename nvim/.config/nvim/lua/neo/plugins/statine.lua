return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        globalstatus = true,
        disabled_filetypes = {
          winbar = { "NvimTree", "aerial", "qf", "trouble" },
        },
      },
      extensions = { "aerial" },
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
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filetype",
            separator = "",
            padding = { left = 1, right = 0 },
            colored = true,
            icon_only = true,
          },
          {
            "filename",
            padding = { left = 0, right = 1 },
            separator = ">",
            symbols = {
              modified = "󰃉 ",
              readonly = " ",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
          {
            "aerial",
            sep = " > ",
            depth = 3,
            dense = false,
            dense_sep = ".",
            colored = true,
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filetype",
            separator = "",
            padding = { left = 1, right = 0 },
            colored = true,
            icon_only = true,
          },
          {
            "filename",
            padding = { left = 0, right = 1 },
            symbols = {
              modified = "󰃉 ",
              readonly = " ",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
