return {
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    main = "bqf",
  },
  {
    "stevearc/aerial.nvim",
    cmd = {
      "AerialToggle",
      "AerialOpen",
      "AerialNavToggle",
      "AerialNavOpen",
    },
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
        default_direction = "prefer_left",
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
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
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
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          api.config.mappings.default_on_attach(bufnr)

          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          vim.keymap.set("n", "]b", api.node.navigate.opened.next, opts("navigate to next opened file"))
          vim.keymap.set("n", "[b", api.node.navigate.opened.prev, opts("navigate to prev opened file"))
        end,
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
              modified = "󰃉",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "󰃉",
                staged = "󰄭",
                unmerged = "",
                renamed = "",
                untracked = "󰓒",
                deleted = "",
                ignored = "",
              },
            },
          },
        },
        filters = {
          git_ignored = false,
          custom = {
            -- `\\` escape as lua `\`, then
            -- https://neovim.io/doc/user/pattern.html#pattern
            "*.swp$",
            "*.pyc$",
            "^\\.git$",
            "^\\.idea$",
            "^node_modules$",
          },
        },
      })
    end,
  },
}
