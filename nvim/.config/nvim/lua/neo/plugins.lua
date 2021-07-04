-- Automatically install packer.nvim at bootstrapping
local pack_path = "/site/pack/packer/opt/packer.nvim"
local install_path = vim.fn.stdpath("data") .. pack_path
local packer_repo = "https://github.com/wbthomason/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd(table.concat({"!git clone", packer_repo, install_path}, " "))
end

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

local packer = require("packer")

packer.startup({
  function()
    local use = packer.use

    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}

    -- 指示快捷键
    use "folke/which-key.nvim"
    -- 增强的状态栏
    use "vim-airline/vim-airline"
    -- 状态栏主题包
    use "vim-airline/vim-airline-themes"
    -- 增强标签页栏
    use "akinsho/nvim-bufferline.lua"
    -- 颜色主题
    use "sainnhe/sonokai"
    -- 显示文件类型图标
    use "ryanoasis/vim-devicons"
    use "kyazdani42/nvim-web-devicons"

    -- 显示出尾部的无用空格
    use "ntpeters/vim-better-whitespace"
    -- 彩虹显示匹配的括号
    use "luochen1990/rainbow"
    -- 显示字面颜色
    use "norcalli/nvim-colorizer.lua"
    -- 显示缩进线
    use "lukas-reineke/indent-blankline.nvim"
    -- 高亮光标下相同的单词
    use "RRethy/vim-illuminate"

    -- 管理 fcitx 状态
    use {"lilydjwg/fcitx.vim", branch = "fcitx5"}
    -- 翻译插件
    use "voldikss/vim-translate-me"
    -- 拼写检查
    use "kamykn/spelunker.vim"
    -- 支持 editorconfig
    use "editorconfig/editorconfig-vim"

    -- 集成 git 支持
    -- 信号槽显示来自版本控制的修改状态, diff 跳转与显示
    use "mhinz/vim-signify"
    -- 在状态栏下面显示 git 信息
    use "zivyangll/git-blame.vim"
    -- 在当前行显示 git 信息
    use "APZelos/blamer.nvim"
    -- 在 vim 中发起 git 命令
    use "tpope/vim-fugitive"

    -- 显示目录树
    use "kyazdani42/nvim-tree.lua"
    -- 侧栏显示文件结构大纲
    use "liuchengxu/vista.vim"
    -- terminal 增强
    use "voldikss/vim-floaterm"

    -- 记忆上次文件位置
    use "farmergreg/vim-lastplace"
    -- 在所有的补全列表中使用 <tag> 导航
    use "ervandew/supertab"
    -- 提权保存文件
    use "lambdalisue/suda.vim"
    -- 快速移动
    use "easymotion/vim-easymotion"
    -- use "phaazon/hop.nvim"

    -- 成对操作括号和引号等
    use "tpope/vim-surround"
    -- use "machakann/vim-sandwich"

    -- 模糊搜索
    use {"Yggdroot/LeaderF", run = "./install.sh"}
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
    }

    -- 代码格式化
    use "sbdchd/neoformat"
    -- 快捷注释文本
    use "scrooloose/nerdcommenter"
    -- 全面而且统一的语法高亮和缩进
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- 提供 golang 支持
    use {"fatih/vim-go", run = ":GoUpdateBinaries", ft = "go"}

    -- 语法检查
    use "w0rp/ale"
    -- 自动补全, lsp-client
    use {"neoclide/coc.nvim", branch = "release"}
  end,
  config = {
    git = {clone_timeout = false},
    display = {working_sym = "🗘", open_fn = require("packer.util").float},
  },
})
