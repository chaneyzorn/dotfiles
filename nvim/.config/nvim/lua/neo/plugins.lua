local M = {}

M._pkgs = {
  -- Packer can manage itself
  { "wbthomason/packer.nvim" },
  -- theme and icons
  {
    "sainnhe/sonokai",
    apply_config = "colorscheme",
  },
  { "ryanoasis/vim-devicons" },
  { "kyazdani42/nvim-web-devicons" },

  -- editor content hints
  {
    "ntpeters/vim-better-whitespace",
    apply_config = "vim-better-whitespace",
  },
  {
    "norcalli/nvim-colorizer.lua",
    apply_config = "nvim-colorizer",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    apply_config = "indent-blankline",
  },
  {
    "RRethy/vim-illuminate",
    apply_config = "vim-illuminate",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    apply_config = "nvim-treesitter",
    run = ":TSUpdate",
  },
  { "p00f/nvim-ts-rainbow" },

  -- cursor quickly move
  { "ggandor/lightspeed.nvim" },
  { "tpope/vim-surround" },

  -- status-line and buffer-line
  {
    "nvim-lualine/lualine.nvim",
    apply_config = "lualine",
  },
  {
    "akinsho/nvim-bufferline.lua",
    apply_config = "nvim-bufferline",
  },

  -- editor evn function enhance
  { "folke/which-key.nvim" },
  {
    "kyazdani42/nvim-tree.lua",
    apply_config = "nvim-tree",
  },
  {
    "liuchengxu/vista.vim",
    apply_config = "vista",
  },
  {
    "voldikss/vim-floaterm",
    apply_config = "vim-floaterm",
  },
  {
    "voldikss/vim-translator",
    apply_config = "vim-translator",
  },
  { "editorconfig/editorconfig-vim" },
  {
    "lilydjwg/fcitx.vim",
    branch = "fcitx5",
  },
  {
    "kamykn/spelunker.vim",
    apply_config = "spelunker",
  },
  { "farmergreg/vim-lastplace" },
  {
    "ervandew/supertab",
    apply_config = "supertab",
  },
  {
    "lambdalisue/suda.vim",
    apply_config = "suda",
  },
  {
    "nvim-telescope/telescope.nvim",
    apply_config = "telescope",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
  },

  -- git integration
  { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    apply_config = "gitsigns",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "APZelos/blamer.nvim",
    apply_config = "blamer",
  },
  {
    "sindrets/diffview.nvim",
    apply_config = "diffview",
  },

  -- coding helper
  {
    "sbdchd/neoformat",
    apply_config = "neoformat",
  },
  {
    "numToStr/Comment.nvim",
    apply_config = "comment",
  },
  {
    "w0rp/ale",
    apply_config = "ale",
  },
  {
    "neoclide/coc.nvim",
    apply_config = "coc",
    branch = "release",
  },
}

function M.ensure_packer()
  -- Automatically install packer.nvim at bootstrapping
  local pack_path = "/site/pack/packer/start/packer.nvim"
  local install_path = vim.fn.stdpath("data") .. pack_path
  local packer_repo = "https://github.com/wbthomason/packer.nvim"

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "--depth", "1", packer_repo, install_path })
  end
end

function M.record_pkgs()
  require("packer").startup({
    function(use)
      use(M._pkgs)
    end,
    config = {
      max_jobs = 10,
      git = { clone_timeout = false },
      display = {
        working_sym = "🗘",
        prompt_border = "rounded",
        open_fn = function()
          return require("packer.util").float({ border = "rounded" })
        end,
      },
    },
  })
end

function M.pre_conf()
  for _, v in ipairs(M._pkgs) do
    if v.apply_config then
      require("neo.plugconf." .. v.apply_config).pre()
    end
  end
end

function M.setup()
  M.pre_conf()
  M.record_pkgs()
end

function M.post_conf()
  for _, v in ipairs(M._pkgs) do
    if v.apply_config then
      require("neo.plugconf." .. v.apply_config).post()
    end
  end
end

return M
