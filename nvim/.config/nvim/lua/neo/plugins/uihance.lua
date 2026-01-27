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
  {
    "serhez/bento.nvim",
    config = function()
      require("bento").setup({
        ordering_metric = "edit",
        ui = {
          mode = "floating",
          floating = {
            position = "middle-right",
            minimal_menu = "dashed",
          },
        },
      })

      vim.api.nvim_create_user_command("BentoCloseBuf", function()
        require("bento").close_all_buffers({ visible = false, locked = false, current = false })
      end, { desc = "Delete listed unmodified buffers that are not in a window" })

      -- TODO: wait for upstream apis
      local collapse_timer = nil
      vim.keymap.set("n", "<M-b>", function()
        if collapse_timer then
          vim.fn.timer_stop(collapse_timer)
        end

        require("bento.ui").expand_menu()
        vim.cmd.bnext()
        collapse_timer = vim.fn.timer_start(3000, function()
          require("bento.ui").collapse_menu()
        end)
      end)
    end,
  },
  {
    "gh-liu/nvim-winterm",
    cmd = "Winterm",
    keys = {
      {
        "<M-t>",
        "<cmd>Winterm<CR>",
        mode = { "n", "t" },
        desc = "Winterm toggle",
      },
    },
    config = function()
      local term_tweak = vim.api.nvim_create_augroup("term-tweak", { clear = true })
      vim.api.nvim_create_autocmd("TermOpen", {
        group = term_tweak,
        callback = function(event)
          if vim.bo.filetype == "" then
            vim.bo.filetype = "terminal"
          end
          vim.keymap.set("t", [[<M-\><M-\>]], [[<C-\><C-n>]], {
            buffer = event.buf,
            desc = "Enter Normal mode in terminal",
          })

          -- check buf belong to winterm
          if not vim.b[event.buf].winterm then
            return
          end

          vim.keymap.set({ "t", "n" }, "<M-[>", "<cmd>Winterm -1<CR>", {
            buffer = event.buf,
            desc = "Winterm cycle prev terminal buffer",
          })
          vim.keymap.set({ "t", "n" }, "<M-]>", "<cmd>Winterm +1<CR>", {
            buffer = event.buf,
            desc = "Winterm cycle next terminal buffer",
          })
          vim.keymap.set({ "t", "n" }, "<M-n>", "<cmd>Winterm zsh<CR>", {
            buffer = event.buf,
            desc = "Winterm create new terminal zsh job",
          })
        end,
      })
      vim.api.nvim_create_autocmd("TermClose", {
        group = term_tweak,
        callback = function(event)
          -- check buf belong to winterm
          if not vim.b[event.buf].winterm then
            return
          end

          -- stopinsert if term closed
          vim.api.nvim_buf_call(event.buf, function()
            vim.cmd.stopinsert()
          end)

          -- TODO: feature request, a group of user cmd pattern hook points, to allow user custom
          vim.b[event.buf].term_close = true
          vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
            group = term_tweak,
            buffer = event.buf,
            callback = function(ent)
              if vim.b[ent.buf].term_close then
                vim.cmd.stopinsert()
              end
            end,
          })

          vim.keymap.set("n", "<Enter>", "<cmd>Winterm -1<CR><cmd>Winterm! +1<CR>", {
            buffer = event.buf,
          })
        end,
      })

      require("winterm").setup({
        autofocus = true,
        autoinsert = true,
      })
    end,
  },
}
