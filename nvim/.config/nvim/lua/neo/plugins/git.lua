return {
  {
    "tpope/vim-fugitive",
    event = "BufReadPre",
    init = function()
      local U = require("neo.tools")
      U.nmap("<Leader>gB", "<Cmd>Git blame<CR>")

      require("neo.keybind").leader_help({
        gB = "Git blame whole file",
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",

    init = function()
      require("neo.keybind").leader_help({
        hs = "Git stage hunk",
        hS = "Git stage buffer",
        hu = "Git undo stage hunk",
        hr = "Git reset hunk",
        hR = "Git reset buffer",
        hp = "Git preview hunk",
        hb = "Git blame current line",
        hd = "Git toggle delete/word changes",
        hl = "Git toggle diff highlight",
      })
    end,

    opts = {
      current_line_blame = true,
      current_line_blame_formatter = "      <author_time:%Y-%m-%d>   <author>   <summary>",
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "" },
        changedelete = { text = "│" },
        untracked = { text = "┆" },
      },

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        local function nmap(l, r, opts)
          map("n", l, r, opts)
        end

        -- Navigation
        nmap("]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        nmap("[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        -- Actions
        nmap("<leader>hs", gs.stage_hunk)
        nmap("<leader>hr", gs.reset_hunk)
        nmap("<leader>hS", gs.stage_buffer)
        nmap("<leader>hu", gs.undo_stage_hunk)
        nmap("<leader>hR", gs.reset_buffer)
        nmap("<leader>hp", gs.preview_hunk)
        nmap("<leader>hb", function()
          gs.blame_line({ full = true })
        end)
        nmap("<leader>hd", function()
          gs.toggle_deleted()
          gs.toggle_word_diff()
        end)
        nmap("<leader>hl", function()
          gs.toggle_numhl()
          gs.toggle_linehl()
        end)

        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    },
  },
}
