return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    init = function()
      vim.o.foldenable = false
      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr(v:lnum)"
    end,
    config = function()
      require("ibl").setup({
        indent = { char = "┊" },
        scope = {
          char = "│",
          show_start = false,
          show_end = false,
          -- useless and disable it
          enabled = false,
        },
      })
    end,
  },
}
