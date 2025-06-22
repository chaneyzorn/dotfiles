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
          {
            function()
              local get_mode = require("lualine.components.mode")
              local mode_code = get_mode()
              local mt = {
                ["COMMAND"] = "",
                ["CONFIRM"] = "",
                ["EX"] = "󱤵",
                ["INSERT"] = "",
                ["MORE"] = "󰍻",
                ["NORMAL"] = "",
                ["O-PENDING"] = "󰸻",
                ["REPLACE"] = "",
                ["S-BLOCK"] = "󰩬",
                ["S-LINE"] = "",
                ["SELECT"] = "󰫙",
                ["SHELL"] = "",
                ["TERMINAL"] = "",
                ["V-BLOCK"] = "󰮔",
                ["V-LINE"] = "󰡫",
                ["V-REPLACE"] = "󱥼",
                ["VISUAL"] = "󰈈",
              }
              if mt[mode_code] == nil then
                return mode_code
              end
              return mt[mode_code]
            end,
            separator = { right = vim.g.neovide and "" or "" },
            -- separator = { left = vim.g.neovide and "" or "" },
          },
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
          {
            "encoding",
            icon = "",
          },
          {
            "fileformat",
            symbols = {
              unix = "󰌽 LF",
              dos = " CRLF",
              mac = " CR",
            },
          },
          {
            function()
              return vim.bo.shiftwidth
            end,
            icon = "",
          },
          { "filetype" },
          {
            "lsp_status",
            icon = "",
            ignore_lsp = { "typos_lsp" },
          },
          {
            "tabs",
            mode = 1,
            show_modified_status = false,
            fmt = function(name, ctx)
              return string.format("%s %s", "", ctx.tabnr)
            end,
          },
        },
        lualine_y = {
          {
            function()
              return vim.fs.basename(vim.fn.getcwd())
            end,
            icon = { "󱃷", color = { fg = "#f9e2af" } },
          },
        },
        lualine_z = {},
      },
      winbar = {
        lualine_a = {},
        lualine_b = {
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
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = "󰛨 " },
          },
          {
            "searchcount",
            icon = "",
          },
          {
            function()
              local cur = vim.fn.line(".")
              local total = vim.fn.line("$")
              local percentage = math.floor(cur / total * 100)
              return string.format(" %d/%d %d%s", cur, total, percentage, "%%")
            end,
          },
        },
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
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
