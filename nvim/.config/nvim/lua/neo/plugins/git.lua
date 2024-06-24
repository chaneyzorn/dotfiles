return {
  {
    "tpope/vim-fugitive",
    event = "BufReadPre",
    cmd = "Git",
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
    cmd = "Gitsigns",
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
        end, { expr = true, desc = "Git next hunk" })

        nmap("[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Git prev hunk" })

        -- Actions
        nmap("<leader>hs", gs.stage_hunk, { desc = "Git stage hunk" })
        nmap("<leader>hr", gs.reset_hunk, { desc = "Git reset hunk" })
        nmap("<leader>hS", gs.stage_buffer, { desc = "Git stage buffer" })
        nmap("<leader>hu", gs.undo_stage_hunk, { desc = "Git undo stage hunk" })
        nmap("<leader>hR", gs.reset_buffer, { desc = "Git reset buffer" })
        nmap("<leader>hp", gs.preview_hunk, { desc = "Git preview hunk" })

        nmap("<leader>hb", function()
          gs.blame_line({ full = true })
        end, { desc = "Git blame line" })
        nmap("<leader>hB", function()
          gs.blame()
        end, { desc = "Git blame file" })

        nmap("<leader>hd", function()
          gs.toggle_deleted()
          gs.toggle_word_diff()
        end, { desc = "Git show diff" })

        nmap("<leader>hl", function()
          gs.toggle_numhl()
          gs.toggle_linehl()
        end, { desc = "Git highlight changes" })

        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Git stage selected" })

        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Git reset selected" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Git select hunk" })
      end,
    },
  },
}
