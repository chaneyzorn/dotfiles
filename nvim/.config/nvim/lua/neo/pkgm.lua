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
  D({
    "ryanoasis/vim-devicons",
    lazy = true,
  }),
  D({
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  }),

  -- editor content hints
  C({
    "ntpeters/vim-better-whitespace",
    event = "BufReadPre",
  }),
  C({
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
  }),
  C({
    "lukas-reineke/virt-column.nvim",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
  }),
  C({
    "lukas-reineke/indent-blankline.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  }),
  C({
    "RRethy/vim-illuminate",
    event = "BufReadPost",
  }),
  C({
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
  }),
  D({
    "p00f/nvim-ts-rainbow",
    event = "BufReadPre",
  }),
  -- C("levouh/tint.nvim"),
  C({
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPre",
  }),

  -- cursor quickly move
  D({
    "ggandor/lightspeed.nvim",
    event = "BufReadPre",
  }),
  -- C("ggandor/leap.nvim"),
  D({
    "tpope/vim-surround",
    event = "BufReadPre",
  }),
  C({
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  }),
  C({
    "declancm/cinnamon.nvim",
    event = "BufReadPre",
  }),

  -- status-line and buffer-line
  C({
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
  }),
  C({
    "akinsho/nvim-bufferline.lua",
    event = "BufReadPre",
  }),
  -- C("rcarriga/nvim-notify"),

  -- editor env function enhance
  D({
    "folke/which-key.nvim",
    event = "VeryLazy",
  }),
  C({
    "folke/todo-comments.nvim",
    event = "BufReadPost",
  }),
  C({
    "kyazdani42/nvim-tree.lua",
    cmd = {
      "NvimTreeToggle",
      "NvimTreeFindFile",
    },
  }),
  C({
    "liuchengxu/vista.vim",
    cmd = "Vista",
  }),
  C("voldikss/vim-floaterm"),
  C("voldikss/vim-translator"),
  D("editorconfig/editorconfig-vim"),
  D({
    "lilydjwg/fcitx.vim",
    branch = "fcitx5",
    event = "InsertEnter",
  }),
  D({
    "farmergreg/vim-lastplace",
    event = "BufReadPre",
  }),
  C("ervandew/supertab"),
  C({
    "lambdalisue/suda.vim",
    event = "CmdlineEnter",
  }),
  C({
    "phaazon/mind.nvim",
    branch = "v2.2",
  }),
  C({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
  }),

  -- git integration
  C({
    "tpope/vim-fugitive",
    event = "BufReadPre",
  }),
  C({
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
  }),
  C({
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
    },
  }),

  -- coding helper
  C({
    "numToStr/Comment.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
  }),

  C("neovim/nvim-lspconfig"),
  C("jose-elias-alvarez/null-ls.nvim"),
  C({
    "williamboman/mason.nvim",
    cmd = "Mason",
  }),
  D({
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
  }),
  C({
    "folke/trouble.nvim",
    cmd = {
      "Trouble",
      "TroubleToggle",
    },
  }),
  C({
    "j-hui/fidget.nvim",
    event = "VeryLazy",
  }),

  -- nvim-cmp
  D({
    "hrsh7th/cmp-nvim-lsp",
    event = "InsertEnter",
  }),
  D({
    "hrsh7th/cmp-buffer",
    event = "InsertEnter",
  }),
  D({
    "hrsh7th/cmp-path",
    event = "InsertEnter",
  }),
  D({
    "hrsh7th/cmp-cmdline",
    event = "CmdlineEnter",
  }),
  C({
    "hrsh7th/nvim-cmp",
    event = {
      "InsertEnter",
      "CmdlineEnter",
    },
  }),

  D({
    "saadparwaiz1/cmp_luasnip",
    event = "InsertEnter",
  }),
  D({
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  }),
  C({
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    event = "InsertEnter",
  }),
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
      pkg_spec._c = nil
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
