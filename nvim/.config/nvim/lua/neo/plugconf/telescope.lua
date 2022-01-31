(function()
  local actions = require("telescope.actions")
  telescope = require("telescope")
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
      },
      file_ignore_patterns = { "node_modules/", ".git/" },
    },
    pickers = { find_files = { hidden = true } },
  })
end)("nvim-telescope/telescope.nvim")
