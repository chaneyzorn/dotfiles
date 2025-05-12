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
        component_separators = "",
        section_separators = "",
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
            "filetype",
            padding = { left = 1, right = 0 },
            colored = true,
            icon_only = true,
          },
          {
            "filename",
            path = 1,
            padding = { left = 0, right = 1 },
            symbols = {
              modified = "󰃉 ",
              readonly = " ",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
        },
        lualine_x = {
          { "encoding", icon = " " },
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
        lualine_y = {
          {
            function()
              local cur = vim.fn.line(".")
              local total = vim.fn.line("$")
              local col = vim.fn.charcol(".")
              return string.format("r%d,c%d,%d%s", cur, col, math.floor(cur / total * 100), "%%")
            end,
            icon = " ",
          },
        },
        lualine_z = {},
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
