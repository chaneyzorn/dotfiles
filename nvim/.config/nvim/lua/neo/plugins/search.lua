return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      { "<leader>rg", "<cmd>GrugFar<CR>", desc = "Grug find and replace" },
    },
    config = function()
      require("grug-far").setup({
        disableBufferLineNumbers = false,
        startInInsertMode = false,
        normalModeSearch = true,
        wrap = false,
        resultsSeparatorLineChar = "─",
        icons = {
          actionEntryBullet = "  ",
        },
        engines = {
          ripgrep = {
            path = "rg",
            extraArgs = "--hidden",
          },
        },
        folding = {
          foldcolumn = "0",
        },
        helpLine = {
          enabled = false,
        },
      })
    end,
  },
}
