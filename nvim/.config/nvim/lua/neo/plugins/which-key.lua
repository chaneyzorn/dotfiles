return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      { "[b", "<cmd>bprevious<CR>", desc = "prev buffer" },
      { "]b", "<cmd>bnext<CR>", desc = "next buffer" },
      { "[t", "<cmd>tabprevious<CR>", desc = "prev tab" },
      { "]t", "<cmd>tabnext<CR>", desc = "next tab" },
      { "<C-c>", "<Esc><Cmd>quit<CR>", desc = "quit" },
      { "<C-s>", "<Esc><cmd>update<CR>", mode = { "n", "v", "i" }, desc = "save file" },

      -- move faster
      { "<C-j>", "3j", desc = "Move j faster" },
      { "<C-k>", "3k", desc = "Move k faster" },
      { "<M-j>", "5j", desc = "Move j more faster" },
      { "<M-k>", "5k", desc = "Move k more faster" },

      -- copy and paste
      { "<C-y>", [["+y]], mode = { "v" }, desc = "yank selected to sys-clip" },
      { "<C-p>", [["+p]], mode = { "n", "v" }, desc = "paste from sys-clip" },
    },
    config = function()
      local which_key_map = {}

      which_key_map.b = {
        ["name"] = "buffers",
        ["d"] = { "<Cmd>bdelete<CR>", "delete buffer" },
      }

      which_key_map.c = {
        ["name"] = "lsp/coding",
        ["k"] = { "<Cmd>set spell!<CR>", "Toggle spell check" },
      }

      which_key_map.f = {
        ["name"] = "diagnostic",
      }

      which_key_map.f = {
        ["name"] = "files/search",
      }

      which_key_map.g = {
        ["name"] = "lsp/trouble",
      }

      which_key_map.h = {
        ["name"] = "git",
      }

      which_key_map.k = {
        ["name"] = "trouble",
      }

      which_key_map.w = {
        ["name"] = "windows",
        ["p"] = { "<C-W>p", "pre window" },
        ["n"] = { "<Cmd>vnew<CR>", "new window" },
        ["c"] = { "<C-W>c", "close current window" },
        ["o"] = { "<C-W>o", "close other windows" },
        ["s"] = { "<C-W>s", "h split window" },
        ["v"] = { "<C-W>v", "v split window" },
        ["w"] = { "<C-W>w", "next window" },
        ["h"] = { "<C-W>h", "mv to left window" },
        ["j"] = { "<C-W>j", "mv to down window" },
        ["l"] = { "<C-W>l", "mv to right window" },
        ["k"] = { "<C-W>k", "mv to up window" },
        ["["] = { "<C-W>5<", "resize win<5" },
        ["]"] = { "<C-W>5>", "resize win>5" },
        ["="] = { "<Cmd>resize +5<CR>", "resize win+5" },
        ["-"] = { "<Cmd>resize -5<CR>", "resize win-5" },
        ["/"] = { "<C-W>=", "resize win==" },
      }

      which_key_map.t = {
        ["name"] = "tab/translate/tags",
        ["n"] = { "<Cmd>tabnew<CR>", "new tab" },
        ["c"] = { "<Cmd>tabclose<CR>", "close current tab" },
        ["o"] = { "<Cmd>tabonly<CR>", "close other tabs" },
        ["]"] = { "<Cmd>tabnext<CR>", "next tab" },
        ["["] = { "<Cmd>tabprevious<CR>", "pre tab" },
        ["f"] = { "<Cmd>tabfirst<CR>", "first tab" },
        ["l"] = { "<Cmd>tablast<CR>", "last tab" },
      }

      which_key_map.y = {
        ["name"] = "yank",
      }

      which_key_map.v = {
        ["name"] = "vim",
        ["m"] = {
          function()
            if vim.o.mouse == "" then
              vim.o.mouse = "a"
              vim.notify("[ToggleMouse] mouse enabled")
            else
              vim.o.mouse = ""
              vim.notify("[ToggleMouse] mouse disabled")
            end
          end,
          "toggle mouse",
        },
        ["q"] = { "<Cmd>wa<CR>:q<CR>", "save all and quit" },
        ["x"] = { "<Cmd>qa!<CR>", "quit without save" },
      }

      local wk = require("which-key")
      wk.register(which_key_map, { prefix = "<Leader>" })
    end,
  },
}
