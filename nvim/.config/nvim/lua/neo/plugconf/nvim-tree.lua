local M = {}

function M.pre()
  local vg = vim.g

  vg.nvim_tree_side = "left"
  vg.nvim_tree_width = 30
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
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    renderer = {
      indent_markers = {
        enable = true,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
      icons = {
        webdev_colors = true,
      },
    },
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

  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    nested = true,
    callback = function()
      if vim.fn.winnr("$") == 1 and vim.fn.bufname() == "NvimTree_" .. vim.fn.tabpagenr() then
        vim.api.nvim_command("silent qa!")
      end
    end,
    desc = "automatically close the tab/vim when nvim-tree is the last window in the tab",
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
