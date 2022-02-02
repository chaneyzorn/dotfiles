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

M._pkgs = {
  -- Packer can manage itself
  D("wbthomason/packer.nvim"),

  -- theme and icons
  C("sainnhe/sonokai", "colorscheme"),
  D("ryanoasis/vim-devicons"),
  D("kyazdani42/nvim-web-devicons"),

  -- editor content hints
  C("ntpeters/vim-better-whitespace"),
  C("norcalli/nvim-colorizer.lua"),
  C("lukas-reineke/indent-blankline.nvim"),
  C("RRethy/vim-illuminate"),
  C({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }),
  D("p00f/nvim-ts-rainbow"),

  -- cursor quickly move
  D("ggandor/lightspeed.nvim"),
  D("tpope/vim-surround"),

  -- status-line and buffer-line
  C("nvim-lualine/lualine.nvim"),
  C("akinsho/nvim-bufferline.lua"),

  -- editor evn function enhance
  D("folke/which-key.nvim"),
  C("kyazdani42/nvim-tree.lua"),
  C("liuchengxu/vista.vim"),
  C("voldikss/vim-floaterm"),
  C("voldikss/vim-translator"),
  D("editorconfig/editorconfig-vim"),
  D({
    "lilydjwg/fcitx.vim",
    branch = "fcitx5",
  }),
  C("kamykn/spelunker.vim"),
  D("farmergreg/vim-lastplace"),
  C("ervandew/supertab"),
  C("lambdalisue/suda.vim"),
  C({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
  }),

  -- git integration
  D("tpope/vim-fugitive"),
  C({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }),
  C("APZelos/blamer.nvim"),
  C("sindrets/diffview.nvim"),

  -- coding helper
  C("sbdchd/neoformat"),
  C("numToStr/Comment.nvim"),
  C("w0rp/ale"),
  C({
    "neoclide/coc.nvim",
    branch = "release",
  }),
}

function M.ensure_packer()
  -- Automatically install packer.nvim at bootstrapping
  local pack_path = "/site/pack/packer/start/packer.nvim"
  local install_path = vim.fn.stdpath("data") .. pack_path
  local packer_repo = "https://github.com/wbthomason/packer.nvim"

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    return vim.fn.system({ "git", "clone", "--depth", "1", packer_repo, install_path })
  end

  return false
end

function M.record_pkgs()
  require("packer").startup({
    function(use)
      use(M._pkgs)
      if M.ensure_packer() then
        require("packer").sync()
      end
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
    if v._c then
      require("neo.plugconf." .. v._c).pre()
    end
  end
end

function M.setup()
  M.pre_conf()
  M.record_pkgs()
end

function M.post_conf()
  for _, v in ipairs(M._pkgs) do
    if v._c then
      require("neo.plugconf." .. v._c).post()
    end
  end
end

return M
