local M = {}

function M.pre() end

function M.post()
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
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "﫠",
    },
    use_diagnostic_signs = false,
  })

  trouble.cspell_good = function()
    local line = vim.fn.getline(".")
    local word = string.match(line, "Unknown word %((.+)%) cspell")
    if word ~= nil or word ~= "" then
      vim.cmd("spellgood " .. word:lower())
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
    print(string.format("%s word(s) added to the %s.", count, spell_file))
  end
end

function M.keybind()
  local U = require("neo.tools")

  U.nmap("<Leader>kk", "<Cmd>TroubleToggle<CR>")
  U.nmap("<Leader>kw", "<Cmd>Trouble workspace_diagnostics<CR>")
  U.nmap("<Leader>kd", "<Cmd>Trouble document_diagnostics<CR>")
  U.nmap("<Leader>kl", "<Cmd>Trouble loclist<CR>")
  U.nmap("<Leader>kq", "<Cmd>Trouble quickfix<CR>")
  U.nmap("<Leader>kr", "<Cmd>Trouble lsp_references<CR>")

  require("neo.keybind").leader_help({
    kk = "诊断列表",
    kw = "全局诊断列表",
    kd = "当前文档诊断列表",
    kl = "Trouble loclist",
    kq = "Trouble quickfix",
    kr = "Trouble lsp_references",
  })
end

return M
