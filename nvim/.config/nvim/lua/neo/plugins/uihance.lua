return {
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    main = "bqf",
  },
  {
    "kevinhwang91/nvim-hlslens",
    keys = {
      {
        "n",
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        noremap = true,
        silent = true,
      },
      {
        "N",
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        noremap = true,
        silent = true,
      },
      { "*", [[*<Cmd>lua require('hlslens').start()<CR>]], noremap = true, silent = true },
      { "#", [[#<Cmd>lua require('hlslens').start()<CR>]], noremap = true, silent = true },
      { "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], noremap = true, silent = true },
      { "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], noremap = true, silent = true },
    },
    config = function()
      -- require("hlslens").setup() is not required
      require("scrollbar.handlers.search").setup({
        -- hlslens config overrides
      })
    end,
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
    cmd = { "Floaterm" },
    keys = {
      { "<M-n>", desc = "Floaterm new" },
      { "<M-\\><M-\\>", desc = "Floaterm toggle" },
      { "<M-[>", desc = "Floaterm prev" },
      { "<M-]>", desc = "Floaterm next" },
      { "<M-`>", [[<C-\><C-n>]], mode = { "t" }, desc = "Exit terminal-mode" },
      { "<C-\\><CR>", [[<C-\><C-n>]], mode = { "t" }, desc = "Exit terminal-mode" },
    },
    init = function()
      local vg = vim.g

      vg.floaterm_width = 0.95
      vg.floaterm_height = 0.95

      vg.floaterm_keymap_new = "<M-n>"
      vg.floaterm_keymap_prev = "<M-[>"
      vg.floaterm_keymap_next = "<M-]>"
      vg.floaterm_keymap_toggle = "<M-\\><M-\\>"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = {
      "Tm",
      "Vtm",
      "ToggleTerm",
      "ToggleTermToggleAll",
      "TermExec",
      "TermSelect",
    },
    keys = {
      { "<C-\\><C-\\>", "<Cmd>ToggleTerm<CR>", mode = { "n" }, desc = "Open horizontal terminal" },
      { "<C-\\><CR>", "<Cmd>Vtm<CR>", mode = { "n" }, desc = "Open vertical terminal" },
    },
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\><C-\>]],
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
      })

      vim.api.nvim_create_user_command("Tm", function(opts)
        local Terminal = require("toggleterm.terminal").Terminal
        local tm = Terminal:new({
          cmd = opts.fargs[1] or "zsh",
          display_name = opts.fargs[1] or "zsh",
          direction = "horizontal",
          on_open = function(term)
            vim.opt_local.number = false
            vim.cmd("startinsert")
          end,
          close_on_exit = true,
          auto_scroll = true,
        })
        tm:toggle()
      end, {
        nargs = "?",
        desc = "open terminal in split window",
        complete = function(ArgLead, Cmdline, CursorPos)
          return { "zsh", "python3" }
        end,
      })

      vim.api.nvim_create_user_command("Vtm", function(opts)
        local Terminal = require("toggleterm.terminal").Terminal
        local tm = Terminal:new({
          cmd = opts.fargs[1] or "zsh",
          display_name = opts.fargs[1] or "zsh",
          direction = "vertical",
          on_open = function(term)
            vim.opt_local.number = false
            vim.cmd("startinsert")
          end,
          close_on_exit = true,
          auto_scroll = true,
        })
        tm:toggle()
      end, {
        nargs = "?",
        desc = "open terminal in vsplit window",
        complete = function(ArgLead, Cmdline, CursorPos)
          return { "zsh", "python3" }
        end,
      })
    end,
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
          require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
          vim.keymap.set("n", "<C-k>", "3k", {
            desc = "nvim-tree: revert default to move faster",
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          })
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
            "*.swp",
            "*.pyc",
            ".git$",
            ".idea$",
            ".ropeproject",
            "node_modules",
          },
        },
      })
    end,
  },
  {
    "mikavilpas/yazi.nvim",
    keys = {
      {
        "<leader>fm",
        function()
          require("yazi").yazi()
        end,
        desc = "Open yazi file manager",
      },
      {
        "<leader>fk",
        function()
          require("yazi").yazi(nil, vim.fn.getcwd())
        end,
        desc = "Reveal file in yazi",
      },
    },
    opts = {
      use_ya_for_events_reading = true,
      floating_window_scaling_factor = 0.85,
    },
  },
}
