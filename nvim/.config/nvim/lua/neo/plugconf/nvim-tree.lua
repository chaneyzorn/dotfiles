local M = {}

function M.pre() end

function M.post()
  require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    view = {
      adaptive_size = true,
    },
    git = {
      ignore = false,
    },
    renderer = {
      highlight_git = true,
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "➜",
            untracked = "六",
            deleted = "-",
            ignored = "◌",
          },
        },
      },
    },
    filters = {
      dotfiles = false,
      custom = {
        "*.swp",
        "*.pyc",
        ".git$",
        ".idea$",
        ".ropeproject",
        "node_modules",
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
