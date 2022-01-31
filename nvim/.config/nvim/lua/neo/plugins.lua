-- Automatically install packer.nvim at bootstrapping
local pack_path = "/site/pack/packer/start/packer.nvim"
local install_path = vim.fn.stdpath("data") .. pack_path
local packer_repo = "https://github.com/wbthomason/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ "git", "clone", "--depth", "1", packer_repo, install_path })
end

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand
vim.cmd([[ autocmd BufWritePost plugins.lua PackerCompile ]])

local packer = require("packer")

packer.startup({
  function()
    local use = packer.use

    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- theme and icons
    use("sainnhe/sonokai")
    use("ryanoasis/vim-devicons")
    use("kyazdani42/nvim-web-devicons")

    -- editor content hints
    use("ntpeters/vim-better-whitespace")
    use("norcalli/nvim-colorizer.lua")
    use("lukas-reineke/indent-blankline.nvim")
    use("RRethy/vim-illuminate")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("p00f/nvim-ts-rainbow")

    -- cursor quickly move
    use("ggandor/lightspeed.nvim")
    use("tpope/vim-surround")

    -- status-line and buffer-line
    use("nvim-lualine/lualine.nvim")
    use("akinsho/nvim-bufferline.lua")

    -- editor evn function enhance
    use("folke/which-key.nvim")
    use("kyazdani42/nvim-tree.lua")
    use("liuchengxu/vista.vim")
    use("voldikss/vim-floaterm")
    use("voldikss/vim-translator")
    use("editorconfig/editorconfig-vim")
    use({ "lilydjwg/fcitx.vim", branch = "fcitx5" })
    use("kamykn/spelunker.vim")
    use("farmergreg/vim-lastplace")
    use("ervandew/supertab")
    use("lambdalisue/suda.vim")
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
      },
    })

    -- git integration
    use("tpope/vim-fugitive")
    use({
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    use("APZelos/blamer.nvim")
    use("sindrets/diffview.nvim")

    -- coding helper
    use("sbdchd/neoformat")
    use("numToStr/Comment.nvim")
    use("w0rp/ale")
    use({ "neoclide/coc.nvim", branch = "release" })
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
