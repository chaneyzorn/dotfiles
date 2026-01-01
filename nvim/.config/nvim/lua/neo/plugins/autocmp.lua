return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    event = {
      "InsertEnter",
      "CmdlineEnter",
    },
    version = "*",
    opts = {
      keymap = {
        preset = "none",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "cancel" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "scroll_documentation_down", "fallback" },
        ["<C-k>"] = { "scroll_documentation_up", "fallback" },
        ["<C-n>"] = { "snippet_forward", "fallback" },
        ["<C-p>"] = { "snippet_backward", "fallback" },
      },
      completion = {
        list = {
          selection = { preselect = false, auto_insert = true },
        },
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind", gap = 1 },
              { "source_name" },
            },
            treesitter = { "lsp" },
          },
        },
        documentation = {
          window = { border = "rounded" },
        },
      },
      signature = {
        enabled = true,
        window = { border = "rounded" },
      },
      sources = {
        providers = {
          lsp = { fallbacks = {}, async = true },
          path = { fallbacks = {} },
          buffer = {
            opts = {
              get_bufnrs = vim.api.nvim_list_bufs,
            },
          },
        },
      },
      cmdline = {
        keymap = {
          preset = "none",
          ["<Tab>"] = { "show_and_insert", "select_next" },
          ["<S-Tab>"] = { "show_and_insert", "select_prev" },
          ["<C-space>"] = { "show", "fallback" },
          ["<C-n>"] = { "select_next", "fallback" },
          ["<C-p>"] = { "select_prev", "fallback" },
          ["<C-y>"] = { "select_and_accept" },
          ["<C-e>"] = { "cancel" },
        },
        completion = {
          list = {
            selection = { preselect = false, auto_insert = true },
          },
          menu = { auto_show = true },
        },
      },
    },
  },
}
