return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    keys = {
      { "<leader>kk", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Trouble diagnostics (current)" },
      { "<leader>ke", "<cmd>Trouble diagnostics toggle<CR>", desc = "Trouble diagnostics (workspace)" },
      { "<leader>kl", "<cmd>Trouble loclist toggle<CR>", desc = "Trouble loclist" },
      { "<leader>kq", "<cmd>Trouble qflist toggle<CR>", desc = "Trouble quickfix" },
      { "<leader>kc", "<cmd>Trouble lsp toggle<CR>", desc = "Trouble code lsp" },
      { "<leader>ks", "<cmd>Trouble symbols toggle<CR>", desc = "Trouble symbols" },
    },
    config = function()
      require("trouble").setup({
        focus = true,
        win = {
          type = "split",
          relative = "win",
          position = "bottom",
        },
      })
    end,
  },
}
