-- init.lua

require("neo.setting")
require("neo.neovide")

if vim.g.vscode then
  -- VSCode extension
else
  require("neo.lazy").setup()
end
