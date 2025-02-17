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
          buffer = {
            name = "Buffer",
            module = "blink.cmp.sources.buffer",
            score_offset = -3,
            opts = {
              get_bufnrs = function()
                return vim.iter(vim.api.nvim_list_bufs()):totable()
              end,
            },
          },
        },
      },
    },
  },
}
