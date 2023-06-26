-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)

    -- plugin manager (packer)
    use("wbthomason/packer.nvim")

    -- lua functions that many plugins use
    use("nvim-lua/plenary.nvim")

    -- visuals
    use("folke/tokyonight.nvim") -- colorscheme
    use("nvim-lualine/lualine.nvim") -- statusline
    use("nvim-tree/nvim-tree.lua") -- file explorer
    use("kyazdani42/nvim-web-devicons") -- file icons
    use("nvim-treesitter/nvim-treesitter", {run = "TSUpdate"})

    -- navigation
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- better sorting performance
    use({ "nvim-telescope/telescope.nvim", branck = "0.1.x" }) -- telescope
    use("theprimeagen/harpoon")

    -- code editing
    use("numToStr/Comment.nvim") -- comments

    -- lsp
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},
            {
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            {"williamboman/mason-lspconfig.nvim"},

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-nvim-lua"},

            -- Snippets
            {"L3MON4D3/LuaSnip"},
            {"rafamadriz/friendly-snippets"},
        },
    }

    -- auto closing brackets
    use {
	    "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- latex
    use ("lervag/vimtex")

    -- autotags for html
    use ("windwp/nvim-ts-autotag")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
