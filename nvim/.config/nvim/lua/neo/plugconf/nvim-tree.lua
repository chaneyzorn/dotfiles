local M = {}

function M.pre()
  local vg = vim.g

  vg.nvim_tree_side = "left"
  vg.nvim_tree_width = 30
  vg.nvim_tree_quit_on_open = 0
  vg.nvim_tree_indent_markers = 1
  vg.nvim_tree_git_hl = 1
  vg.nvim_tree_root_folder_modifier = ":~"
  vg.nvim_tree_width_allow_resize = 1
  vg.nvim_tree_show_icons = { git = 1, folders = 1, files = 1 }

  vg.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "",
      staged = "",
      unmerged = "",
      renamed = "➜",
      untracked = "六",
    },
    folder = { default = "", open = "", symlink = "" },
  }
end

function M.post()
  require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    auto_close = true,
    open_on_tab = false,
    update_to_buf_dir = {
      enable = true,
      auto_open = true,
    },
    hijack_cursor = false,
    update_cwd = false,
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    update_focused_file = {
      enable = true,
      update_cwd = false,
      ignore_list = {},
    },
    system_open = {
      cmd = nil,
      args = {},
    },
    view = {
      width = 30,
      height = 30,
      side = "left",
      auto_resize = true,
      mappings = {
        custom_only = false,
        list = {},
      },
    },
    filters = {
      dotfiles = false,
      custom = {
        "*.swp",
        "*.pyc",
        ".git",
        ".idea",
        ".ropeproject",
        "node_modules",
      },
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
  })
end

return M
