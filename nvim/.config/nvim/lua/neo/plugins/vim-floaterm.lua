return {
  {
    "voldikss/vim-floaterm",
    event = "VeryLazy",
    init = function()
      local vg = vim.g

      -- floaterm 快捷键配置
      vg.floaterm_keymap_new = "<Leader>tr"
      vg.floaterm_keymap_prev = "<Leader>["
      vg.floaterm_keymap_next = "<Leader>]"
      vg.floaterm_keymap_toggle = "<Leader>tt"

      require("neo.keybind").leader_help({
        tt = "切入切出浮窗终端",
        tr = "创建新浮窗终端",
      })
    end,
  },
}
