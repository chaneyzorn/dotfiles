local filter_do_spec = {
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
}

local devpath = vim.fs.abspath("~/Projects/iself/filter-do.nvim")
if vim.uv.fs_stat(devpath) then
  filter_do_spec = vim.tbl_deep_extend("force", filter_do_spec, { dir = devpath, dev = true })
else
  filter_do_spec = vim.tbl_deep_extend("force", { "chaneyzorn/filter-do.nvim" }, filter_do_spec)
end

return { filter_do_spec }
