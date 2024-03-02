return {
  {
    "folke/trouble.nvim",
    cmd = {
      "Trouble",
      "TroubleToggle",
    },
    keys = {
      { "<leader>kk", "<cmd>TroubleToggle<CR>", desc = "TroubleToggle" },
      { "<leader>kw", "<cmd>Trouble workspace_diagnostics<CR>", desc = "Trouble wksp diag" },
      { "<leader>kd", "<cmd>Trouble document_diagnostics<CR>", desc = "Trouble doc diag" },
      { "<leader>kl", "<cmd>Trouble loclist<CR>", desc = "Trouble loclist" },
      { "<leader>kq", "<cmd>Trouble quickfix<CR>", desc = "Trouble quickfix" },
      { "<leader>kr", "<cmd>Trouble lsp_references<CR>", desc = "Trouble lsp ref" },
      { "<leader>kg", "<cmd>Trouble lsp_definitions<CR>", desc = "Trouble lsp def" },
      { "<leader>kt", "<cmd>Trouble lsp_type_definitions<CR>", desc = "Trouble lsp type" },
    },
    config = function()
      local trouble = require("trouble")
      trouble.setup({
        position = "bottom",
        height = 10,
        width = 50,
        icons = true,
        mode = "document_diagnostics",
        fold_open = "",
        fold_closed = "",
        group = true,
        padding = true,
        indent_lines = true,
        auto_open = false,
        auto_close = false,
        auto_preview = true,
        auto_fold = false,
        auto_jump = { "lsp_definitions" },
        action_keys = {
          cspell_good = "f",
          cspell_all_good = "sg",
        },
        signs = {
          error = "󰅚",
          warning = "",
          hint = "󰌶",
          information = "",
          other = "󰗡",
        },
        use_diagnostic_signs = false,
      })

      trouble.cspell_good = function()
        local line = vim.fn.getline(".")
        local word = string.match(line, "Unknown word %((.+)%) cspell")
        if word ~= nil or word ~= "" then
          vim.cmd("spellgood " .. word:lower())
          local spell_file = vim.opt.spellfile:get()[1]
          os.execute(string.format("sort -u %s -o %s", spell_file, spell_file))
        end
      end

      trouble.cspell_all_good = function()
        local words = {}
        for _, item in pairs(trouble.get_items()) do
          if item.source == "cspell" then
            local word = string.match(item.text, "Unknown word %((.+)%)")
            if word ~= nil or word ~= "" then
              words[word:lower()] = true
            end
          end
        end

        if vim.tbl_isempty(words) then
          return
        end

        local count = 0
        for word, _ in pairs(words) do
          vim.cmd("silent! spellgood " .. word)
          count = count + 1
        end

        local spell_file = vim.opt.spellfile:get()[1]
        os.execute(string.format("sort -u %s -o %s", spell_file, spell_file))
        print(string.format("%s word(s) added to the %s.", count, spell_file))
      end
    end,
  },
}
