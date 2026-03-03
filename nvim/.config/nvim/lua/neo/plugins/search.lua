return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      { "<leader>rg", "<cmd>GrugFar<CR>", desc = "Grug find and replace" },
    },
    config = function()
      require("grug-far").setup({
        showCompactInputs = true,
        showInputsTopPadding = false,
        showInputsBottomPadding = false,
        helpLine = {
          enabled = false,
        },
        startInInsertMode = false,
        normalModeSearch = true,
        wrap = false,
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
          enabled = false,
          foldcolumn = "0",
        },
        windowCreationCommand = "tab split",
        openTargetWindow = {
          preferredLocation = "right",
        },
      })
    end,
  },
}
