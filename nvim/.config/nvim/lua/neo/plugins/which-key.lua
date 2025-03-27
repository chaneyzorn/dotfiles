return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps",
      },
    },
    config = function()
      local wk = require("which-key")
      wk.setup({
        preset = "helix",
        icons = { mappings = false },
        sort = { "desc", "local", "order", "group", "alphanum", "mod", "lower", "icase" },
        spec = {
          -- one-key quick action, improve my daily usage
          { "<M-w>", "<C-W>w", desc = "next window" },

          -- quick action
          { "<C-c>", "<Esc><Cmd>close<CR>", desc = "quit" },
          { "<C-s>", "<Esc><cmd>update<CR>", mode = { "n", "v", "i" }, desc = "save file" },

          -- move faster
          { "<C-j>", "3j", desc = "move j faster" },
          { "<C-k>", "3k", desc = "move k faster" },
          { "<M-e>", "<C-e><C-e><C-e>", desc = "scroll down faster" },
          { "<M-y>", "<C-y><C-y><C-y>", desc = "scroll up faster" },

          -- leader group
          { "<leader>b", group = "buffer" },
          { "<leader>c", group = "coding" },
          { "<leader>f", group = "find" },
          { "<leader>g", group = "lsp" },
          { "<leader>h", group = "git" },
          { "<leader>k", group = "trouble" },
          { "<leader>l", group = "list" },
          { "<leader>t", group = "tag" },
          { "<leader>v", group = "vim" },
          { "<leader>w", group = "window" },

          -- window
          { "<leader>wp", "<C-W>p", desc = "pre window" },
          { "<leader>wn", "<Cmd>vnew<CR>", desc = "new window" },
          { "<leader>wc", "<C-W>c", desc = "close current window" },
          { "<leader>wo", "<C-W>o", desc = "close other windows" },
          { "<leader>ws", "<C-W>s", desc = "h split window" },
          { "<leader>wv", "<C-W>v", desc = "v split window" },
          { "<leader>ww", "<C-W>w", desc = "next window" },
          { "<leader>wh", "<C-W>h", desc = "mv to left window" },
          { "<leader>wj", "<C-W>j", desc = "mv to down window" },
          { "<leader>wl", "<C-W>l", desc = "mv to right window" },
          { "<leader>wk", "<C-W>k", desc = "mv to up window" },
          { "<leader>w[", "<C-W>5<", desc = "win width -5" },
          { "<leader>w]", "<C-W>5>", desc = "win width +5" },
          { "<leader>w=", "<Cmd>resize +5<CR>", desc = "win height +5" },
          { "<leader>w-", "<Cmd>resize -5<CR>", desc = "win height -5" },
          { "<leader>w/", "<C-W>=", desc = "resize win==" },

          -- tab
          { "<leader>tn", "<Cmd>tabnew<CR>", desc = "new tab" },
          { "<leader>tc", "<Cmd>tabclose<CR>", desc = "close current tab" },
          { "<leader>to", "<Cmd>tabonly<CR>", desc = "close other tabs" },
          { "<leader>tt", "<Cmd>tabnext<CR>", desc = "next tab" },
          { "<leader>tf", "<Cmd>tabfirst<CR>", desc = "first tab" },
          { "<leader>tl", "<Cmd>tablast<CR>", desc = "last tab" },

          -- vim
          {
            "<leader>vm",
            function()
              if vim.o.mouse == "" then
                vim.o.mouse = "a"
                vim.notify("[ToggleMouse] mouse enabled")
              else
                vim.o.mouse = ""
                vim.notify("[ToggleMouse] mouse disabled")
              end
            end,
            desc = "toggle mouse",
          },
          { "<leader>vq", "<Cmd>wa<CR>:q<CR>", desc = "save all and quit" },
          { "<leader>vs", "<Cmd>Lazy sync<CR>", desc = "Lazy sync" },
          { "<leader>vx", "<Cmd>qa!<CR>", desc = "quit without save" },

          -- vim copy and paste
          { "<leader>vy", [["+y]], mode = { "x" }, desc = "yank selected to sys-clip" },
          { "<leader>vp", [["+p]], mode = { "n", "v" }, desc = "paste from sys-clip" },
          -- { "<C-p>", [[<C-r>+]], mode = { "i", "c" }, desc = "paste from sys-clip" },
        },
      })
    end,
  },
}
