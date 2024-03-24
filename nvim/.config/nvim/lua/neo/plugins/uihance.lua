return {
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    main = "bqf",
  },
  {
    "stevearc/stickybuf.nvim",
    opts = {},
  },
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>ta", "<cmd>AerialNavToggle<CR>", desc = "Aerial nav toggle" },
      { "<leader>tb", "<cmd>AerialToggle<CR>", desc = "Aerial outline toggle" },
    },
    opts = {
      layout = {
        width = 30,
        min_width = 20,
      },
      -- filter_kind = false,
      filter_kind = {
        "Module",
        "Namespace",
        "Package",
        "Class",
        "Method",
        "Property",
        "Field",
        "Constructor",
        "Enum",
        "Interface",
        "Function",
        "Constant",
        "Array",
        "Object",
        "Key",
        "EnumMember",
        "Struct",
      },
      show_guides = true,
    },
  },
  {
    "voldikss/vim-floaterm",
    keys = {
      { "<M-w>", desc = "Floaterm new" },
      { "<M-t>", desc = "Floaterm toggle" },
      { "<M-[>", desc = "Floaterm prev" },
      { "<M-]>", desc = "Floaterm next" },
    },
    init = function()
      local vg = vim.g
      vg.floaterm_keymap_new = "<M-w>"
      vg.floaterm_keymap_prev = "<M-[>"
      vg.floaterm_keymap_next = "<M-]>"
      vg.floaterm_keymap_toggle = "<M-t>"
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    cmd = {
      "NvimTreeToggle",
      "NvimTreeFindFile",
      "NvimTreeFocus",
    },
    keys = {
      { "<leader>ft", "<cmd>NvimTreeToggle<CR>", desc = "NvimTreeToggle" },
      { "<leader>fl", "<cmd>NvimTreeFindFile<CR>", desc = "NvimTreeFindFile" },
    },
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
