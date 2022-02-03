local M = {}

function M.pre()
  local vg = vim.g
  vg.translator_default_engines = { "bing", "youdao", "haici" }
end

function M.post() end

function M.keybind()
  local U = require("neo.tools")
  -- 翻译光标下的文本，在命令行回显翻译内容
  U.nmap("<Leader>tw", "<Plug>Translate")
  U.vmap("<Leader>tw", "<Plug>TranslateV")
  -- 翻译光标下的文本，在窗口中显示翻译内容
  U.nmap("<Leader>ts", "<Plug>TranslateW")
  U.vmap("<Leader>ts", "<Plug>TranslateWV")
  U.nmap("<Leader>th", "<Plug>TranslateF")
  U.nmap("<Leader>tx", "<Plug>TranslateX")

  require("neo.keybind").leader_help({
    tw = "翻译单词",
    ts = "展示翻译",
    th = "翻译历史记录",
    tx = "翻译clipboard",
  })
end

return M
