local U = require("neo.util")

return {
  U.use_dev_plugin("chaneyzorn/filter-do.nvim", "~/Projects/iself/filter-do.nvim", {
    cmd = "Fx",
    keys = {
      {
        "<leader>fx",
        function()
          require("filter_do.api").select_filter_do()
        end,
        mode = { "n", "v" },
        desc = "filter-do",
      },
    },
    config = function()
      require("filter_do").setup({
        tpl_exec = {
          ["line.lua"] = "nvim_lua",
          ["text.lua"] = "nvim_lua",
        },
        ui = {
          -- ui_select = "default",
          -- ui_select = "snacks.picker",
          -- ui_select = "telescope",
          -- ui_select = "mini.pick",
          -- ui_select = "auto",
          listchars = "extends:→,nbsp:␣,precedes:←,tab:»·,trail:∙,eol:¬,space:∙",
        },
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = { "FxUIOpenPost", "FxUIPreviousPost", "FxUINextPost" },
        callback = function(e)
          vim.api.nvim_set_option_value("winbar", "", { scope = "local", win = e.data.target_win_id })
        end,
      })
    end,
  }),

  U.use_dev_plugin("chaneyzorn/spellwand.nvim", "~/Projects/iself/spellwand.nvim", {
    init = function()
      vim.o.spell = false
      vim.o.spelllang = "en,cjk"
      vim.o.spelloptions = "camel"
      vim.o.spellfile = vim.fs.abspath("~/.config/nvim/spell/en.utf-8.add")
    end,
    config = function()
      vim.keymap.set("n", "zg", "zg<cmd>SpellwandRefresh!<cr>", { remap = false, desc = "Add word to spellfile" })
      vim.keymap.set("n", "zw", "zw<cmd>SpellwandRefresh!<cr>", { remap = false, desc = "Mark word as bad" })
    end,
  }),
}
