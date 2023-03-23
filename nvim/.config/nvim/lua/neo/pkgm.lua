local M = {}

local C = function(plug, conf)
  if type(plug) == "string" then
    plug = { plug }
  end

  if conf then
    plug._c = conf
  else
    local conf_name = vim.split(plug[1], "/")
    conf_name = vim.split(conf_name[#conf_name], ".", { plain = true })
    plug._c = conf_name[1]:lower()
  end

  return plug
end

local D = function(plug)
  if type(plug) == "string" then
    plug = { plug }
  end

  return plug
end

local pkgs = {
  -- lazy.nvim does same things
  -- D("lewis6991/impatient.nvim"),

  -- theme and icons
  D("sainnhe/sonokai"),
  C({
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  }, "colorscheme"),
  D("ryanoasis/vim-devicons"),
  D("kyazdani42/nvim-web-devicons"),

  -- editor content hints
  C("ntpeters/vim-better-whitespace"),
  C("norcalli/nvim-colorizer.lua"),
  C("lukas-reineke/virt-column.nvim"),
  C("lukas-reineke/indent-blankline.nvim"),
  C("RRethy/vim-illuminate"),
  C({ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }),
  D("p00f/nvim-ts-rainbow"),
  C("levouh/tint.nvim"),
  C({
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
  }),

  -- cursor quickly move
  D("ggandor/lightspeed.nvim"),
  -- C("ggandor/leap.nvim"),
  D("tpope/vim-surround"),
  C("windwp/nvim-autopairs"),
  C("declancm/cinnamon.nvim"),

  -- status-line and buffer-line
  C("nvim-lualine/lualine.nvim"),
  C("akinsho/nvim-bufferline.lua"),
  C("rcarriga/nvim-notify"),

  -- editor env function enhance
  D("folke/which-key.nvim"),
  C("folke/todo-comments.nvim"),
  C("kyazdani42/nvim-tree.lua"),
  C("liuchengxu/vista.vim"),
  C("voldikss/vim-floaterm"),
  C("voldikss/vim-translator"),
  D("editorconfig/editorconfig-vim"),
  D({ "lilydjwg/fcitx.vim", branch = "fcitx5" }),
  D("farmergreg/vim-lastplace"),
  C("ervandew/supertab"),
  C("lambdalisue/suda.vim"),
  C({ "phaazon/mind.nvim", branch = "v2.2" }),
  C({
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
  }),

  -- git integration
  C("tpope/vim-fugitive"),
  C("lewis6991/gitsigns.nvim"),
  C("sindrets/diffview.nvim"),

  -- coding helper
  C("numToStr/Comment.nvim"),

  C("neovim/nvim-lspconfig"),
  C("jose-elias-alvarez/null-ls.nvim"),
  C("williamboman/mason.nvim"),
  D("williamboman/mason-lspconfig.nvim"),
  C("folke/trouble.nvim"),
  C("j-hui/fidget.nvim"),

  -- nvim-cmp
  D("hrsh7th/cmp-nvim-lsp"),
  D("hrsh7th/cmp-buffer"),
  D("hrsh7th/cmp-path"),
  D("hrsh7th/cmp-cmdline"),
  C("hrsh7th/nvim-cmp"),

  D("saadparwaiz1/cmp_luasnip"),
  D("rafamadriz/friendly-snippets"),
  C("L3MON4D3/LuaSnip"),
}

local ensure_lazy_nvim = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
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
  return M
end

local gen_pkg_specs = function()
  local plugs = {}
  for _, pkg in ipairs(pkgs) do
    if pkg._c then
      local conf = require("neo.plugconf." .. pkg._c)
      local pkg_spec = vim.tbl_extend("force", pkg, {
        init = function()
          conf.pre()
          conf.keybind()
        end,
        config = function()
          conf.post()
        end,
      })
      table.insert(plugs, pkg_spec)
    else
      table.insert(plugs, pkg)
    end
  end
  return plugs
end

function M.setup()
  ensure_lazy_nvim()
  require("lazy").setup(gen_pkg_specs())
end

return M
