local M = {}

function M.pre() end

function M.post()
  local U = require("neo.tools")

  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        {
          "branch",
          icon = "",
        },
        "diff",
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          sections = { "error", "warn", "info", "hint" },
          symbols = { error = " ", warn = " ", info = " ", hint = "ﯦ " },
          diagnostics_color = {
            error = { fg = U.colors.red },
            warn = { fg = U.colors.yellow },
            info = { fg = U.colors.cyan },
            hint = { fg = U.colors.orange },
          },
          colored = true,
        },
      },
      lualine_c = {
        {
          "filename",
          path = 1,
          symbols = {
            modified = "[]",
            readonly = "[]",
            unnamed = "[No Name]",
          },
        },
      },
      lualine_x = {
        "encoding",
        {
          "fileformat",
          icons_enabled = false,
        },
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  })
end

function M.keybind() end

return M
