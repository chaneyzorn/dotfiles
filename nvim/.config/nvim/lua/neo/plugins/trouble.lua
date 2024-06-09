return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    keys = {
      { "<leader>kk", "<cmd>Trouble diagnostics toggle<CR>", desc = "Trouble diagnostics" },
      { "<leader>kl", "<cmd>Trouble loclist toggle<CR>", desc = "Trouble loclist" },
      { "<leader>kq", "<cmd>Trouble qflist toggle<CR>", desc = "Trouble quickfix" },
      { "<leader>kc", "<cmd>Trouble lsp toggle<CR>", desc = "Trouble code lsp" },
      { "<leader>ks", "<cmd>Trouble symbols toggle<CR>", desc = "Trouble symbols" },
    },
    config = function()
      local trouble = require("trouble")

      local cspell_good = function()
        local line = vim.fn.getline(".")
        local word = string.match(line, "Unknown word %((.+)%) cspell")
        if word ~= nil or word ~= "" then
          vim.cmd("spellgood " .. word:lower())
          -- only available after spellgood called
          local spell_file = vim.opt.spellfile:get()[1]
          os.execute(string.format("sort -u %s -o %s", spell_file, spell_file))
        end
      end

      local cspell_all_good = function()
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

        -- only available after spellgood called
        local spell_file = vim.opt.spellfile:get()[1]
        os.execute(string.format("sort -u %s -o %s", spell_file, spell_file))
        vim.notify(string.format("%s word(s) added to the %s.", count, spell_file))
      end

      trouble.setup({
        focus = true,
        keys = {
          f = {
            action = cspell_good,
            desc = "cspell good",
          },
          sg = {
            action = cspell_all_good,
            desc = "cspell all good",
          },
        },
      })
    end,
  },
}
