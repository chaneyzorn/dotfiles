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
    use "liuchengxu/vim-which-key"
    -- 增强的状态栏
    use "vim-airline/vim-airline"
    -- 状态栏主题包
    use "vim-airline/vim-airline-themes"
    -- 颜色主题
    use "sainnhe/sonokai"
    -- 显示文件类型图标
    use "ryanoasis/vim-devicons"
    use "kyazdani42/nvim-web-devicons"
    -- 暗化非当前窗口（信息槽恢复存在问题，暂不使用）
    -- use "TaDaa/vimade"

    -- 显示出尾部的无用空格
    use "ntpeters/vim-better-whitespace"
    -- 彩虹显示匹配的括号
    use "luochen1990/rainbow"
    -- 显示字面颜色
    use "norcalli/nvim-colorizer.lua"
    -- 显示缩进线
    use "Yggdroot/indentLine"
    -- 高亮光标下相同的单词
    use "RRethy/vim-illuminate"

    -- 管理 fcitx 状态
    use "lilydjwg/fcitx.vim"
    -- 翻译插件
    use "voldikss/vim-translate-me"
    -- 拼写检查
    use "kamykn/spelunker.vim"

    -- 支持 editorconfig
    use "editorconfig/editorconfig-vim"
    -- 显示来自版本控制的修改状态
    use "mhinz/vim-signify"
    -- 集成 git 支持
    use "zivyangll/git-blame.vim"
    use "APZelos/blamer.nvim"
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

    -- 补全成对括号
    use "LunarWatcher/auto-pairs"
    -- 成对操作括号和引号等
    use "tpope/vim-surround"
    -- use "machakann/vim-sandwich"

    -- 多光标编辑操作
    use "mg979/vim-visual-multi"

    -- 拓展文本对象 textobj
    -- use "kana/vim-textobj-user"
    -- use "kana/vim-textobj-entire"
    -- use "kana/vim-textobj-line"
    -- use "glts/vim-textobj-comment"
    -- use "jceb/vim-textobj-uri"
    -- use "reedes/vim-textobj-sentence"
    -- use "michaeljsmith/vim-indent-object"
    -- use "jeetsukumaran/vim-pythonsense"
    -- use "wellle/targets.vim"

    -- 模糊搜索
    use {"Yggdroot/LeaderF", run = "./install.sh"}
    -- use "liuchengxu/vim-clap"

    -- 代码格式化
    use "sbdchd/neoformat"
    -- 快捷注释文本
    use "scrooloose/nerdcommenter"
    -- 全面而且统一的语法高亮和缩进
    use "sheerun/vim-polyglot"

    -- markdown enhance
    use "ferrine/md-img-paste.vim"
    use "mzlogin/vim-markdown-toc"
    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"}

    -- 代码片段支持
    use "SirVer/ultisnips"
    use "honza/vim-snippets"
    -- 代码文档
    use {"kkoomen/vim-doge", run = ":call doge#install()"}
    -- 自动排序 python import
    use {"fisadev/vim-isort", ft = "python"}

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
