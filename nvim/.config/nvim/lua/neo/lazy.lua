local M = {}

local ensure_lazy_nvim = function()
  -- ~/.local/share/nvim/lazy/lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

function M.setup()
  ensure_lazy_nvim()
  require("lazy").setup({
    spec = {
      { import = "neo.plugins" },
    },
    defaults = {
      cond = function(spec)
        return spec.vscode or not vim.g.vscode
      end,
    },
    change_detection = {
      enabled = false,
      notify = false,
    },
    ui = {
      border = "rounded",
    },
    rocks = {
      enabled = false,
      hererocks = true,
    },
  })
end

return M
