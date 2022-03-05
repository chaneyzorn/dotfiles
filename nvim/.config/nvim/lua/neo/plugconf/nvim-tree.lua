local M = {}

function M.pre()
  local vg = vim.g

  vg.nvim_tree_side = "left"
  vg.nvim_tree_width = 30
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
    actions = {
      change_dir = {
        enable = true,
        global = false,
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
  })
end

function M.keybind()
  local U = require("neo.tools")
  U.nmap("<Leader>ft", "<Cmd>NvimTreeToggle<CR>")
  U.nmap("<Leader>fl", "<Cmd>NvimTreeFindFile<CR>")

  require("neo.keybind").leader_help({
    ft = "打开文件树",
    fl = "在文件树中定位此文件",
  })
end

return M
