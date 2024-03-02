return {
  {
    "voldikss/vim-floaterm",
    event = "VeryLazy",
    init = function()
      local vg = vim.g

      -- floaterm 快捷键配置
      vg.floaterm_keymap_new = "<Leader>tr"
      vg.floaterm_keymap_prev = "<Leader>["
      vg.floaterm_keymap_next = "<Leader>]"
      vg.floaterm_keymap_toggle = "<Leader>tt"

      require("neo.keybind").leader_help({
        tt = "切入切出浮窗终端",
        tr = "创建新浮窗终端",
      })
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    cmd = {
      "NvimTreeToggle",
      "NvimTreeFindFile",
      "NvimTreeFocus",
    },
    init = function()
      local U = require("neo.tools")
      U.nmap("<Leader>ft", "<Cmd>NvimTreeToggle<CR>")
      U.nmap("<Leader>fl", "<Cmd>NvimTreeFindFile<CR>")

      require("neo.keybind").leader_help({
        ft = "打开文件树",
        fl = "在文件树中定位此文件",
      })
    end,
    config = function()
      require("nvim-tree").setup({
        disable_netrw = true,
        sync_root_with_cwd = true,
        view = {
          width = {
            min = 30,
            max = 80,
          },
        },
        modified = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = true,
        },
        renderer = {
          highlight_git = true,
          highlight_modified = "all",
          highlight_opened_files = "all",
          highlight_clipboard = "all",
          indent_markers = {
            enable = true,
          },
          special_files = {
            "Cargo.toml",
            "Makefile",
            "README.md",
            "readme.md",
            "packages.json",
          },
          icons = {
            glyphs = {
              default = "󰈙",
              symlink = "",
              bookmark = "󰆤",
              modified = "●",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "󰃉",
                staged = "󰄭",
                unmerged = "",
                renamed = "➜",
                untracked = "󰓒",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        filters = {
          git_ignored = false,
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
    end,
  },
}
